<template>
  <div class="Worker">
    <page-header class="mb-3">
      <t-i18n>
        {{ $t('企業の皆様・はたらく皆様へ') }}
      </t-i18n>
    </page-header>
    <StaticCard>
      <h3>
        <a
          href="https://www.pref.miyazaki.lg.jp/keieikinyushien/shigoto/chushokigyo/20200228130742.html"
          target="_blank"
          rel="noopener"
        >
          <t-i18n>
            {{
              $t(
                '中小企業の皆さまへ：宮崎県中小企業融資制度（セーフティネット・危機関連貸付4号）'
              )
            }}
          </t-i18n>
        </a>
      </h3>
      <p>
        <t-i18n>
          {{
            $t(
              '宮崎県から国に対し、新型コロナウイルス感染症に関してセーフティネット保証4号の指定の要請を行なっていたところ、3月2日付けで指定されました。災害等の突発的事由により経営の安定に支障を生じている中小企業者への資金供給の円滑化を図るため、信用保証協会が通常の保証限度額とは別枠で保証（借入額の100％を保証）を行う制度です。'
            )
          }}
        </t-i18n>
      </p>
    </StaticCard>
    <StaticCard>
      <h3>
        <a
          href="https://www.pref.miyazaki.lg.jp/keieikinyushien/shigoto/chushokigyo/20200131131631.html"
          target="_blank"
          rel="noopener"
          ><t-i18n>{{
            $t('商工業者向け「特別相談窓口」の設置について')
          }}</t-i18n></a
        >
      </h3>
      <p>
        <t-i18n>
          {{
            $t(
              '今般、新型コロナウイルスの流行を受けるまたは、その恐れがある商工業者の経営・金融相談に対応するため、「中小企業特別相談窓口」を設置するとともに、関係団体に対して、特別相談窓口の設置や金融円滑化について、協力依頼を行いました。また、新型コロナウイルスの流行により、売上減少等が生じている県内中小企業は、添付のチラシに記載する宮崎県中小企業融資制度を利用することができます。'
            )
          }}
        </t-i18n>
      </p>
    </StaticCard>
    <StaticCard>
      <h3>
        <a
          href="https://www.pref.miyazaki.lg.jp/rodoseisaku/shigoto/rodo/mado01.html"
          target="_blank"
          rel="noopener"
          ><t-i18n>{{
            $t('労働相談窓口について（宮崎県中小企業労働相談所）')
          }}</t-i18n></a
        >
      </h3>
      <p>
        <t-i18n>
          {{
            $t(
              '県では、労働問題に関する様々な相談に応じ、問題の解決に向けたアドバイスを行うため、県内4箇所（宮崎、日南、都城、延岡）に中小企業労働相談所を設置しています。相談は無料です。お気軽に御相談ください。'
            )
          }}
        </t-i18n>
      </p>
    </StaticCard>
    <StaticCard>
      <h3>
        <a
          href="http://hpm.i-port.or.jp/200130113243/"
          target="_blank"
          rel="noopener"
        >
          <t-i18n>
            {{
              $t(
                '新型コロナウイルスに関する経営相談窓口（宮崎県よろず支援拠点）について'
              )
            }}
          </t-i18n>
        </a>
      </h3>
      <p>
        <t-i18n>
          {{
            $t(
              'よろず支援拠点では、新型コロナウイルスの流行により、影響を受けるまたは、その恐れがある中小企業・小規模事業者等を対象として「新型コロナウイルスに関する経営相談窓口」を設置し、経営上の相談を受け付けています。'
            )
          }}
        </t-i18n>
      </p>
    </StaticCard>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { MetaInfo } from 'vue-meta'
import StaticCard from '@/components/StaticCard.vue'
import PageHeader from '@/components/PageHeader.vue'
import TI18n from '@/components/TI18n.vue'

export default Vue.extend({
  components: {
    PageHeader,
    StaticCard,
    TI18n
  },
  head(): MetaInfo {
    return {
      title: this.$t('企業の皆様・はたらく皆様へ') as string
    }
  }
})
</script>
