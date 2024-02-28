<template>
  <div class="container">
    <h1 class="main-title">Dashboard</h1>
    <v-card class="d-card">
      <v-card-item class="text-center">
        <div>
          <div class="card-icon"><v-icon icon="mdi-account-multiple" size="72"></v-icon></div>
          <div class="text-h6 mb-1 text-center">
            Users
          </div>
          <div class="text-caption text-center">Section for management of existing users.</div>
        </div>
      </v-card-item>
      <v-card-actions class="d-flex justify-center">
        <v-btn v-ripple :to="{ name: 'Users' }">View</v-btn>
      </v-card-actions>
    </v-card>
  </div>
</template>
<script>
export default {
  name: "Dashboard",
  setup() {
  }
};
</script>
<style scoped>
.d-card{
  width: 100%;
  max-width: 300px;
}
.card-icon i{
margin: 30px 0px 10px;
}
.card-icon i:before{
    font-size: 60px;
}
</style>