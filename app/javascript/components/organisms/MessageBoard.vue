<template lang="pug">
form(@submit.prevent="submit")
  .tile.is-ancestor.show-comment
    .tile.is-vertical
      .title コメント
      .submit-area(v-if="signed_in")
        input.input(type="text" placeholder="コメント" v-model="content")
        button(type="submit").button.is-danger.is-rounded 投稿
      li(v-if="messages.length == 0" v-bind:class="{'signed-out': !signed_in}")
        | コメントはありません
      li(v-for="(message, index) in messages" :key="message.id" v-bind:class="{'signed-out': !signed_in && index == 0}").message-wrapper
        table
          tr
            td.is-width-1
              img(v-bind:src="message.avatar_url" size="30x30" alt="userIcon" v-if="message.avatar_url").show-owner-img
            td.is-width-9
              .message
                .message-header
                  p {{ message.user_name }}
                  a.delete-button(type="button" v-if="message.user_id == logged_in_user_id" @click="del(message.message_id, index)") 削除
                .message-body
                  | {{ `${message.content}` }}
                .message-time
                  | {{ `${message.time}` }}
</template>

<script>
import Axios from "axios";
import moment from "moment";

export default {
  data() {
    return {
      messages: [],
      content: "",
      signed_in: false,
      logged_in_user_id: null,
    };
  },
  mounted() {
    const messageUrl = `${location.href}/messages`;
    Axios.get(messageUrl)
      .then((response) => {
        if (response.data.data) {
          response.data.data.map((h) => {
            this.messages.unshift({
              message_id: h.id,
              user_id: h.user_id,
              avatar_url: h.avatar_url,
              user_name: h.name,
              content: h.content,
              time: moment(h.created_at).format("YYYY/MM/DD HH:mm"),
            });
          });
        }
        this.signed_in = response.data.signed_in;
        this.logged_in_user_id = response.data.logged_in_user_id;
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
          .then((response) => {
            this.messages.unshift({
              message_id: response.data.data[0].message["id"],
              user_id: response.data.data[0].message["user_id"],
              avatar_url: response.data.data[0].user["avatar_url"],
              user_name: response.data.data[0].user["name"],
              content: this.content,
              time: moment().format("YYYY/MM/DD HH:mm"),
            });
            this.content = "";
          });
      }
    },
    del: function (id, index) {
      const messageDeleteUrl = `${location.href}/messages/${id}`;
      Axios.delete(messageDeleteUrl)
        .then((response) => {
          if (response.data.status === 200) {
            console.log(this.messages);
            this.messages.splice(index, 1);
          }
          if (response.data.status === 500) {
            console.log("コメント削除失敗");
          }
        });
    },
  },
};
</script>

<style scoped>
  .show-comment {
    padding: 0.75rem;
  }

  .title {
    font-size: 1.5rem;
    border-bottom: 1px solid;
  }

  .submit-area {
    margin-bottom: 15px;
  }

  .signed-out {
    border-top: none;
  }
  .input {
    max-width: 88%;
  }

  .button {
    max-width: 9%;
    margin-left: 3%;
  }

  li {
    display: block;
    border-top: 1px solid;
    margin-bottom: 30px;
  }

  table {
    width: 100%;
  }

  .is-width-1 {
    text-align: center;
    width: 8%;
  }

  .is-width-9 {
    width: 90%
  }
  .message {
    background-color: initial;
    margin-bottom: initial;
    margin-top: 10px;
  }

  .message-header {
    background-color: #f9fbfe;
    color: initial;
    padding: 0.50em 0.75em;
    border: solid 1px #cdc8c8;
    border-bottom: 0px;
  }

  .message-header a {
    color: red;
  }

  .show-owner-img {
    margin: 10px 0px 5px 5px;
  }

  .message-body {
    padding: 0.50em 0.75em;
    border: solid 1px #cdc8c8;
  }

  .message-time {
    font-size: 0.75rem;
    float: right;
  }

  .delete-button {
    color: red !important;
  }
</style>
