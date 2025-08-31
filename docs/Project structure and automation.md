* The project is both an Obsidian Vault and Xcode project.
* The Xcode project contains stand-alone example code snippets for SwiftUI Views.
* Screenshots can be captured using unit tests, see [[Capturing screenshots]]
* The Obsidian Vault is used to write content pages using Markdown, code snippets from the Xcode project can be embedded and are auto-updated:

	Run `just sync` to automatically update code examples in markdown files from the corresponding Swift source files.

	The synchronization tool (`tools/update-xcode-to-md.rb`) finds Swift code blocks in markdown files that reference a Swift file via `» filename.swift` comments, updates the swift file with comments containing SwiftUI Garden and GitHub URLs  and replaces the markdown code block with the Swift file contents.
