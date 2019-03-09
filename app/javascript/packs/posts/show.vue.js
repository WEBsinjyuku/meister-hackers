import Vue from "vue/dist/vue.esm";
import MessageBoard from "../../components/organisms/MessageBoard.vue";

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#message-board",
    render: h => h(MessageBoard),
  });

  new Vue({
    el: "#show-button",
    data: {
      isActive: false,
    },
  });
});
