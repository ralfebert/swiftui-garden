* Always read `/index.md` and `docs/Project structure and automation.md` before starting work.
* For code snippets, always create a Swift file and embed it via `<<< @/path/to/file` in the markdown article.
* After creating new snippets or moving files around, run `just sync` to update the backlinks.
* The site is rendered from Obsidian-style markdown files using VitePress.
* Keep documentation briefly and concise. Talk and write for software developers with 10+ years experience, don't explain or comment trivial code.
* Never do more than asked for