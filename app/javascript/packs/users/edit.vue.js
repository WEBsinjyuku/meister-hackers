import Vue from "vue/dist/vue.esm";
import MyPageForm from "../../components/organisms/MyPageForm.vue";

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#mypageedit",
    render: h => h(MyPageForm),
  });
});
