<template>
  <v-app>
    <navbar></navbar>
    <div class="pa-3">
      <p class="headline font-weight-light text-center">Reportes</p>
      <v-divider></v-divider>
      <v-container>
        <v-row>
          <v-col cols="6">
            <barchart v-bind:chartdata="chartdata" v-bind:options="options"></barchart>
          </v-col>
          <v-col cols="6">
            <piechart v-bind:chartdata="chartdataPie" v-bind:options="options"></piechart>
          </v-col>
        </v-row>
      </v-container>
    </div>
  </v-app>
</template>

<script>
import Navbar from "../components/Navbar.vue";
import BarChart from "../components/BarChart.vue"
import PieChart from "../components/PieChart.vue"

export default {
  components: {
    navbar: Navbar,
    barchart: BarChart,
    piechart: PieChart
  },
  data() {
    return {
      chartdata: {
        labels: ["26 Nov", "27 Nov", "28 Nov", "29 Nov", "30 Nov"],
        datasets: [
          {
            label: "Emergencias atendidas",
            backgroundColor: "#f87979",
            minBarLength: 1,
            data: [[27, 10], 20, 25, 30, 20]
          }
        ]
      },
      chartdataPie: {
        labels: ["Bomberos", "Ambulancia", "Rescate"],
        datasets: [
          {
            backgroundColor: ["#213dad", "#d61c1c", "#eda62b"],
            data: [30, 50, 20]
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false
      }
    };
  }
};
</script>
