<template>
  <div class="login-page">
    <v-card class="login-card">
      <v-card-item>
        <v-form ref="loginForm" validate-on="submit" @submit.prevent="submit">
          <v-img class="login-logo" src="@/assets/logo.svg" />
          <v-text-field v-model="data.email" :rules="dataValidation.emailRules" label="Email"
            placeholder="johndoe@gmail.com"></v-text-field>
          <v-text-field v-model="data.password" :rules="dataValidation.passwordRules" label="Password"
            placeholder="Your password" type="password"></v-text-field>

          <div class="error">{{ message }}</div>
          <v-btn :loading="loading" type="submit" block class="mt-2" text="Login"></v-btn>
        </v-form>
      </v-card-item>
    </v-card>
  </div>
</template>
<script>
import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'
import { useStore } from "vuex";

import loginFormErrorMessages from '@/assets/js/errorMessages/loginFormErrorMessages'

export default {
  name: "Login",
  setup() {
    const loginForm = ref(null)
    const loading = ref(false)
    const message = ref('');
    const data = ref({
      email: "",
      password: ""
    })
    const dataValidation = {
      emailRules: [
        v => (v && v.length > 0) || 'Email can\'t be empty',
        v => (/^[a-z.-]+@[a-z.-]+\.[a-z]+$/i.test(v)) || 'Must be a valid e-mail.',
      ],
      passwordRules: [
        v => (v && v.length > 0) || 'Password can\'t be empty',
      ],
    }
    const router = useRouter()
    const store = useStore()
    const submit = async (e) => {
      e.preventDefault();
      message.value = ''
      let formIsValid = await isValid();
      if (formIsValid.valid) {
        loading.value = true
        
        await axios.post(
          import.meta.env.VITE__API_URL + "/login", data.value, {withCredentials:true}
        ).then((response) => {
          store.dispatch('setAuth', true)
          store.dispatch('setUser', response.data.user)
          router.push('/dashboard')
        }).catch(e =>{
          message.value = loginFormErrorMessages[e.response.status] != undefined ? loginFormErrorMessages[e.response.status] : loginFormErrorMessages['default']
        })
        loginForm.value.reset();
        loading.value = false
      }
    }
    const isValid = async () => {
      return loginForm.value.validate()
    }

    return {
      loginForm,
      data,
      message,
      loading,
      dataValidation,
      isValid,
      submit,
    }
  },
}
</script>
<style scoped>
.login-page {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
}
.login-logo{
  height: 50px;
  margin-bottom: 22px;
}
.login-card{
  width: 100%;
  max-width: 300px;
}
</style>