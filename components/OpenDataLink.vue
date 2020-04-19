<template>
  <a class="OpenDataLink" :href="url" target="_blank" rel="noopener">
    <t-i18n>
      {{ $t('オープンデータを入手') }}
    </t-i18n>
    <v-icon
      class="ExternalLinkIcon"
      size="15"
      :aria-label="this.$t('別タブで開く')"
      role="img"
      :aria-hidden="false"
    >
      mdi-open-in-new
    </v-icon>
  </a>
</template>

<style lang="scss">
.OpenDataLink {
  text-decoration: none;
  .ExternalLinkIcon {
    vertical-align: text-bottom;
  }
}
</style>
<script lang="ts">
import Vue from 'vue'
import TI18n from '@/components/TI18n.vue'

export default Vue.extend({
  components: {
    TI18n
  },
  props: {
    url: {
      type: String,
      default: ''
    }
  }
})
</script>
