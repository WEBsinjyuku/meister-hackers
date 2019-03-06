<template lang="pug">
.bd-content
  .content
    .columns.is-centered
      .column.is-half
        form(@submit.prevent="submit")
          .field
            .label 都道府県
            input.input(type="text" v-model="profile.area")
          .field
            .label 性別
            label.radio 男性
              input(type="radio" name="sex" value="男性" v-model="profile.sex")
            label.radio 女性
              input(type="radio" name="sex" value="女性" v-model="profile.sex")
          .field
            .label GitHub URL
            input.input(type="text" v-model="profile.github_url")
          .field
            .label Twitter URL
            input.input(type="text" v-model="profile.twitter_url")
          .field
            .label Facebook URL
            input.input(type="text" v-model="profile.facebook_url")
          .field
            .label Blog URL
            input.input(type="text" v-model="profile.blog_url")
          .field
            .label 自由記述文
            textarea.textarea(v-model="profile.introduction")
          .field
            button.button(type="submit").is-primary 編集完了
            button.button(type="button" @click="cancel") キャンセル
</template>

<script>
import Axios from "axios";

export default {
  data() {
    return {
      profile: {
        area: null,
        sex: null,
        github_url: null,
        twitter_url: null,
        facebook_url: null,
        blog_url: null,
        introduction: null,
      },
    };
  },
  mounted() {
    const baseUrl = location.href;
    const profileUrl = `${baseUrl.replace("edit", "profiles")}`;
    Axios.get(profileUrl)
      .then((response) => {
        if (response.data.profile) {
          this.profile = response.data.profile;
        } else {
          this.profile = {};
        }
      });
  },
  methods: {
    submit() {
      const baseUrl = location.href;
      const profileUrl = `${baseUrl.replace("edit", "profiles")}/${this.profile.id}`;
      Axios.put(profileUrl, this.profile)
        .then(() => {
          location.href = baseUrl.replace("edit", "");
        });
    },
    cancel() {
      const baseUrl = location.href;
      location.href = baseUrl.replace("edit", "");
    },
  },
};
</script>
