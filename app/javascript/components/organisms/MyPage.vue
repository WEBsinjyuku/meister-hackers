<template lang="pug">
.bd-content
  .content
    .columns
      .column.is-one-third
        user-profile(:attributes="profile", :user="user")
      .column.is-two-third
        user-post(:introduction="introduction")
        link(rel="stylesheet" href="https://unpkg.com/github-calendar@latest/dist/github-calendar-responsive.css")
        .calendar
          | Loading the data just for you.
</template>

<script>
import Axios from "axios";
import UserPost from "../molecules/UserPost.vue";
import UserProfile from "../molecules/UserProfile.vue";
import GitHubCalendar from 'github-calendar'

export default {
  components: {
    UserPost,
    UserProfile,
  },
  data() {
    return {
      user: {
        id: 0,
        name: "",
        nickname: "",
        avatar: "",
        isLogin: false,
      },
      introduction: "自己紹介文が未入力",
      profile: null,
    };
  },
  mounted() {
    const profileUrl = `${location.href}/profiles`;
    Axios.get(profileUrl)
      .then((response) => {
        if (response.data.status === 404) {
          window.location.href = "/error/404";
          return;
        }
        if (response.data.status === 500) {
          window.location.href = "/error/404";
          return;
        }

        this.user.name = response.data.username;
        this.user.nickname = response.data.nickname;
        this.user.id = response.data.id;
        this.user.avatar = response.data.avatar;
        this.user.isLogin = response.data.is_login;
        this.user.isCurrentUser = response.data.is_current_user;
        if (response.data.profile) {
          this.profile = response.data.profile;
          this.introduction = response.data.profile.introduction;
        }
        GitHubCalendar(".calendar", this.user.nickname, { responsive: true });
      });
  },
};
</script>
