<template lang="pug">
.card
  .card-image
    figure.image.is-4by3
      img(:src="user.image" alt="Placeholder image")
  .card-content
    .content
      .title {{ user.name }}
      .list(v-if="attributes")
        .list-item
          | 都道府県： {{ attributes.area }}
        .list-item
          | 性別： {{ attributes.sex }}
        .list-item
          | 登録日: {{ attributes.created_at | formatDate }}
      div
        .icon.is-large(v-if="attributes && attributes.github_url")
          a.fab.fa-2x.fa-github(:href="attributes.github_url")
        .icon.is-large(v-if="attributes && attributes.twitter_url")
          a.fab.fa-2x.fa-twitter(:href="attributes.twitter_url")
        .icon.is-large(v-if="attributes && attributes.facebook_url")
          a.fab.fa-2x.fa-facebook(:href="attributes.facebook_url")
        .icon.is-large(v-if="attributes && attributes.blog_url")
          a.fas.fa-2x.fa-rss-square(:href="attributes.blog_url")
      .button.is-primary(@click="edit") 編集
</template>

<script>
import moment from "moment";

export default {
  filters: {
    formatDate(value) {
      if (!value) return "-";
      return moment(value).format("YYYY/MM/DD HH:mm");
    },
  },
  props: ["user", "attributes"],
  computed: {
    editUrl() {
      if (this.user.id && this.attributes.id) {
        return `/users/${this.user.id}/edit`;
      }
      return "/";
    },
  },
  methods: {
    edit() {
      window.location.href = this.editUrl;
    },
  },
};
</script>
