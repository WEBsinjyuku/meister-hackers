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
import UserPost from "../../components/molecules/UserPost.vue";
import UserProfile from "../../components/molecules/UserProfile.vue";

export default {
  components: {
    UserPost,
    UserProfile
  }
}
</script>

