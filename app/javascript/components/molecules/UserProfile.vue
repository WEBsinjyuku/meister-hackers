<template lang="pug">
.bd-content
  .content
    table.account-header
      tr
        td.account-header-left
          img(:src="this.user.avatar" alt="Placeholder image" width="50" height="50")
        td.account-header-middle
          | {{ this.user.name }}
        td.account-header-right
          a.edit-button(@click="edit" v-if="user.isCurrentUser") 編集
    .account アカウント
    table
      tr
        td.is-width-3
          | 都道府県
        td.is-width-7(v-if="attributes")
          | {{ attributes.area }}
      tr
        td
          | 性別
        td(v-if="attributes")
          | {{ attributes.sex }}
      tr
        td
          | 自己紹介
        td(v-if="attributes")
          user-post(:introduction="introduction")
    div
      .icon.is-large(v-if="attributes && attributes.github_url")
        a.fab.fa-2x.fa-github.is-black(:href="attributes.github_url")
      .icon.is-large(v-if="attributes && attributes.twitter_url")
        a.fab.fa-2x.fa-twitter.is-black(:href="attributes.twitter_url")
      .icon.is-large(v-if="attributes && attributes.facebook_url")
        a.fab.fa-2x.fa-facebook.is-black(:href="attributes.facebook_url")
      .icon.is-large(v-if="attributes && attributes.blog_url")
        a.fas.fa-2x.fa-rss-square.is-black(:href="attributes.blog_url")</template>

<script>
import Axios from "axios";
import moment from "moment";
import UserPost from "./UserPost.vue";

export default {
  components: {
    UserPost,
  },
  data() {
    return {
      introduction: "自己紹介文が未入力",
    };
  },
  props: ["user", "attributes"],
  computed: {
    editUrl() {
      if (this.user) {
        return `/users/${this.user.id}/edit`;
      }
      return "/";
    },
  },
  methods: {
    edit() {
      window.location.href = this.editUrl;
    },
  },
  mounted() {
    const profileUrl = `${location.href}/profiles`;
    Axios.get(profileUrl).then((response) => {
      if (response.data.status === 404) {
        window.location.href = "/error/404";
        return;
      }
      if (response.data.status === 500) {
        window.location.href = "/error/404";
        return;
      }
      if (response.data.profile) {
        this.introduction = response.data.profile.introduction;
      }
    });
  }
};
</script>

<style scoped>
.account-header {
  height: 70px;
  width: 100vw;
  margin-top: -10px;
  margin-left: calc(50% - 50vw);
  background-color: #f0ffff;
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
  text-align: left;
  font-weight: bold;
  padding-left: 8px;
}

.edit-button {
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

.is-width-3 {
  width: 30%;
}

.is-width-7 {
  width: 70%;
}

.is-black {
  color: black;
}
</style>