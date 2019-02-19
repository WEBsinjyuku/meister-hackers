<template lang="pug">
form(@submit.prevent="submit")
  .tile.is-ancestor
    .tile.is-vertical.box.is-9
      .title.has-background-grey-lighter フィード
      input.input(type="text" placeholder="コメント" v-model="content")
      br
      button(type="submit").button.is-info 投稿
      br
      .list
        li(v-for="message in messages" :key="message.id").list-item
          | {{ message.content }}
</template>

<script>
import Axios from "axios";

export default {
  data() {
    return {
      messages: [],
      content: ""
    };
  },
  mounted() {
    const messageUrl = location.href + "/messages"
    Axios.get(messageUrl)
      .then((response) => {
        this.messages = response.data.data
      })
  },
  methods: {
    submit() {
      const messageUrl = location.href + "/messages"
      const data = {
        content: this.content
      }
      Axios.post(messageUrl, data)
        .then((response) => {
          this.messages = response.data.data
        })
      },
  },
};
</script>
