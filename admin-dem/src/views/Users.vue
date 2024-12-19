<template>
  <v-app>
    <navbar></navbar>
    <div class="pa-3">
      <p class="headline font-weight-light text-center">Usuarios del sistema</p>
      <v-divider></v-divider>
    </div>
    <v-container>
      <v-data-table :headers="headers" :items="desserts" sort-by="calories" class="elevation-1">
        <template v-slot:top>
          <v-toolbar flat color="white">
            <v-toolbar-title>Listado</v-toolbar-title>
            <v-divider class="mx-4" inset vertical></v-divider>
            <v-spacer></v-spacer>
            <v-dialog v-model="dialog" max-width="500px">
              <template v-slot:activator="{ on }">
                <v-btn color="warning" dark class="mb-2" v-on="on" >Nuevo usuario</v-btn>
              </template>
              <v-card>
                <v-card-title>
                  <span class="headline">{{ formTitle }}</span>
                </v-card-title>

                <v-card-text>
                  <v-container>
                    <v-row>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field v-model="editedItem.name" label="Nombre"></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field v-model="editedItem.calories" label="Usuario"></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field v-model="editedItem.fat" label="Clave"></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field v-model="editedItem.carbs" label="Rol"></v-text-field>
                      </v-col>
                    </v-row>
                  </v-container>
                </v-card-text>

                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text @click="close">Cancelar</v-btn>
                  <v-btn color="blue darken-1" text @click="save">Guardar</v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </v-toolbar>
        </template>
        <template v-slot:item.action="{ item }">
          <!-- <v-icon small class="mr-2" @click="editItem(item)">edit</v-icon> -->
          <v-btn color="primary" class="mr-2" small @click="editItem(item)">Editar</v-btn>
          <v-btn color="primary" small @click="deleteItem(item)">Suspender</v-btn>
          <!-- <v-icon small @click="deleteItem(item)">delete</v-icon> -->
        </template>
        <template v-slot:no-data>
          <v-btn color="primary" @click="initialize">Reset</v-btn>
        </template>
      </v-data-table>
    </v-container>
  </v-app>
</template>

<script>
import Navbar from "../components/Navbar.vue";

export default {
  components: {
    navbar: Navbar
  },
  data: () => ({
    dialog: false,
    headers: [
      {
        text: "ID",
        align: "left",
        sortable: false,
        value: "name"
      },
      { text: "Nombre", value: "calories" },
      { text: "Usuario", value: "fat" },
      { text: "Rol", value: "rol" },
      { text: "Estado", value: "carbs" },
      { text: "Actions", value: "action", sortable: false }
    ],
    desserts: [],
    editedIndex: -1,
    editedItem: {
      name: "",
      calories: 0,
      fat: 0,
      carbs: 0
    },
    defaultItem: {
      name: "",
      calories: 0,
      fat: 0,
      carbs: 0
    }
  }),

  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Nuevo Usuario" : "Editar Usuario";
    }
  },

  watch: {
    dialog(val) {
      val || this.close();
    }
  },

  created() {
    this.initialize();
  },

  methods: {
    initialize() {
      this.desserts = [
        {
          name: "3245",
          calories: "Gustavo Lopez",
          fat: "glopez",
          rol: 'Administrador',
          carbs: "Activo"
        },
        {
          name: "3256",
          calories: "Marcos Gonzales",
          fat: "mgonzales",
          rol: 'Central',
          carbs: "Activo"
        },
        {
          name: "3260",
          calories: "Dario Mendez",
          fat: "dmendez",
          rol: 'Central',
          carbs: "Activo"
        }
      ];
    },

    editItem(item) {
      this.editedIndex = this.desserts.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      const index = this.desserts.indexOf(item);
      confirm("Estas seguro de suspender a este usuario?") &&
        this.desserts.splice(index, 1);
    },

    close() {
      this.dialog = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
    },

    save() {
      if (this.editedIndex > -1) {
        Object.assign(this.desserts[this.editedIndex], this.editedItem);
      } else {
        this.desserts.push(this.editedItem);
      }
      this.close();
    }
  }
};
</script>
