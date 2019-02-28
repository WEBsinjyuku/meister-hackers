import Vue from "vue/dist/vue.esm";
import Axios from "axios";

import MessageBoard from "../../components/organisms/MessageBoard.vue";
import UserProfile from "../../components/molecules/UserProfile.vue";

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#message-board",
    render: h => h(MessageBoard),
  });
});

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#user-profile",
    render: h => h(UserProfile),
    data() {
      return {
        user: {
          id: 0,
          name: "",
          avatar: "",
          isLogin: false,
        },
        profile: null,
      };
    },
    mounted() {
      const profileUrl = "/users/17/profiles";
      Axios.get(profileUrl)
        .then((response) => {
          this.user.name = response.data.username;
          this.user.id = response.data.id;
          this.user.avatar = response.data.avatar;
          this.user.isLogin = response.data.is_login;
          if (response.data.profile) {
            this.profile = response.data.profile;
          }
        });
    },
  });
});
