import { defineConfig } from "vitepress";
import { BiDirectionalLinks } from "@nolebase/markdown-it-bi-directional-links";
import path from "path";
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

  md.render = function (src, env) {
    if (env?.relativePath && !src.startsWith("# ")) {
      const filename = path
        .basename(env.relativePath, ".md")
        .replace(/-/g, " ");
      src = `# ${filename}\n\n${src}`;
    }
    return originalRender.call(this, src, env);
  };
}

export default defineConfig({
  title: "SwiftUI Garden",
  description: "SwiftUI digital knowledge garden",
  cleanUrls: true,
  srcExclude: ["**/CLAUDE.md"],

  markdown: {
    config: (md) => {
      md.use(BiDirectionalLinks());
      transformInternalLinks(md);
      addFilenameAsH1(md);
    },
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
      { icon: "mastodon", link: "https://mastodon.social/@ralfebert" },
    ],
  },
});
