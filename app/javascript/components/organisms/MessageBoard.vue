<template lang="pug">
.tile.is-ancestor
  .tile.is-vertical.box.is-6
    .title.has-background-grey-lighter フィード
    input.input(type="text" placeholder="コメント")
    .button.is-info 投稿
    ul
      li(v-for="message in messages" :key="message.id")
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
