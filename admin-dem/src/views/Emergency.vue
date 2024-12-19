<template>
  <v-app>
    <navbar></navbar>
    <div class="pa-3">
      <p class="headline font-weight-light text-center">Listado de Emergencias</p>
      <v-divider></v-divider>
      <v-row>
        <v-col cols="12">
          <v-row align="center" justify="center">
            <v-card outlined class="ma-1 card-info">
              <v-card-title class="headline">8</v-card-title>
              <v-card-text>Total</v-card-text>
            </v-card>
            <v-card outlined class="ma-1 card-info">
              <v-card-title class="headline">1</v-card-title>
              <v-card-text>Pendientes</v-card-text>
            </v-card>
            <v-card outlined class="ma-1 card-info">
              <v-card-title class="headline">2</v-card-title>
              <v-card-text>En camino</v-card-text>
            </v-card>
            <v-card outlined class="ma-1 card-info">
              <v-card-title class="headline">3</v-card-title>
              <v-card-text>Completadas</v-card-text>
            </v-card>
            <v-card outlined class="ma-1 card-info">
              <v-card-title class="headline">2</v-card-title>
              <v-card-text>Falsos</v-card-text>
            </v-card>
          </v-row>
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="12">
          <v-btn-toggle v-model="optionTable" @change="loadTable" tile color="primary" group>
            <v-btn value="active">Activos</v-btn>
            <v-btn value="all">Todos</v-btn>
          </v-btn-toggle>
        </v-col>
        <v-col cols="12">
          <v-data-table :headers="headers" :items="bodyEmergency" class="elevation-1">
            <template v-slot:item.category="{ item }">
              <v-chip :color="getColor(item.category)" dark>{{ item.category }}</v-chip>
            </template>
            <template v-slot:item.status="{ item }">
              <v-chip :color="getColorStatus(item.status)" outlined>{{ item.status }}</v-chip>
            </template>
            <template v-slot:item.action="{ item }">
              <v-icon
                class="mr-2"
                @click="deleteItem(item)"
              >
                mdi-eye
              </v-icon>
              <v-icon
                color="red"
                class="mr-2"
                @click="deleteItem(item)"
              >
                mdi-map-marker
              </v-icon>
            </template>
          </v-data-table>
        </v-col>
      </v-row>
    </div>
  </v-app>
</template>

<script>
import Navbar from "../components/Navbar.vue";

export default {
  components: {
    navbar: Navbar
  },
  data() {
    return {
      optionTable: "active",
      headers: [
        {
          text: "Emergencia ID",
          align: "left",
          sortable: false,
          value: "id"
        },
        { text: "Nombre", value: "name" },
        { text: "Categoria", value: "category" },
        { text: "Tipo", value: "type" },
        { text: "Hora", value: "time" },
        { text: "Estado", value: "status" },
        { text: "Acciones", value: "action", sortable: false }
      ],
      bodyEmergency: [
        {
            id: "35423",
            name: "Gonzalo Ramirez",
            category: 'Bombero',
            type: 'Fuego',
            time: 'Nov 26, 2019 2:24 PM',
            status: 'Pendiente'
          },
          {
            id: "35427",
            name: "Alejandro Cespedes",
            category: 'Ambulancia',
            type: 'Ambulancia',
            time: 'Nov 26, 2019 2:05 PM',
            status: 'En Camino'
          },
          {
            id: "35430",
            name: "Jennifer Calos",
            category: 'Rescate',
            type: 'Rescate',
            time: 'Nov 26, 2019 1:40 PM',
            status: 'En Camino'
          }
      ]
    };
  },
  methods: {
    getColor(category) {
      if (category === 'Bombero') return "red";
      else if (category === 'Ambulancia') return "orange";
      else return "green";
    },
    getColorStatus(status) {
      if (status === 'Pendiente') return "orange";
      else if (status === 'En Camino') return "blue";
      else if (status === 'Completado') return "green";
      else return "red";
    },
    loadTable() {
      if (this.optionTable == 'active') {
        this.bodyEmergency = [
          {
            id: "35423",
            name: "Gonzalo Ramirez",
            category: 'Bombero',
            type: 'Vehicular',
            time: 'Nov 26, 2019 2:10 PM',
            status: 'Pendiente'
          },
          {
            id: "35427",
            name: "Alejandro Cespedes",
            category: 'Ambulancia',
            type: 'Asfixia',
            time: 'Nov 26, 2019 2:05 PM',
            status: 'En Camino'
          },
          {
            id: "35430",
            name: "Jennifer Calos",
            category: 'Rescate',
            type: 'Ascensor',
            time: 'Nov 26, 2019 1:53 PM',
            status: 'En Camino'
          }
        ]
      } else {
        this.bodyEmergency = [
          {
            id: "35412",
            name: "Alicia Peña",
            category: 'Bombero',
            type: 'Fuego',
            time: 'Nov 26, 2019 1:20 PM',
            status: 'Completado'
          },
          {
            id: "35410",
            name: "Manuel Chambi",
            category: 'Ambulancia',
            type: 'Ambulancia',
            time: 'Nov 26, 2019 12:24 PM',
            status: 'Completado'
          },
          {
            id: "35408",
            name: "Elmer Justiniano",
            category: 'Rescate',
            type: 'Rescate',
            time: 'Nov 26, 2019 11:36 AM',
            status: 'Completado'
          },
          {
            id: "35405",
            name: "Antonio Céspedes",
            category: 'Bombero',
            type: 'Fuego',
            time: 'Nov 26, 2019 10:04 AM',
            status: 'Falsos'
          },
          {
            id: "35401",
            name: "Martha Nieves",
            category: 'Bombero',
            type: 'Fuego',
            time: 'Nov 26, 2019 08:18 AM',
            status: 'Falsos'
          }
        ]
      }
    }
  },
};
</script>

<style>
.card-info {
  width: 100%;
  max-width: 120px;
}
</style>
