<template lang="pug">
.bd-content
  .content
    .columns
      .column.is-one-third
        user-profile(:attributes="profile", :user="user")
      .column.is-two-third
        user-post(:introduction="introduction")
</template>

<script>
import Axios from "axios";
import UserPost from "../molecules/UserPost.vue";
import UserProfile from "../molecules/UserProfile.vue";

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
        avatar: "",
      },
      introduction: "自己紹介文が未入力",
      profile: null,
    };
  },
  mounted() {
    const profileUrl = `${location.href}/profiles`;
    Axios.get(profileUrl)
      .then((response) => {
        this.user.name = response.data.username;
        this.user.id = response.data.id;
        this.user.avatar = response.data.avatar;
        if (response.data.profile) {
          this.profile = response.data.profile;
          this.introduction = response.data.profile.introduction;
        }
      });
  },
};
</script>
