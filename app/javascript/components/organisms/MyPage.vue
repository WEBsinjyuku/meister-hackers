<template lang="pug">
.bd-content
  .content
    .columns
      .column.is-one-third
        user-profile
      .column.is-two-third
        user-post
</template>

<script>
import Axios from 'axios';
import UserPost from "../../components/molecules/UserPost.vue";
import UserProfile from "../../components/molecules/UserProfile.vue";

export default {
  data() {
    return {
      user: {
        name: "",
        image: ""
      },
      profile: null,
    };
  },
  mounted() {
    const profileUrl = `${location.href}/profiles/1`;
    Axios.get(profileUrl)
      .then((response) => {
        this.user.name = response.data.username
        this.profile = response.data.profile
      });
  },
  components: {
    UserPost,
    UserProfile
  }
}
</script>
