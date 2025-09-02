import fs from 'fs';
import path from 'path';
import MarkdownIt from 'markdown-it';
import { BiDirectionalLinks } from "@nolebase/markdown-it-bi-directional-links";

interface SidebarItem {
  text: string;
  link?: string;
  items?: SidebarItem[];
}

export function generateSidebarFromNav(): SidebarItem[] {
  const navPath = path.join(__dirname, '..', 'Nav.md');
  const navContent = fs.readFileSync(navPath, 'utf-8');
  
  const md = new MarkdownIt();
  md.use(BiDirectionalLinks());
  const tokens = md.parse(navContent, {});
  
  return parseTokensToSidebar(tokens);
}

function parseTokensToSidebar(tokens: any[]): SidebarItem[] {
  if (!tokens || !Array.isArray(tokens)) {
    console.error('Invalid tokens provided to parseTokensToSidebar');
    return [];
  }
  
  const sidebar: SidebarItem[] = [];
  const stack: SidebarItem[] = [];
  
  for (let i = 0; i < tokens.length; i++) {
    const token = tokens[i];
    
    if (!token || !token.type) {
      continue;
    }
    
    if (token.type === 'bullet_list_open') {
      continue;
    }
    
    if (token.type === 'bullet_list_close') {
      continue;
    }
    
    if (token.type === 'list_item_open') {
      const level = token.markup === '-' ? 0 : (token.attrGet && token.attrGet('level')) || 0;
      
      // Find the inline token with the content
      let contentToken = null;
      let j = i + 1;
      while (j < tokens.length && tokens[j] && tokens[j].type !== 'list_item_close') {
        if (tokens[j].type === 'inline') {
          contentToken = tokens[j];
          break;
        }
        j++;
      }
      
      if (contentToken) {
        const item = parseInlineContent(contentToken);
        
        // Determine nesting level based on token nesting
        const currentLevel = token.level || 0;
        
        // Adjust stack to current level
        while (stack.length > currentLevel / 2) {
          stack.pop();
        }
        
        if (stack.length === 0) {
          sidebar.push(item);
        } else {
          const parent = stack[stack.length - 1];
          if (!parent.items) parent.items = [];
          parent.items.push(item);
        }
        
        // If item has no link, it's a section header that can have children
        if (!item.link) {
          stack.push(item);
        }
      }
    }
  }
  
  return sidebar;
}

function transformUrl(url: string): string {
  return url.replace(/\s+/g, "-");
}

function parseInlineContent(token: any): SidebarItem {
  if (!token) {
    return { text: 'Unknown', items: [] };
  }
  
  // Check if content contains a link
  const children = token.children || [];
  
  for (const child of children) {
    if (child && child.type === 'link_open') {
      // Find the corresponding link text and href
      let href = child.attrGet ? child.attrGet('href') : null;
      let text = '';
      
      // Get text from subsequent tokens until link_close
      let i = children.indexOf(child) + 1;
      while (i < children.length && children[i].type !== 'link_close') {
        if (children[i] && children[i].type === 'text') {
          text += children[i].content || '';
        }
        i++;
      }
      
      // Apply URL transformation for internal links
      if (href && !href.startsWith('http') && !href.startsWith('//') && !href.startsWith('#')) {
        href = transformUrl(href);
      }
      
      return { text: text || 'Unknown Link', link: href || '#' };
    }
  }
  
  // No link found, treat as section header
  const text = token.content || token.children?.find(c => c.type === 'text')?.content || '';
  return { text: text || 'Unknown Section', items: [] };
}