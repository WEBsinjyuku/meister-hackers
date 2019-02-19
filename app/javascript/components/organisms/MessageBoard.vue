<template lang="pug">
form(@submit.prevent="submit")
  .tile.is-ancestor
    .tile.is-vertical.box.is-9
      .title.has-background-grey-lighter フィード
      input.input(type="text" placeholder="コメント")
      br
      button(type="submit").button.is-info 投稿
      br
      .list
        li(v-for="message in messages" :key="message.id").list-item
          | {{ message.text }}
</template>

<script>
import Axios from "axios";

export default {
  data() {
    return {
      messages: [],
    };
  },
  mounted() {
    Axios.get("http://localhost:3000/posts/1/messages")
      .then((res) => {
        this.messages = res.data;
      });
  },
  methods: {
    submit() {
      console.log("submit called");
    },
  },
};
</script>
