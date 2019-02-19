<template lang="pug">
.tile.is-ancestor
  .tile.is-vertical.box.is-8
    .title.has-background-grey-lighter フィード
    input.input(type="text" placeholder="コメント")
    br
    .button.is-info 投稿
    br
    .list
      li(v-for="message in messages" :key="message.id").list-item
        | {{ message.text }}
</template>

<script>
export default {
  data() {
    return {
      messages: [
        {
          id: 1,
          text: "こんにちは",
        },
        {
          id: 2,
          text: "はじめまして、よろしくおねがいします。",
        },
        {
          id: 3,
          text: "すみません、遅れます。。。",
        },
      ],
    };
  },
};
</script>
