#!/usr/bin/env ruby
# frozen_string_literal: true

require "tmpdir"
require "fileutils"
require "open3"
require "rbconfig"

VERIFIER = File.expand_path("verify_memory_refresh.rb", __dir__)
RUN_CHECKS = <<~'RUBY'
  require ARGV.fetch(0)
  def files_in_dir(_directory, pattern)
    Dir.glob(File.join(ARGV.fetch(1), pattern))
  end
  check_benchmark_alias_collisions
  check_paper_note_identities
RUBY

def check_case(label, files, expected_error: nil)
  Dir.mktmpdir("memory-verifier-test") do |root|
    files.each do |relative, metadata|
      path = File.join(root, relative)
      FileUtils.mkdir_p(File.dirname(path))
      File.write(path, "---\n#{metadata}\n---\n\n# Fixture\n")
    end
    _out, err, status = Open3.capture3(RbConfig.ruby, "-e", RUN_CHECKS, VERIFIER, root)
    passed = expected_error ? !status.success? && err.include?(expected_error) : status.success?
    abort "FAIL #{label}: #{err}" unless passed
    puts "PASS #{label}"
  end
end

check_case("alias collides with another scalar name", {
  "benchmarks/first.md" => "benchmark_id: first\nname: Existing Name\nstatus: seed",
  "benchmarks/second.md" => "benchmark_id: second\naliases:\n  - existing name\nstatus: seed"
}, expected_error: "duplicate benchmark aliases/names")

check_case("quoted alias collides with scalar title", {
  "benchmarks/first.md" => "title: Canonical Title\nstatus: seed",
  "benchmarks/second.md" => "aliases:\n  - \"canonical title\"\nstatus: seed"
}, expected_error: "duplicate benchmark aliases/names")

check_case("scalar identity collides without an aliases list", {
  "benchmarks/first.md" => "benchmark_id: shared-id\nstatus: seed",
  "benchmarks/second.md" => "name: shared-id\nstatus: seed"
}, expected_error: "duplicate benchmark aliases/names")

check_case("similar names and same-file aliases are allowed", {
  "benchmarks/first.md" => "name: MEMPROBE\naliases:\n  - MEMPROBE",
  "benchmarks/second.md" => "name: MemProbe Stability-Plasticity\naliases:\n  - Stability-Plasticity MemProbe"
})

check_case("empty alias lists do not become a shared alias", {
  "benchmarks/first.md" => "name: First\naliases: []\nstatus: seed",
  "benchmarks/second.md" => "name: Second\naliases: []\nstatus: seed"
})

check_case("versioned canonical paper IDs collide", {
  "papers/first.md" => "arxiv_id: 2607.05029\nstatus: seed",
  "papers/second.md" => "arxiv_id: '2607.05029v2'\nstatus: seed"
}, expected_error: "duplicate canonical paper arxiv_ids")

check_case("paper, stub and benchmark views may share a source", {
  "papers/first.md" => "arxiv_id: 2610.21405\nstatus: seed",
  "papers/stubs/first.md" => "arxiv_id: 2610.21405\nstatus: stub",
  "benchmarks/first.md" => "benchmark_id: memcut\narxiv_id: 2610.21405\nstatus: seed"
})
