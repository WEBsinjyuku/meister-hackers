<template lang="pug">
form(@submit.prevent="submit")
  .tile.is-ancestor.show-comment
    .tile.is-vertical
      .title コメント
      .submit-area
        input.input(type="text" placeholder="コメント" v-model="content")
        button(type="submit").button.is-danger.is-rounded 投稿
      br

      li(v-for="message in messages" :key="message.id").message-wrapper
        // TODO: サンプル画像(機能実装後、修正すること)
        //img(src="https://avatars1.githubusercontent.com/u/40492325?v=4" size="30x30" alt="userIcon").show-owner-img
        .message
          // TODO: ユーザー名と削除ボタン(機能実装後、修正すること)
          .message-header
            //p ユーザー名
            //a(href="#") 削除
          .message-body
            | {{ `${message.content}` }}
        .message-time
          | {{ `${message.time }` }}
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

      if (this.content !== "") {
        const data = {
          content: this.content,
        };
        Axios.post(messageUrl, data)
          .then(() => {
            this.messages.unshift({ content: this.content, time: moment().format("YYYY/MM/DD HH:mm") });
            this.content = "";
          });
      }
    },
  },
};
</script>
