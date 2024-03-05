<template>
  <v-layout class="rounded rounded-md">
    <v-app-bar title="My App">
      <template v-slot:prepend>
        <v-btn :to="{ name: 'Dashboard' }" icon="mdi-home"></v-btn>
      </template>
    </v-app-bar>

    <v-navigation-drawer expand-on-hover rail>
      <v-list>
        <v-list-item :prepend-avatar="userAvatar" :title="user.name"
          :subtitle="user.email"></v-list-item>
      </v-list>

      <v-divider></v-divider>

      <v-list density="compact" nav>
        <v-list-item prepend-icon="mdi-view-dashboard" title="Dashboard" value="dashboard"
          :to="{ name: 'Dashboard' }"></v-list-item>
        <v-list-item prepend-icon="mdi-account-multiple" title="Users" value="users"
          :to="{ name: 'Users' }"></v-list-item>
        <v-list-item prepend-icon="mdi-logout" title="Log Out" @click="logout" value="logout"></v-list-item>
        <v-list-item prepend-icon="mdi-account" title="Check User" @click="checkUser" value="c"></v-list-item>
      </v-list>
    </v-navigation-drawer>


    <v-main class="d-flex justify-center" style="min-height: 100vh;">
      <router-view @update-user="updateUserEven"></router-view>
    </v-main>
  </v-layout>
</template>
  
<script>
import axios from 'axios'
import { useRouter } from 'vue-router'
import { useStore } from "vuex";
import { onMounted, onBeforeMount, ref, computed } from 'vue';
import { handleRequestError } from '@/assets/js/utils'
export default {
  name: 'AdminLayout',
  setup() {
    // default-profile-picture.png
    const router = useRouter()
    const store = useStore()

    const user = ref(store.getters.getUser)
    const userAvatar = ref(import.meta.env.VITE__RES_PROFILE_URL + (store.getters.getUser.profile_picture || import.meta.env.VITE__API_PROFILE_PICTURE_DEFAULT))
    

    const checkUser = () => {
      console.log(user.value)
    }
    const updateUserEven = () => {
      userAvatar.value = import.meta.env.VITE__RES_PROFILE_URL + (store.getters.getUser.profile_picture || import.meta.env.VITE__API_PROFILE_PICTURE_DEFAULT)
      user.value = store.getters.getUser
    }
    const logout = async () => {
      await axios.post(
        import.meta.env.VITE__API_URL + "/logout", {}, { withCredentials: true }
      ).then((response) => {
        store.dispatch('clearUser', null)
        router.push({name: 'Login'})
      }).catch(e => handleRequestError(store, router, e, true)) 
    }
    const retriveUserData = async () => {
      await axios.get(
        import.meta.env.VITE__API_URL + "/user", { withCredentials: true }
      ).then((response) => {
        user.value = response.data.user
        store.dispatch('setUser', response.data.user)
      }).catch(e => handleRequestError(store, router, e, true))
    }
    onMounted(async () => {
        await retriveUserData();
    });

    return {
      updateUserEven,
      logout,
      userAvatar,
      retriveUserData,
      checkUser,
      user,
    }
  },
}
</script>