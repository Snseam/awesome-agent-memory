#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"
require "English"
require "set"
require "shellwords"

ROOT = File.expand_path("..", __dir__)

def read(path)
  File.read(File.join(ROOT, path))
end

def fail_check(message)
  warn "ERROR: #{message}"
  exit 1
end

def assert(condition, message)
  fail_check(message) unless condition
end

def badge_count(markdown, label)
  escaped = Regexp.escape(label)
  match = markdown.match(%r{img\.shields\.io/badge/#{escaped}-(\d+)-})
  match && match[1].to_i
end

def tracked_files(pattern)
  output = `git -C #{Shellwords.escape(ROOT)} ls-files -- #{Shellwords.escape(pattern)}`
  fail_check("git ls-files failed for #{pattern}") unless $CHILD_STATUS.success?

  output.lines.map(&:strip).reject(&:empty?).map { |path| File.join(ROOT, path) }
end

def all_tracked_files
  output = `git -C #{Shellwords.escape(ROOT)} ls-files`
  fail_check("git ls-files failed") unless $CHILD_STATUS.success?

  output.lines.map(&:strip).reject(&:empty?).map { |path| File.join(ROOT, path) }
end

def repo_files(*patterns)
  patterns.flat_map { |pattern| tracked_files(pattern) }
          .uniq
          .select { |path| File.file?(path) }
end

def tracked_file_index
  @tracked_file_index ||= all_tracked_files
                          .select { |path| File.file?(path) }
                          .map { |path| File.expand_path(path) }
                          .to_set
end

def tracked_directory_index
  @tracked_directory_index ||= begin
    dirs = Set.new
    tracked_file_index.each do |path|
      dir = File.dirname(path)
      while dir.start_with?(ROOT)
        dirs << dir
        break if dir == ROOT

        dir = File.dirname(dir)
      end
    end
    dirs
  end
end

def tracked_repo_target?(path)
  normalized = File.expand_path(path)
  tracked_file_index.include?(normalized) || tracked_directory_index.include?(normalized)
end

def files_in_dir(relative_dir, pattern)
  dir = File.join(ROOT, relative_dir)
  repo_files(pattern).select { |path| File.dirname(path) == dir }
end

def count_benchmark_rows
  read("benchmarks/index.md").lines.count do |line|
    line.start_with?("| ") &&
      !line.include?("---") &&
      !line.start_with?("| Benchmark |")
  end
end

def count_product_notes
  files_in_dir("products", "products/*.md").count do |path|
    base = File.basename(path)
    base != "README.md" && !base.start_with?("_")
  end
end

def count_product_archives
  files_in_dir("products/archives", "products/archives/*.md").count do |path|
    File.basename(path) != "README.md"
  end
end

def count_pdfs
  files_in_dir("papers/pdfs", "papers/pdfs/*").count
end

def count_stubs
  files_in_dir("papers/stubs", "papers/stubs/*.md").count
end

def paper_note_files
  files_in_dir("papers", "papers/*.md").select do |path|
    File.basename(path) != "index.md" &&
      !File.basename(path).start_with?("_")
  end
end

def paper_status_counts
  paper_note_files.each_with_object(Hash.new(0)) do |path, counts|
    status = extract_front_matter_value(path, "status")
    counts[status] += 1 if %w[full seed].include?(status)
  end
end

def check_paper_note_statuses
  invalid = paper_note_files.each_with_object([]) do |path, rows|
    status = extract_front_matter_value(path, "status")
    next if %w[full seed].include?(status)

    rows << "#{path.delete_prefix("#{ROOT}/")}: #{status || "(missing)"}"
  end

  assert(invalid.empty?, "paper notes with invalid status values:\n#{invalid.join("\n")}")
end

def paper_total_from_index
  read("papers/index.md")[/Total unique papers:\s*(\d+)/, 1]&.to_i
end

def scan_conflict_markers
  files = repo_files(
    "README.md",
    "README_cn.md",
    "docs/**/*.md",
    "docs/**/*.yml",
    "docs/**/*.yaml",
    "benchmarks/**/*.md",
    "benchmarks/**/*.yml",
    "benchmarks/**/*.yaml",
    "products/**/*.md",
    "products/**/*.yml",
    "products/**/*.yaml",
    "papers/**/*.md",
    "papers/**/*.yml",
    "papers/**/*.yaml",
    "impact-reports/**/*.md",
    "impact-reports/**/*.yml",
    "impact-reports/**/*.yaml"
  )

  offenders = files.select do |path|
    body = File.read(path)
    body.lines.any? { |line| line.match?(/\A(?:<{7}|={7}|>{7})(?:\s|$)/) }
  end

  assert(offenders.empty?, "conflict markers found in #{offenders.map { |p| p.delete_prefix("#{ROOT}/") }.join(", ")}")
end

def check_yaml
  YAML.load_file(File.join(ROOT, "benchmarks", "claims", "claims.yaml"))
end

def check_counts
  readme = read("README.md")
  readme_cn = read("README_cn.md")
  status_counts = paper_status_counts
  full_notes = status_counts.fetch("full", 0)
  seed_notes = status_counts.fetch("seed", 0)

  expected = {
    "papers" => paper_total_from_index,
    "local_PDFs" => count_pdfs,
    "memory%20products" => count_product_notes,
    "benchmarks" => count_benchmark_rows
  }

  expected.each do |label, value|
    assert(!value.nil?, "could not calculate expected count for #{label}")
    assert(badge_count(readme, label) == value, "README.md badge #{label} is not #{value}")
    assert(badge_count(readme_cn, label) == value, "README_cn.md badge #{label} is not #{value}")
  end

  checks = {
    "README.md" => [
      ["paper note status counts", /#{full_notes}\s+full\s+\+\s+#{seed_notes}\s+seed/],
      ["paper tree status counts", /#{full_notes}\s+full paper notes,\s+#{seed_notes}\s+seed notes/],
      ["paper stub count", /#{count_stubs}\s+stubs\b/],
      ["product note count", /#{count_product_notes}\s+notes\b/],
      ["product archive count", /#{count_product_archives}\s+snapshots\b/],
      ["benchmark catalog row count", /#{count_benchmark_rows}\s+catalog rows\b/],
      ["benchmark tree row count", /#{count_benchmark_rows}\s+benchmark catalog rows\b/]
    ],
    "README_cn.md" => [
      ["paper note status counts", /#{full_notes}\s+个 full\s+\+\s+#{seed_notes}\s+个 seed/],
      ["paper tree status counts", /#{full_notes}\s+个 full 论文笔记、#{seed_notes}\s+个 seed 笔记/],
      ["paper stub count", /#{count_stubs}\s+个 stub\b/],
      ["product note count", /#{count_product_notes}\s+个笔记/],
      ["product archive count", /#{count_product_archives}\s+个快照/],
      ["benchmark catalog row count", /#{count_benchmark_rows}\s+个 catalog 行/],
      ["benchmark tree row count", /#{count_benchmark_rows}\s+个 benchmark catalog 行/]
    ]
  }

  checks.each do |file, expectations|
    body = read(file)
    expectations.each do |description, pattern|
      assert(body.match?(pattern), "#{file} missing synchronized #{description}")
    end
  end
end

def extract_front_matter_value(path, key)
  body = File.read(path)
  body[/^#{Regexp.escape(key)}:\s*(.+)$/, 1]&.strip
end

def check_duplicates
  claims = YAML.load_file(File.join(ROOT, "benchmarks", "claims", "claims.yaml"))
  event_ids = claims.fetch("events").map { |event| event.fetch("event_id") }
  dup_events = event_ids.group_by(&:itself).select { |_id, rows| rows.size > 1 }
  assert(dup_events.empty?, "duplicate benchmark claim event_ids: #{dup_events.keys.join(", ")}")

  benchmark_files = files_in_dir("benchmarks", "benchmarks/*.md")
                    .reject { |path| File.basename(path) == "_template.md" }
  product_files = files_in_dir("products", "products/*.md")

  benchmark_ids = benchmark_files
                  .reject { |path| File.basename(path) == "_template.md" }
                  .map { |path| [extract_front_matter_value(path, "benchmark_id"), path] }
                  .reject { |value, _path| value.nil? || value.empty? }
  dup_benchmarks = benchmark_ids.group_by(&:first).select { |_id, rows| rows.size > 1 }
  assert(dup_benchmarks.empty?, "duplicate benchmark_ids: #{dup_benchmarks.keys.join(", ")}")

  benchmark_titles = benchmark_files
                     .map { |path| [extract_front_matter_value(path, "title"), path] }
                     .reject { |value, _path| value.nil? || value.empty? }
  dup_benchmark_titles = benchmark_titles.group_by { |value, _path| value.downcase }.select { |_value, rows| rows.size > 1 }
  assert(dup_benchmark_titles.empty?, "duplicate benchmark titles: #{dup_benchmark_titles.keys.join(", ")}")

  benchmark_names = benchmark_files
                    .map { |path| [extract_front_matter_value(path, "name"), path] }
                    .reject { |value, _path| value.nil? || value.empty? }
  dup_benchmark_names = benchmark_names.group_by { |value, _path| value.downcase }.select { |_value, rows| rows.size > 1 }
  assert(dup_benchmark_names.empty?, "duplicate benchmark names: #{dup_benchmark_names.keys.join(", ")}")

  product_titles = product_files
                   .map { |path| [extract_front_matter_value(path, "title"), path] }
                   .reject { |value, _path| value.nil? || value.empty? }
  dup_product_titles = product_titles.group_by { |value, _path| value.downcase }.select { |_value, rows| rows.size > 1 }
  assert(dup_product_titles.empty?, "duplicate product titles: #{dup_product_titles.keys.join(", ")}")

  product_ids = product_files.map do |path|
    explicit_id = extract_front_matter_value(path, "product_id")
    [explicit_id || File.basename(path, ".md"), path]
  end.reject { |value, _path| value.nil? || value.empty? }
  dup_product_ids = product_ids.group_by { |value, _path| value.downcase }.select { |_value, rows| rows.size > 1 }
  assert(dup_product_ids.empty?, "duplicate product ids/slugs: #{dup_product_ids.keys.join(", ")}")
end

def check_local_markdown_links
  files = repo_files(
    "*.md",
    "docs/**/*.md",
    "benchmarks/**/*.md",
    "products/**/*.md",
    "papers/**/*.md",
    "impact-reports/**/*.md"
  )

  missing = []
  files.each do |path|
    body = File.read(path)
    body.scan(/(?<!!)\[[^\]]+\]\(([^)]+)\)/).flatten.each do |raw_target|
      target = raw_target.split(/[ #]/, 2).first
      next if target.nil? || target.empty?
      next if target.match?(/\A(?:https?:|mailto:|#)/)

      candidate = File.expand_path(target, File.dirname(path))
      missing << "#{path.delete_prefix("#{ROOT}/")}: #{raw_target}" unless tracked_repo_target?(candidate)
    end
  end

  assert(missing.empty?, "missing local markdown links:\n#{missing.join("\n")}")
end

scan_conflict_markers
check_yaml
check_paper_note_statuses
check_counts
check_duplicates
check_local_markdown_links

puts "verify_memory_refresh passed"
status_counts = paper_status_counts
puts "papers=#{paper_total_from_index} pdfs=#{count_pdfs} stubs=#{count_stubs} full_notes=#{status_counts.fetch("full", 0)} seed_notes=#{status_counts.fetch("seed", 0)} products=#{count_product_notes} product_archives=#{count_product_archives} benchmarks=#{count_benchmark_rows}"
