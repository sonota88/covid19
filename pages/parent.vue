<template>
  <div class="Parent">
    <page-header class="mb-3">
      {{ $t('臨時休校中の新型コロナウイルス感染症対応についてのお願い') }}
    </page-header>
    <StaticCard>
      <h3>1. {{ $t('感染予防・健康管理') }}</h3>
      <ul>
        <li>
          {{
            $t(
              '不特定多数の人の集まる場所等への外出を避け、基本的に自宅で過ごしてください。'
            )
          }}
        </li>
        <li>
          {{ $t('手洗い、咳エチケット等により、感染予防に努めてください。')
          }}<br />
          <a
            href="https://tokyodouga.jp/lViN9C_BS-0.html"
            target="_blank"
            rel="noopener"
            >{{ $t('【参考】感染症予防のための正しい手洗い方法（動画）') }}</a
          >
        </li>
        <li>
          {{
            $t(
              '規則正しい生活を心がけ、日常の健康管理に十分気を付けてください。'
            )
          }}
        </li>
      </ul>
    </StaticCard>
    <StaticCard>
      <h3>2. {{ $t('感染症を疑う場合の対応') }}</h3>
      <ul>
        <li>{{ $t('各保健所にご相談ください') }}</li>
        <li>
          {{ $t('各保健所の電話番号について') }}
          <br />
          <a
            href="https://www.pref.miyazaki.lg.jp/kansensho-taisaku/kenko/hoken/20200121143156.html#hatsunetsu"
            target="_blank"
            rel="noopener"
            >{{ $t('帰国者・接触者相談センター等の連絡先') }}</a
          >
        </li>
      </ul>
    </StaticCard>
    <StaticCard>
      <h3>3. {{ $t('臨時休校について') }}</h3>
      <p>
        <a
          href="https://www.pref.miyazaki.lg.jp/ky-somu/kurashi/kyoiku/ringikyugyo.html"
          target="_blank"
          rel="noopener"
          >{{ $t('詳しくはこちらをご確認ください。') }}</a
        >
      </p>
    </StaticCard>
    <StaticCard>
      <h3>4. {{ $t('学校の臨時休業に伴う放課後児童クラブ等の対応') }}</h3>
      <p>
        <a
          href="https://www.pref.miyazaki.lg.jp/kodomo-seisaku/kenko/kodomo/20200302160147.html"
          target="_blank"
          rel="noopener"
          >{{ $t('詳しくはこちらをご確認ください。') }}</a
        >
      </p>
    </StaticCard>
    <StaticCard>
      <h3>5. {{ $t('その他.parent') }}</h3>
      <p>{{ $t('詳細は、各学校からのお知らせ等をご確認ください。') }}</p>
    </StaticCard>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { MetaInfo } from 'vue-meta'
import StaticCard from '@/components/StaticCard.vue'
import PageHeader from '@/components/PageHeader.vue'

export default Vue.extend({
  components: {
    PageHeader,
    StaticCard
  },
  head(): MetaInfo {
    return {
      title: this.$t('お子様をお持ちの皆様へ') as string
    }
  }
})
</script>
