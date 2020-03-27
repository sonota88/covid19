<template>
  <div class="Contacts">
    <page-header class="mb-3">
      {{ $t('お問い合わせ先一覧') }}
    </page-header>
    <div class="Contacts-Card">
      <table class="Contacts-Card-Table" role="presentation">
        <thead>
          <tr>
            <th class="text-center" scope="col">
              {{ $t('お問い合わせ内容') }}
            </th>
            <th class="text-center" scope="col">{{ $t('局名') }}</th>
            <th class="text-center" scope="col">{{ $t('電話番号') }}</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="content" role="heading" aria-level="3">
              <a
                href="https://www.pref.miyazaki.lg.jp/kansensho-taisaku/kenko/hoken/covid19.html"
                target="_blank"
                rel="noopener"
                >{{ $t('新型コロナウイルス感染症対策に関すること') }}</a
              >
            </td>
            <td class="bureau">
              {{ $t('福祉保健部健康増進課感染症対策室感染症対策担当') }}
            </td>
            <td class="tel"><a href="tel:0985-44-2620">0985-44-2620</a></td>
          </tr>
          <tr>
            <td class="content" role="heading" aria-level="3">
              <a
                href="https://www.pref.miyazaki.lg.jp/keieikinyushien/shigoto/chushokigyo/20200228130742.html"
                target="_blank"
                rel="noopener"
                >{{ $t('中小企業支援に関すること') }}</a
              >
            </td>
            <td class="bureau">
              {{ $t('商工観光労働部商工政策課経営金融支援室経営金融支援担当') }}
            </td>
            <td class="tel"><a href="tel:0985-26-7097">0985-26-7097</a></td>
          </tr>
          <tr>
            <td class="content" role="heading" aria-level="3">
              <a
                href="https://www.pref.miyazaki.lg.jp/ky-somu/kurashi/kyoiku/ringikyugyo.html"
                target="_blank"
                rel="noopener"
              >
                {{ $t('臨時休校について') }}</a
              >
            </td>
            <td class="bureau">{{ $t('教育委員会教育政策課') }}</td>
            <td class="tel"><a href="tel:0985-26-7234">0985-26-7234</a></td>
          </tr>
          <tr>
            <td class="content" role="heading" aria-level="3">
              <a
                href="https://www.pref.miyazaki.lg.jp/kodomo-seisaku/kenko/kodomo/20200302160147.html"
                target="_blank"
                rel="noopener"
                >{{
                  $t('学校の臨時休業に伴う放課後児童クラブ等の対応について')
                }}</a
              >
            </td>
            <td class="bureau">
              {{ $t('福祉保健部こども政策局 こども政策課子育て支援担当') }}
            </td>
            <td class="tel"><a href="tel:0985-26-7056">0985-26-7056</a></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { MetaInfo } from 'vue-meta'
import PageHeader from '@/components/PageHeader.vue'

export default Vue.extend({
  components: {
    PageHeader
  },
  head(): MetaInfo {
    return {
      title: this.$t('お問い合わせ先一覧') as string
    }
  }
})
</script>

<style lang="scss">
.Contacts {
  &-Card {
    @include card-container();

    &-Table {
      width: 100%;
      border-collapse: collapse;

      th {
        font-size: 14px !important;
      }

      td {
        padding: 0 16px;
        font-size: 14px;
      }

      @include largerThan($medium) {
        thead tr {
          height: 48px;
        }

        tbody tr {
          height: 96px;
        }

        th,
        tr:not(:last-child) {
          border-top: none;
          border-left: none;
          border-right: none;
          border-bottom: thin solid rgba(0, 0, 0, 0.12);
        }

        tr:last-child {
          border: none;
        }
      }

      @include lessThan($medium) {
        thead {
          display: none;
        }

        tbody {
          tr {
            height: auto;

            .content {
              font-weight: bold;
              border-bottom: none !important;
              padding-top: 12px;
              padding-bottom: 8px;
            }

            .bureau {
              border-bottom: none !important;
            }

            .tel {
              padding-bottom: 12px;
            }
          }

          tr:not(:last-child) {
            border-bottom: thin solid rgba(0, 0, 0, 0.12);
          }
        }

        td {
          display: block;
        }
      }
    }
  }
}
</style>
