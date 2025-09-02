#!/usr/bin/env ruby

#
# Tool to add URL backlinks to Swift files referenced in markdown via VitePress snippet embedding
#
# This script finds VitePress snippet references (<<< @/path/to/file.swift) in markdown files
# and adds/updates URL backlinks in the referenced Swift files.
#
## Procedure:
#
# 1. Find all **/*.md files in the project.
# 2. For every markdown file, find all VitePress snippet references: <<< @/path/to/file.swift
# 3. For each referenced Swift file, update or add URL backlinks at the beginning of the file
#

require 'pathname'

def build_swiftui_garden_url(md_file_path, project_root)
  relative_path = Pathname.new(md_file_path).relative_path_from(Pathname.new(project_root))
  url_path = relative_path.to_s.gsub(/\.md$/, '').gsub(' ', '-')
  "https://swiftui-garden.com/#{url_path}"
end

def build_github_url(swift_file_path, project_root)
  relative_path = Pathname.new(swift_file_path).relative_path_from(Pathname.new(project_root))
  "https://github.com/ralfebert/swiftui-garden/blob/main/#{relative_path}"
end

def create_preamble(md_file_path, swift_file_path, project_root)
  swiftui_url = build_swiftui_garden_url(md_file_path, project_root)
  github_url = build_github_url(swift_file_path, project_root)

  [
    '// » SwiftUI Garden',
    "// » #{swiftui_url}",
    "// » #{github_url}"
  ].join("\n")
end

def update_swift_file_preamble(swift_file_path, new_preamble)
  return unless File.exist?(swift_file_path)
  
  content = File.read(swift_file_path)
  lines = content.split("\n")

  # Remove existing preamble (lines starting with // » at the beginning of the file)
  while !lines.empty? && (lines.first.strip.empty? || lines.first.strip.start_with?('// »'))
    lines.shift
  end

  # Add new preamble
  updated_content = new_preamble + "\n\n" + lines.join("\n")
  File.write(swift_file_path, updated_content)
end

def process_markdown_files(project_root)
  md_files = Dir.glob(File.join(project_root, '**', '*.md'))
  updated_count = 0

  md_files.each do |md_file|
    content = File.read(md_file)
    
    # Find all VitePress snippet references
    # Pattern: <<< @/path/to/file.swift
    snippets_found = false
    content.scan(/<<<\s*@(\/[^\s]+\.swift)/) do |match|
      snippets_found = true
      swift_path = match[0]
      # Remove leading / if present to make it relative
      swift_path = swift_path.sub(/^\//, '')
      swift_file_path = File.join(project_root, swift_path)
      
      if File.exist?(swift_file_path)
        new_preamble = create_preamble(md_file, swift_file_path, project_root)
        update_swift_file_preamble(swift_file_path, new_preamble)
        puts "  Updated backlinks in: #{swift_path}"
        updated_count += 1
      else
        puts "  Warning: Swift file not found: #{swift_file_path}"
      end
    end
    
    if snippets_found
      puts "Processing: #{md_file}"
    end
  end
  
  puts "\nSwift file backlink update completed!"
  puts "Updated #{updated_count} Swift file(s)"
end

# Main execution
if __FILE__ == $0
  project_root = File.dirname(File.dirname(__FILE__))
  process_markdown_files(project_root)
end