import Vue from "vue/dist/vue.esm";

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#app",
    data: {
      repos: window.posts,
    },
  });
});
