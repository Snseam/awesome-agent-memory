#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"
require "English"
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
  output = `git -C #{Shellwords.escape(ROOT)} ls-files #{Shellwords.escape(pattern)}`
  fail_check("git ls-files failed for #{pattern}") unless $CHILD_STATUS.success?

  output.lines.map(&:strip).reject(&:empty?).map { |path| File.join(ROOT, path) }
end

def count_benchmark_rows
  read("benchmarks/index.md").lines.count do |line|
    line.start_with?("| ") &&
      !line.include?("---") &&
      !line.start_with?("| Benchmark |")
  end
end

def count_product_notes
  Dir[File.join(ROOT, "products", "*.md")].count do |path|
    base = File.basename(path)
    base != "README.md" && !base.start_with?("_")
  end
end

def count_product_archives
  Dir[File.join(ROOT, "products", "archives", "*.md")].count do |path|
    File.basename(path) != "README.md"
  end
end

def count_pdfs
  Dir[File.join(ROOT, "papers", "pdfs", "*")].count { |path| File.file?(path) }
end

def count_stubs
  Dir[File.join(ROOT, "papers", "stubs", "*.md")].count
end

def paper_total_from_index
  read("papers/index.md")[/Total unique papers:\s*(\d+)/, 1]&.to_i
end

def scan_conflict_markers
  files = Dir[
    File.join(ROOT, "{README.md,README_cn.md}"),
    File.join(ROOT, "{docs,benchmarks,products,papers,impact-reports}", "**", "*.{md,yml,yaml}")
  ]

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
      "#{count_stubs} stubs",
      "#{count_product_notes} notes",
      "#{count_product_archives} snapshots",
      "#{count_benchmark_rows} catalog rows",
      "#{count_benchmark_rows} benchmark catalog rows"
    ],
    "README_cn.md" => [
      "#{count_stubs} 个 stub",
      "#{count_product_notes} 个笔记",
      "#{count_product_archives} 个快照",
      "#{count_benchmark_rows} 个 catalog 行",
      "#{count_benchmark_rows} 个 benchmark catalog 行"
    ]
  }

  checks.each do |file, tokens|
    body = read(file)
    tokens.each do |token|
      assert(body.include?(token), "#{file} missing synchronized count token #{token.inspect}")
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

  benchmark_ids = Dir[File.join(ROOT, "benchmarks", "*.md")]
                  .reject { |path| File.basename(path) == "_template.md" }
                  .map { |path| [extract_front_matter_value(path, "benchmark_id"), path] }
                  .reject { |value, _path| value.nil? || value.empty? }
  dup_benchmarks = benchmark_ids.group_by(&:first).select { |_id, rows| rows.size > 1 }
  assert(dup_benchmarks.empty?, "duplicate benchmark_ids: #{dup_benchmarks.keys.join(", ")}")

  benchmark_titles = Dir[File.join(ROOT, "benchmarks", "*.md")]
                     .reject { |path| File.basename(path) == "_template.md" }
                     .map { |path| [extract_front_matter_value(path, "title"), path] }
                     .reject { |value, _path| value.nil? || value.empty? }
  dup_benchmark_titles = benchmark_titles.group_by { |value, _path| value.downcase }.select { |_value, rows| rows.size > 1 }
  assert(dup_benchmark_titles.empty?, "duplicate benchmark titles: #{dup_benchmark_titles.keys.join(", ")}")

  benchmark_names = Dir[File.join(ROOT, "benchmarks", "*.md")]
                    .reject { |path| File.basename(path) == "_template.md" }
                    .map { |path| [extract_front_matter_value(path, "name"), path] }
                    .reject { |value, _path| value.nil? || value.empty? }
  dup_benchmark_names = benchmark_names.group_by { |value, _path| value.downcase }.select { |_value, rows| rows.size > 1 }
  assert(dup_benchmark_names.empty?, "duplicate benchmark names: #{dup_benchmark_names.keys.join(", ")}")

  product_titles = Dir[File.join(ROOT, "products", "*.md")]
                   .map { |path| [extract_front_matter_value(path, "title"), path] }
                   .reject { |value, _path| value.nil? || value.empty? }
  dup_product_titles = product_titles.group_by { |value, _path| value.downcase }.select { |_value, rows| rows.size > 1 }
  assert(dup_product_titles.empty?, "duplicate product titles: #{dup_product_titles.keys.join(", ")}")

  product_ids = Dir[File.join(ROOT, "products", "*.md")].map do |path|
    explicit_id = extract_front_matter_value(path, "product_id")
    [explicit_id || File.basename(path, ".md"), path]
  end.reject { |value, _path| value.nil? || value.empty? }
  dup_product_ids = product_ids.group_by { |value, _path| value.downcase }.select { |_value, rows| rows.size > 1 }
  assert(dup_product_ids.empty?, "duplicate product ids/slugs: #{dup_product_ids.keys.join(", ")}")
end

def check_local_markdown_links
  files = tracked_files("*.md") +
          tracked_files("docs/**/*.md") +
          tracked_files("benchmarks/**/*.md") +
          tracked_files("products/**/*.md") +
          tracked_files("papers/**/*.md") +
          tracked_files("impact-reports/**/*.md")
  files = files.uniq.select { |path| File.exist?(path) }

  missing = []
  files.each do |path|
    body = File.read(path)
    body.scan(/(?<!!)\[[^\]]+\]\(([^)]+)\)/).flatten.each do |raw_target|
      target = raw_target.split(/[ #]/, 2).first
      next if target.nil? || target.empty?
      next if target.match?(/\A(?:https?:|mailto:|#)/)

      candidate = File.expand_path(target, File.dirname(path))
      missing << "#{path.delete_prefix("#{ROOT}/")}: #{raw_target}" unless File.exist?(candidate)
    end
  end

  assert(missing.empty?, "missing local markdown links:\n#{missing.join("\n")}")
end

scan_conflict_markers
check_yaml
check_counts
check_duplicates
check_local_markdown_links

puts "verify_memory_refresh passed"
puts "papers=#{paper_total_from_index} pdfs=#{count_pdfs} stubs=#{count_stubs} products=#{count_product_notes} product_archives=#{count_product_archives} benchmarks=#{count_benchmark_rows}"
