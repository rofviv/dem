<template>
  <v-app>
    <navbar></navbar>
    <div class="pa-3">
      <p class="headline font-weight-light text-center">Detalles de Usuarios</p>
      <v-divider></v-divider>
    </div>
    <div class="text-center">
      <v-card outlined class="mx-auto pa-4" max-width="500" >
        <v-row class="justify-center">
          <v-col cols="8">
            <v-text-field
              label="Ingresa numero de celular"
              outlined
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <v-btn color="primary">Ver detalles</v-btn>
          </v-col>
        </v-row>
      </v-card>
    </div>
  </v-app>
</template>

<script>
import Navbar from "../components/Navbar.vue";

export default {
  components: {
    navbar: Navbar
  }
};
</script>
