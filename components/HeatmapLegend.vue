<template>
  <div>
    <ul class="clearfix">
      <li v-for="item in legendData" :key="item.valueFrom">
        <span
          class="LegendBlock"
          :style="
            `background-color: ${item.color}; border: 1px solid ${item.borderColor}`
          "
        />
        <t-i18n>
          {{
            `${item.valueFrom}〜${item.valueTo !== null ? item.valueTo : ''}`
          }}
        </t-i18n>
      </li>
    </ul>
  </div>
</template>

<style scoped>
.LegendBlock {
  width: 16px;
  height: 16px;
  display: inline-block;
  opacity: 0.5;
}
li {
  list-style: none;
  float: left;
  font-size: 14px;
  padding-right: 4px;
}
li:last-child {
  padding-right: 0;
}
ul {
  margin: 0;
  padding: 0;
}
.clearfix::after {
  content: '';
  display: block;
  clear: both;
}
</style>

<script>
import TI18n from '@/components/TI18n.vue'

export default {
  components: {
    TI18n
  },
  props: {
    legendData: {
      type: Array,
      default: () => {
        return []
      }
    }
  }
}
</script>
