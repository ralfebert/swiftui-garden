<script setup>
import { useData } from 'vitepress'
import { computed } from 'vue'

const { page } = useData()

const isLocal = computed(() => {
  return typeof window !== 'undefined' && window.location.hostname === 'localhost'
})

const editLink = computed(() => {
  const filePath = page.value.filePath
  
  if (isLocal.value) {
    // Convert file path to Obsidian URI format
    // Remove .md extension for Obsidian link
    const obsidianPath = filePath.replace(/\.md$/, '')
    // URL encode the file path for Obsidian
    const encodedPath = encodeURIComponent(obsidianPath)
    return `obsidian://open?vault=swiftui-garden&file=${encodedPath}`
  }
  
  return `https://github.com/ralfebert/swiftui-garden/edit/main/${filePath}`
})
</script>

<template>
  <div id="pageinfo">
    <img src="/assets/re.png" width="30" height="30">
    <a href="https://ralfebert.com">Ralf Ebert</a>
    <a :href="editLink" style="margin-left: 0.3em;">✏️ edit</a>
  </div>
</template>

<style scoped>
#pageinfo {
  margin-bottom: 1em;
  display: flex;
  align-items: center;
  gap: 0.5em;
  font-size: 0.9em;
  font-weight: 500;
}

#pageinfo img {
  flex-shrink: 0;
}

#pageinfo a {
  color: var(--vp-c-brand-1);
}

#pageinfo a:hover {
  color: var(--vp-c-brand-2);
}
</style>
