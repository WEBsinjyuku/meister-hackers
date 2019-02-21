<template lang="pug">
#mypage
  .bd-content
    .content
      .columns
        .column.is-one-third
          .card
            .card-image
              figure.image.is-4by3
                img(src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image")
            .card-content
              .media
                .media-left
                  figure.image.is-48x48
                    img(src="https://bulma.io/images/placeholders/96x96.png" alt="Placeholder image")
                .media-content
                  p.title.is-4
                    | ニックネーム
                  p.subtitle.is-6
                    | @TwitterID
              .content
                p
                  | 都道府県：東京　性別：男　自己紹介：テスト用
                br
                a
                  | GitHub（アイコン）
                a
                  | FB（アイコン）
                a
                  | ブログ（アイコン）
                br
                time(datetime="2016-1-1")
                  | 登録した日:2019/1/1
        .column.highlight-full
          pre 基礎の基礎を理解しよう  
</template>

<script>
export default {
  
}
</script>

