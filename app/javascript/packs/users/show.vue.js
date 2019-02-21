import Vue from "vue/dist/vue.esm";
import MyPage from "../../components/organisms/MyPage.vue";

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#mypage",
    render: h => h(MyPage),
  });
});
