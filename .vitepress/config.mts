import { defineConfig, createContentLoader } from "vitepress";
import { BiDirectionalLinks } from "@nolebase/markdown-it-bi-directional-links";
import path from "path";
import { writeFileSync } from "fs";
import { Feed } from "feed";
import { generateSidebarFromNav } from "./generateSidebarFromNav";

function transformUrl(url: string): string {
  return url.replace(/\s+/g, "-");
}

function transformInternalLinks(md) {
  const originalRender =
    md.renderer.rules.link_open ||
    function (tokens, idx, options, env, renderer) {
      return renderer.renderToken(tokens, idx, options);
    };

  md.renderer.rules.link_open = function (tokens, idx, options, env, renderer) {
    const token = tokens[idx];
    const hrefAttr = token.attrGet("href");

    if (
      hrefAttr &&
      !hrefAttr.startsWith("http") &&
      !hrefAttr.startsWith("//") &&
      !hrefAttr.startsWith("#")
    ) {
      const transformedHref = transformUrl(hrefAttr);
      token.attrSet("href", transformedHref);
    }

    return originalRender(tokens, idx, options, env, renderer);
  };
}

function addFilenameAsH1(md) {
  const originalRender = md.render;

  // TODO:
  // This is an ultra-ugly quick fix that does the trick
  // of adding filename-based h1 tags, even with frontmatter
  // There must be a better way to do this/we should not do this
  // via regex.
  // (I didn't do this properly as of now because I'm not sure
  // I want to keep the Obsidian convention of using filenames
  // instead of h1)

  md.render = function (src, env) {
    if (env?.relativePath) {
      // Check if content has frontmatter and remove it
      let content = src;
      if (content.startsWith("---")) {
        const frontmatterEnd = content.indexOf("\n---", 3);
        if (frontmatterEnd !== -1) {
          // Skip past the closing --- and newline
          content = content.substring(frontmatterEnd + 4).trimStart();
        }
      }

      // Only add filename as H1 if content doesn't already start with a heading
      if (!content.startsWith("# ")) {
        const filename = path
          .basename(env.relativePath, ".md")
          .replace(/-/g, " ");
        // Need to preserve the frontmatter if it exists
        if (src.startsWith("---")) {
          const frontmatterEnd = src.indexOf("\n---", 3);
          if (frontmatterEnd !== -1) {
            const frontmatter = src.substring(0, frontmatterEnd + 4);
            const restContent = src.substring(frontmatterEnd + 4);
            src = `${frontmatter}\n# ${filename}\n${restContent}`;
          } else {
            src = `# ${filename}\n\n${src}`;
          }
        } else {
          src = `# ${filename}\n\n${src}`;
        }
      }
    }
    return originalRender.call(this, src, env);
  };
}

export default defineConfig({
  title: "SwiftUI Garden",
  description: "SwiftUI digital knowledge garden",
  cleanUrls: true,
  srcExclude: ["**/CLAUDE.md", "Nav.md", "LICENSE.md"],

  head: [
    ['link', { rel: 'icon', type: 'image/svg+xml', href: '/favicon.svg' }],
    ['link', { rel: 'icon', type: 'image/png', href: '/favicon.png' }],
  ],

  sitemap: {
    hostname: "https://swiftui-garden.com",
  },

  async buildEnd(siteConfig) {
    const hostname = "https://swiftui-garden.com";

    const feed = new Feed({
      title: "SwiftUI Garden by Ralf Ebert",
      id: hostname,
      link: hostname,
      language: "en",
      copyright: "All rights reserved, Ralf Ebert",
      author: {
        name: "Ralf Ebert",
        link: "https://www.ralfebert.com",
      },
    });

    // Load all markdown files with dates
    const posts = await createContentLoader("**/*.md", {
      excerpt: true,
      render: false, // Don't render HTML to avoid build issues
      transform(raw) {
        // Filter and sort posts with dates
        return raw
          .filter((post) => post.frontmatter.date)
          .sort(
            (a, b) =>
              +new Date(b.frontmatter.date as string) -
              +new Date(a.frontmatter.date as string),
          );
      },
    }).load();

    // Add each article to the feed
    for (const { url, excerpt, frontmatter } of posts) {
      const cleanUrl = transformUrl(url);
      const title =
        frontmatter.title || path.basename(url, ".html").replace(/-/g, " ");

      feed.addItem({
        title,
        id: `${hostname}${cleanUrl}`,
        link: `${hostname}${cleanUrl}`,
        description: frontmatter.description || excerpt || "",
        date: new Date(frontmatter.date as string),
      });
    }

    // Write RSS file
    writeFileSync(path.join(siteConfig.outDir, "index.rss"), feed.rss2());
  },

  markdown: {
    config: (md) => {
      md.use(BiDirectionalLinks());
      transformInternalLinks(md);
      addFilenameAsH1(md);

      // Override inline code rendering to use <i> instead of <code>
      md.renderer.rules.code_inline = (tokens, idx) => {
        const token = tokens[idx];
        return `<i>${md.utils.escapeHtml(token.content)}</i>`;
      };
    },
    lineNumbers: true,
  },

  rewrites(id) {
    return transformUrl(id);
  },

  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: {
      src: "/assets/swift-origami.svg",
      width: 32,
      height: 32,
    },
    nav: [
      { text: "Home", link: "/" },
      { text: "Apps", link: "https://www.ralfebert.com/apps/" },
    ],

    docFooter: {
      prev: false,
      next: false,
    },

    sidebar: generateSidebarFromNav(),

    socialLinks: [
      { icon: "github", link: "https://github.com/ralfebert/swiftui-garden/" },
      { icon: "rss", link: "/index.rss" },
      { icon: "mastodon", link: "https://mastodon.social/@ralfebert" },
    ],
  },
});
