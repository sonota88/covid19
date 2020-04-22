<template>
  <data-view :title="title" :title-id="titleId" :date="date">
    <template v-slot:button>
      <p :class="$style.note">
        <t-i18n>
          {{
            $t(
              '（注）現時点では日別のデータが公開されていないため、総数のみ表示しています。検査実施数は、速報値として公開するものであり、後日確定データとして修正される場合があります。'
            )
          }}
        </t-i18n>
      </p>
    </template>
    <slot />
  </data-view>
</template>

<style lang="scss" module>
.note {
  margin-top: 10px;
  margin-bottom: 0;
  font-size: 12px;
  color: $gray-3;
}
</style>

<script lang="ts">
import Vue from 'vue'
import DataView from '@/components/DataView.vue'
import TI18n from '@/components/TI18n.vue'

export default Vue.extend({
  components: { DataView, TI18n },
  props: {
    title: {
      type: String,
      default: ''
    },
    titleId: {
      type: String,
      default: ''
    },
    date: {
      type: String,
      default: ''
    }
  }
})
</script>
