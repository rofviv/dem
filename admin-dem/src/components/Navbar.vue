<template>
  <div>
    <v-app-bar color="teal" dark>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

      <v-toolbar-title>DEM Santa Cruz</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon>
        <v-icon>mdi-exit-to-app</v-icon>
      </v-btn>
    </v-app-bar>
    <v-navigation-drawer v-model="drawer" absolute temporary>
      <v-list-item>
        <!-- <v-list-item-avatar>
          <v-img :src="avatar"></v-img>
        </v-list-item-avatar> -->

        <v-list-item-content>
          <v-list-item-title>Menu</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>

      <v-list dense>
        <v-list-item color="primary" v-for="item in links" :key="item.text" link :to="item.route">
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.text }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </div>
</template>

<script>
export default {
  data() {
    return {
      logo: require("@/assets/logo.png"),
      avatar: require("@/assets/logo.png"),
      drawer: false,
      links: [
        { icon: "mdi-view-dashboard", text: "Tablero", route: "/admin/dashboard" },
        { icon: "mdi-account-group", text: "Usuarios", route: "/admin/users" },
        { icon: "mdi-map", text: "Mapa", route: "/admin/mapview" },
        { icon: "mdi-car-brake-alert", text: "Emergencias", route: "/admin/emergency" },
        { icon: "mdi-phone", text: "CallCenter", route: "/admin/callcenter" },
        { icon: "mdi-file-chart", text: "Reportes", route: "/admin/report" },
        { icon: "mdi-history", text: "Bitácora", route: "/admin/logs" }
      ]
    };
  },
  methods: {
    logout() {
      this.$store.dispatch("auth/destroyToken");
      this.$router.replace({ name: "login" });
    }
  }
};
</script>