<template>
  <v-snackbar v-model="notification.visibility" :timeout="notification.timeout" top :color="notification.color">
    {{ notification.message }}
    <v-btn flat color="white" @click="hideNotification">x</v-btn>
  </v-snackbar>
</template>

<script>
export default {
  data() {
    return {
      state: this.visibility
    };
  },
  methods: {
    hideNotification() {
      this.$store.dispatch('notification/hide');
    }
  },
  computed: {
    notification() {
      return this.$store.state.notification;
    }
  }
};
</script>