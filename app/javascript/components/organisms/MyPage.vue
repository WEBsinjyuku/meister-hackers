<template lang="pug">
.bd-content
  .content
    .columns
      .column.is-one-third
        user-profile(:attributes="profile", :user="user")
      .column.is-two-third
        user-post(:content="content")
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
        name: "",
        image: "https://bulma.io/images/placeholders/96x96.png",
      },
      content: "自己紹介文が未入力",
      profile: null,
    };
  },
  mounted() {
    const profileUrl = `${location.href}/profiles`;
    Axios.get(profileUrl)
      .then((response) => {
        this.user.name = response.data.username;
        this.content = response.data.profile.introduction;
        this.profile = response.data.profile;
      });
  },
};
</script>
