<template lang="pug">
.bd-content
  .content
    .columns.is-centered
      .column.is-half
        form(@submit.prevent="submit")
          .field
            .label 都道府県
            input.input(type="text" placeholder="東京都" v-model="profile.area")
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
            button.button(type="submit").is-primary 編集完了
            button.button(@click="cancel") キャンセル
</template>

<script>
import Axios from "axios";

export default {
  data() {
    return {
      profile: {
        area: "",
        sex: "",
        github_url: "",
        twitter_url: "",
        facebook_url: "",
        blog_url: "",
      },
    };
  },
  mounted() {
    const baseUrl = location.href;
    const profileUrl = `${baseUrl.replace("edit", "profiles")}`;
    Axios.get(profileUrl)
      .then((response) => {
        this.profile = response.data.profile;
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
