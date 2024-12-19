<template>
  <v-app>
    <navbar></navbar>
    <v-card outlined>
      <v-row class="pa-3">
        <v-col cols="2">
          <div class="caption">Emergencia ID</div>
          <div>35427</div>
          <div class="caption">Nombre</div>
          <div>Alejandro Cespedes</div>
        </v-col>
        <v-col cols="2">
          <div class="caption">Categoria</div>
          <v-chip color="red" dark>Fuego</v-chip>
          <div class="caption">Tipo</div>
          <div>Incendio de Vehiculo</div>
        </v-col>
        <v-col cols="2">
          <div class="caption">Estado</div>
          <v-chip color="blue" outlined>En camino</v-chip>
          <div class="caption">Hora</div>
          <div>Nov 26, 2019 2:05 PM</div>
        </v-col>
        <v-col cols="3">
          <div class="caption">Descripcion</div>
          <div>Un vehiculo esta en llamas en plena calle</div>
        </v-col>
        <v-col cols="3">
          <div class="caption">Direccion</div>
          <div>4to y 5to anillo zona el cambodromo</div>
        </v-col>
      </v-row>
    </v-card>

    <div style="width:100%; height:100%">
      <l-map
        ref="myMap"
        style="z-index:0"
        :zoom="zoom"
        :center="center"
        :options="{zoomControl: false}"
      >
        <l-tile-layer :url="url" :attribution="attribution"></l-tile-layer>
        <l-marker :lat-lng="center">
          <l-popup>Hola</l-popup>
        </l-marker>
      </l-map>
    </div>
  </v-app>
</template>

<script>
import Navbar from "../components/Navbar.vue";
import { LMap, LTileLayer, LMarker, LPopup } from "vue2-leaflet";

export default {
  components: { navbar: Navbar, "l-map": LMap, "l-tile-layer": LTileLayer, 'l-marker': LMarker, 'l-popup': LPopup },
  data() {
    return {
      zoom: 14,
      center: [-17.753407, -63.151994],
      url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      attribution:
        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    };
  },
  methods: {

  }
};
</script>
