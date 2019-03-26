<template lang="pug">
.bd-content
  .content
    .columns.is-centered
      form(@submit.prevent="submit")
        table.account-header
          tr
            td.account-header-left
              img(:src="this.user.avatar" alt="Placeholder image" width="50" height="50")
            td.account-header-middle
              | {{ this.user.name }}
            td.account-header-right
              a.cancel-button(type="button" @click="cancel") キャンセル
        ul(v-if="errMessages")
          li(v-for="errMsg in errMessages")
            span {{ errMsg[0] }}
        .account アカウント
        .field
          .label 都道府県
          input.input(type="text" v-model="profile.area")
        .field
          .label 性別
          input.input(type="text" v-model="profile.sex")
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
          .label 自己紹介
          textarea.input(type="text" v-model="profile.introduction")
        button.button(type="submit").is-primary 更新
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
      user: {
        name: "",
        avatar: "",
      },
      errMessages: null,
    };
  },
  mounted() {
    const baseUrl = location.href;
    const profileUrl = `${baseUrl.replace("edit", "profiles2")}`;
    Axios.get(profileUrl)
      .then((response) => {
        if (response.data.status === 401) {
          location.href = baseUrl.replace("edit", "");
        }

        if (response.data.profile) {
          this.profile = response.data.profile;
        } else {
          this.profile = {};
        }
        this.user.name = response.data.username;
        this.user.avatar = response.data.avatar;
      });
  },
  methods: {
    submit() {
      const baseUrl = location.href;
      const profileUrl = `${baseUrl.replace("edit", "profiles")}/${this.profile.id}`;
      Axios.put(profileUrl, this.profile)
        .then((response) => {
          if (response.data.status === 200) {
            location.href = baseUrl.replace("edit", "");
          }
          if (response.data.status === 500) {
            this.errMessages = response.data.errors;
          }
        });
    },
    cancel() {
      const baseUrl = location.href;
      location.href = baseUrl.replace("edit", "");
    },
  },
};
</script>

<style scoped>
  body {
    background-color: white;
  }

  .field {
    display: flex;
    justify-content: space-between;
    border-bottom: solid 1px #f9fbfe;
    padding-bottom: 10px;
  }

  .account-header {
    height: 70px;
    width: 100vw;
    margin-left: calc(50% - 50vw);
    background-color: #F0FFFF;
  }

  img {
    border-radius: 5px;
  }

  .account-header-left {
    vertical-align: middle;
    text-align: right;
    padding-left: 3px;
  }

  .account-header-middle {
    vertical-align: middle;
    font-size: 1.5rem;
    font-weight: bold;
    padding-left: 0;
  }

  .account-header-right {
    margin-left: 250px;
    line-height: 75px;
    text-align: center;
    padding-left: 8px;
  }

  .cancel-button {
    font-size: 1.2rem;
    color: #00d1b2;
    cursor: pointer;
  }

  .account {
    font-weight: bold;
    width: 80px;
    margin-top: 20px;
    margin-bottom: 20px;
    border-bottom: solid 3px black;
  }

  .label {
    font-weight: normal;
    margin-right: 30px;
  }

  .input {
    width: 800px;
  }

  textarea {
    height: 250px;
  }

  form {
    width: 100%;
  }

  .button {
    display: block;
    font-size: 0.8rem;
    font-weight: bold;
    margin-left: auto;
    color: white;
    background-color: red;
    border-radius: 10px;
  }

  ul {
    color: red;
  }
</style>
