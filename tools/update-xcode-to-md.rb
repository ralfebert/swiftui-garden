#!/usr/bin/env ruby

#
# Tool to auto-update code snippets in .md files from .swift files
#
# update-xcode-to-md.rb finds Swift code blocks in markdown files that reference a Swift file
# via `» filename.swift` comments, updates the header with the URLs in the swift file, and
# replaces the markdown code blocks with the Swift file contents.
#
## Procedure, Implementation instructions
#
# 1. Find all **/*.md files in the project.
#
# 2. For every such file, use a regex to find all swift code blocks (three backticks in markdown followed by `swift`), prepare to replace the code block.
#
# 3. For every such swift code block in a markdown document, get the comment lines at the start of the code block (let's call that `preamble` - write a function that extracts the preamble from a string -> all lines at the beginning of the code block that start with `//` (Swift-style comments), ignoring whitespace and empty lines).
#    Have a look at Views/Button/Custom Button Styles.md for an example of a preamble.
#
# 4. Look for a line like `» foo.swift` or `» /full/path/to/file/foo.swift` in the preamble (a `»` marker at the beginning of the line + a file path with a filename that has the extension .swift, whitespace around `»` is allowed) to locate a matching Swift source file.
#
# 5. For every such code block with a referenced swift file in the preamble, find the local swift file by filename only (ignore any path). Exactly one file must be found, if none or multiple, raise an error. In the Swift file, update the preamble (or add one if none exists) so that it looks like this (note: if multiple markdown files reference the same Swift file, the last processed markdown file will determine the URLs in the preamble):
#
# ```
# // » SwiftUI Garden
# // » https://swiftui-garden.com/Views/Button/Custom+Button+Styles
# // » https://github.com/ralfebert/swiftui-garden/blob/main/Views/Button/CustomButtonStyleView.swift
# ```
#
# To build the swiftui-garden.com URL, use the path of the markdown file, remove the .md extension, replace spaces in filenames with `+`.
# To build the github URL, use the filename of the swift example code.
#
# 6. Replace the full code block in the markdown file with the complete contents from the `.swift` file (including the updated preamble from step 5).
#
# 7. Make sure that this works for multiple code blocks in the same markdown file.
#

require 'pathname'

def extract_preamble(code_block)
  lines = code_block.split("\n")
  preamble_lines = []

  lines.each do |line|
    trimmed = line.strip
    if trimmed.empty?
      next
    elsif trimmed.start_with?('//')
      preamble_lines << line
    else
      break
    end
  end

  preamble_lines.join("\n")
end

def find_swift_file_reference(preamble)
  preamble.split("\n").each do |line|
    return File.basename(Regexp.last_match(1).strip) if line =~ /»\s*(.+\.swift)/
  end
  nil
end

def find_swift_file_by_name(filename, project_root)
  matches = Dir.glob(File.join(project_root, '**', filename))

  if matches.empty?
    raise "No Swift file found with name: #{filename}"
  elsif matches.length > 1
    raise "Multiple Swift files found with name #{filename}: #{matches.join(', ')}"
  end

  matches.first
end

def build_swiftui_garden_url(md_file_path, project_root)
  relative_path = Pathname.new(md_file_path).relative_path_from(Pathname.new(project_root))
  url_path = relative_path.to_s.gsub(/\.md$/, '').gsub(' ', '+')
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
  content = File.read(swift_file_path)
  lines = content.split("\n")

  # Remove existing preamble
  lines.shift while !lines.empty? && (lines.first.strip.empty? || lines.first.strip.start_with?('//'))

  # Add new preamble
  updated_content = new_preamble + "\n\n" + lines.join("\n")
  File.write(swift_file_path, updated_content)
end

def process_markdown_files(project_root)
  md_files = Dir.glob(File.join(project_root, '**', '*.md'))

  md_files.each do |md_file|
    puts "Processing: #{md_file}"
    content = File.read(md_file)

    # Find all swift code blocks
    updated_content = content.gsub(/```swift\n(.*?)\n```/m) do |match|
      code_block = Regexp.last_match(1)
      preamble = extract_preamble(code_block)

      swift_filename = find_swift_file_reference(preamble)

      if swift_filename
        begin
          swift_file_path = find_swift_file_by_name(swift_filename, project_root)
          new_preamble = create_preamble(md_file, swift_file_path, project_root)
          update_swift_file_preamble(swift_file_path, new_preamble)

          # Replace with updated Swift file content
          updated_swift_content = File.read(swift_file_path)
          "```swift\n#{updated_swift_content}\n```"
        rescue StandardError => e
          puts "Error processing #{swift_filename} in #{md_file}: #{e.message}"
          match # Return original if error
        end
      else
        match # Return original if no Swift file reference
      end
    end

    if updated_content != content
      File.write(md_file, updated_content)
      puts "Updated: #{md_file}"
    end
  end
end

# Main execution
if __FILE__ == $0
  project_root = File.dirname(File.dirname(__FILE__))
  process_markdown_files(project_root)
  puts 'Code snippet sync completed!'
end
