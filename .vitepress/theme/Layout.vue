<script setup>
import { useData } from 'vitepress'
import DefaultTheme from 'vitepress/theme'
import PageInfo from './components/PageInfo.vue'

const { Layout } = DefaultTheme
const { frontmatter } = useData()
</script>

<template>
  <Layout>
    <template #doc-before>
      <PageInfo v-if="frontmatter.showAuthor !== false" />
    </template>
  </Layout>
</template>