<template lang="pug">
.bd-content
  .content
      user-profile(:attributes="profile", :user="user")
</template>

<script>
import Axios from "axios";
import UserProfile from "../molecules/UserProfile.vue";

export default {
  components: {
    UserProfile,
  },
  data() {
    return {
      user: {
        id: 0,
        name: "",
        avatar: "",
        isLogin: false,
      },
      profile: null,
    };
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

      this.user.name = response.data.username;
      this.user.id = response.data.id;
      this.user.avatar = response.data.avatar;
      this.user.isLogin = response.data.is_login;
      this.user.isCurrentUser = response.data.is_current_user;
      if (response.data.profile) {
        this.profile = response.data.profile;
      }
    });
  },
};
</script>
