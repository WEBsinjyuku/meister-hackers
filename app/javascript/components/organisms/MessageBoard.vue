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
          | {{ `${message.time } | ${message.content}` }}
</template>

<script>
import Axios from "axios";
import moment from "moment";

export default {
  data() {
    return {
      messages: [],
      content: "",
    };
  },
  mounted() {
    const messageUrl = `${location.href}/messages`;
    Axios.get(messageUrl)
      .then((response) => {
        if (response.data.data) {
          response.data.data.map((h) => {
            this.messages.unshift({ content: h.content, time: moment(h.created_at).format("YYYY/MM/DD HH:mm") });
          });
        }
      });
  },
  methods: {
    submit() {
      const messageUrl = `${location.href}/messages`;
      const data = {
        content: this.content,
      };
      Axios.post(messageUrl, data)
        .then(() => {
          this.messages.unshift({ content: this.content, time: moment().format("YYYY/MM/DD HH:mm") });
          this.content = "";
        });
    },
  },
};
</script>
