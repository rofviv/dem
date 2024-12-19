<template>
  <v-container>
    <snackbar />
    <v-layout align-center justify-center row fill-height class="mt-5">
      <v-flex xs12 sm8 md5>
        <v-card>
          <v-card-title>
            <v-icon class="mr-2">mdi-lock</v-icon>
            <h1 class="display-1 font-weight-light">Login DEM Santa Cruz</h1>
          </v-card-title>
          <v-form ref="form">
            <v-card-text>
              <v-text-field
                v-model="username"
                :rules="nameRules"
                :counter="10"
                label="Usuario"
                required
              ></v-text-field>
              <v-text-field
                v-model="password"
                :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                :rules="[rules.required, rules.min]"
                :type="show1 ? 'text' : 'password'"
                name="input-10-1"
                label="Contraseña"
                hint="Al menos 4 caracteres"
                counter
                @click:append="show1 = !show1"
              ></v-text-field>
            </v-card-text>
            <v-card-actions>
              <v-btn block color="#333" dark @click="login" :loading="loadBtn">Ingresar</v-btn>
            </v-card-actions>
          </v-form>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import Snackbar from "../components/Snackbar.vue";

export default {
  components: {
    snackbar: Snackbar
  },
  data: () => ({
    valid: false,
    username: "",
    show1: false,
    password: "",
    nameRules: [
      v => !!v || "Usuario es requerido",
      v => v.length <= 10 || "El Usuario no puede pasar los 10 caracteres"
    ],
    loadBtn: false,
    rules: {
      required: value => !!value || "La contraseña es requerida.",
      min: v => v.length >= 4 || "Mínimo 4 caracteres"
    }
  }),
  methods: {
    async login() {
      if (this.$refs.form.validate()) {
        const URI = this.$http.defaults.baseURL + "/api/users/login";
        const params = { user: this.username, pass: this.password };
        this.loadBtn = true;
        try {
          const res = await this.$http.post(URI, params);
          if (res.data.token != "-1") {
            this.$store.dispatch('auth/saveToken', res.data.token);
            this.$router.replace({ name: "dashboard" });
          } else {
            this.showNotification(true, "El usuario o contraseñas son incorrectos", 3000, "warning");
          }
        } catch (error) {
          this.showNotification(true, "No se puede conectar al servidor", 6000, "error");
        } finally {
          this.loadBtn = false;
        }
      }
    },
    showNotification(visib, msg, time, color) {
      const notification = {
        visibility: visib,
        message: msg,
        timeout: time,
        color: color
      };
      this.$store.dispatch("notification/show", notification);
    }
  },
  computed: {}
};
</script>