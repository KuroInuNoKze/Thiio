<template>
  <v-app>
    <v-main>
      <component :is="$route.meta.layout || 'div'">
        <router-view />
      </component>
    </v-main>
  </v-app>
</template>

<script setup>
  //
</script>
