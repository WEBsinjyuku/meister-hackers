import Vue from "vue/dist/vue.esm";
import MessageBoard from "../../components/organisms/MessageBoard.vue";

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#app",
    render: h => h(MessageBoard),
  });
});
