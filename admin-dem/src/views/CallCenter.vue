<template>
  <v-app>
    <navbar></navbar>
    <v-row>
      <v-col cols="6">
        <v-card outlined class="mt-2 ml-2">
          <v-card-text>
            <v-form ref="form" v-model="valid" lazy-validation>
              <v-row>
                <v-col cols="6">
                  <v-text-field outlined v-model="name" :rules="nameRules" label="Nombre y apellido*" required></v-text-field>
                </v-col>
                <v-col cols="6">
                  <v-text-field outlined v-model="email" :rules="nameRules" label="Celular*" type="number" required></v-text-field>
                </v-col>
              </v-row>

              <v-row>
                <v-col cols="12" md="6">
                  <v-textarea
                    outlined
                    name="input-7-4"
                    label="Descripcion*"
                    value=""
                    :rules="nameRules"
                  ></v-textarea>
                </v-col>
                <v-col cols="12" md="6">
                  <v-textarea
                    outlined
                    name="input-7-4"
                    label="Direccion*"
                    value=""
                    :rules="nameRules"
                  ></v-textarea>
                </v-col>
              </v-row>
              

              <div class="row">
                <div class="col-6">
                  <v-select outlined
                    v-model="select"
                    :items="optionsEmergency"
                    :rules="[v => !!v || 'Selecciona una categoria']"
                    label="Categoria*"
                    required
                  ></v-select>
                </div>
                <div class="col-6">
                  <v-select outlined
                    v-model="select"
                    :items="optionsEmergency"
                    :rules="[v => !!v || 'Selecciona el tipo de Emergencia']"
                    label="Tipo*"
                    required
                  ></v-select>
                </div>
              </div>

              <v-btn color="success" class="mr-4" @click="validate">Procesar</v-btn>
            </v-form>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col cols="6">
        <v-card style="width:95%; height:95%" outlined class="mt-2 mr-2">
          <div style="width:100%; height:100%">
            <l-map
              ref="myMap"
              style="z-index:0"
              :zoom="zoom"
              :center="center"
              @update:center="centerUpdated"
              :options="{zoomControl: false}"
            >
              <l-tile-layer :url="url" :attribution="attribution"></l-tile-layer>
              <l-marker :lat-lng="center">
                <l-popup>Hola</l-popup>
              </l-marker>
            </l-map>
          </div>
        </v-card>
      </v-col>
    </v-row>
  </v-app>
</template>

<script>
import Navbar from "../components/Navbar.vue";
import { LMap, LTileLayer, LMarker, LPopup } from "vue2-leaflet";

export default {
  components: { navbar: Navbar, "l-map": LMap, "l-tile-layer": LTileLayer, 'l-marker': LMarker, 'l-popup': LPopup },
  data: () => ({
    valid: true,
    name: "",
    nameRules: [
      v => !!v || "Este campo es obligatorio"
    ],
    email: "",
    select: null,
    optionsEmergency: ["Fuego", "Ambulancia", "Rescate", "Accidente"],
    zoom: 13,
      center: [-17.783384, -63.18203],
      url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      attribution:
        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
  }),

  methods: {
    validate() {
      if (this.$refs.form.validate()) {
        this.snackbar = true;
      }
    },
    centerUpdated(center) {
      this.center = center;
    }
  }
};
</script>
