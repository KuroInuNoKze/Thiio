<template>
    <div class="user-form-page">
        <NotificationDialog :dialog="dialog.show" :title="dialog.title" :message="dialog.message" :icon="dialog.icon"
            @closeDialog="closeDialog" />
        <div class="back-button-cont"> <v-btn type="button" text="Back" @click="back"></v-btn> </div>

        <v-card class="user-card">
            <v-card-title class="text-center">Update User # {{ id }} </v-card-title>
            <v-card-item>
                <v-form ref="formPicture" validate-on="submit lazy" @submit.prevent="submitPicture">
                    <div class="profile-img-holder"><v-avatar size="60"><v-img :src="userPicture.picture"
                                :alt="userData.name"></v-img></v-avatar></div>
                    <v-file-input ref="pictureRef" v-model="userPictureModel" label="Profile Picture" variant="outlined"
                        :error-messages="customErrorMessages.picture" accept="image/*" show-size counter
                        prepend-icon="mdi-camera" @change="previewPicture" @click:clear="previewPicture"  :rules="[dataValidation.generalRules.required]"></v-file-input>
                    <div class="form-actins-cont">
                        <v-btn :loading="loadingPicture" type="submit" class="me-4" text="Update Picture"></v-btn>
                    </div>
                </v-form>
                <v-form ref="formData" validate-on="submit lazy" @submit.prevent="submitData">
                    <v-text-field v-model="userData.name" :rules="[dataValidation.generalRules.required]"
                        :error-messages="customErrorMessages.name" label="Name" placeholder="John Doe"></v-text-field>
                    <v-text-field v-model="userData.email"
                        :rules="[dataValidation.generalRules.required, dataValidation.generalRules.minLength, ...dataValidation.emailRules]"
                        :error-messages="customErrorMessages.email" label="Email"
                        placeholder="johndoe@gmail.com"></v-text-field>
                    <div class="form-actins-cont">
                        <v-btn :loading="loadingData" type="submit" class="me-4" text="Update Data"></v-btn>
                    </div>
                </v-form>

                <v-form ref="formPassword" validate-on="submit lazy" @submit.prevent="submitPassword">
                    <v-text-field v-model="userPassword.password"
                        :rules="[dataValidation.generalRules.required, dataValidation.generalRules.minLength, ...dataValidation.passwordRules]"
                        :error-messages="customErrorMessages.password" label="Password" placeholder="Password"
                        type="password"></v-text-field>
                    <v-text-field v-model="userPassword.passwordConfirm"
                        :rules="[dataValidation.generalRules.required, dataValidation.generalRules.minLength, ...dataValidation.passwordRules]"
                        :error-messages="customErrorMessages.passwordConfirm" label="Repeat Password"
                        placeholder="Repeat Password" type="password"></v-text-field>
                    <div class="form-actins-cont">
                        <v-btn :loading="loadingPassword" type="submit" class="me-4" text="Update Password"></v-btn>
                    </div>
                </v-form>
            </v-card-item>
        </v-card>
    </div>
</template>

<script>
import axios from 'axios'
import { useRouter } from 'vue-router'
import { useStore } from "vuex";
import { ref, computed, defineEmits, onMounted } from 'vue'
import { handleRequestError } from '@/assets/js/utils'
import NotificationDialog from '@/components/NotificationDialog.vue'

export default {
    props: {
        id: String
    },
    setup(props, context) {
        const router = useRouter()
        const store = useStore()
        const dialog = ref({ title: '', message: '', icon: '', show: false })
        const closeDialog = () => { dialog.value.show = false }

        const formData = ref(null)
        const loadingData = ref(false)
        const userData = ref({ name: '', email: '', profile_picture:'' })

        const formPicture = ref(null)
        const loadingPicture = ref(false)
        const userPictureModel = ref(null)
        const defaultUserPicture =  'default-profile-picture.png'

        const pictureRef = ref(null)
        const userPicture = ref({ picture: import.meta.env.VITE__RES_PROFILE_URL + (userData.value.profile_picture || defaultUserPicture) })
        const previewPicture = (e) => {
            let base64String = "";
            if (e.target.files && e.target.files[0]) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    base64String = e.target.result;
                    userPicture.value.picture = base64String
                }
                reader.readAsDataURL(e.target.files[0])
            }
            else
                userPicture.value.picture = import.meta.env.VITE__RES_PROFILE_URL + defaultUserPicture
        }



        const formPassword = ref(null)
        const loadingPassword = ref(false)
        const userPassword = ref({ password: '', passwordConfirm: '' })

        const message = ref('')
        const customErrorMessages = ref({ name: [], email: [], password: [], passwordConfirm: [], picture: [] })

        const dataValidation = {
            generalRules: {
                required: v => !!v || "This field can't be empty.",
                minLength: v => (v && v.length >= 8) || `This field must be at least 8 characters`,
            },
            emailRules: [
                v => (/^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$/.test(v)) || 'Must be a valid e-mail.',
            ],
            passwordRules: [
                v => (userPassword.value.password === userPassword.value.passwordConfirm) || 'Password and Password confirmation must match.',
            ],
        }
        onMounted(() => {
            fetchData()
        })
        const fetchData = async () => {
            await axios.get(
                import.meta.env.VITE__API_URL + "/users/" + props.id, { withCredentials: true }
            ).then((response) => {
                userData.value = { name: response.data.name, email: response.data.email, profile_picture: response.data.profile_picture }
                userPicture.value.picture = import.meta.env.VITE__RES_PROFILE_URL + (userData.value.profile_picture || defaultUserPicture)
            }).catch(e => Object.assign(dialog.value, { ...handleRequestError(store, router, e), show: true }))
        }
        const submitData = async (e) => {
            e.preventDefault()
            let formIsValid = await isValidData()
            if (formIsValid.valid) {
                loadingData.value = true
                await axios.put(
                    import.meta.env.VITE__API_URL + "/users/" + props.id, userData.value, { withCredentials: true }
                ).then((response) => {
                    if(props.id == store.getters.getUser.id){
                        store.dispatch('setUser', {...store.getters.getUser, email:userData.value.email, name:userData.value.name})
                        context.emit('update-user', true)
                    }
                    Object.assign(dialog.value, { title: "Changes applied!", message: "Profile data has been successfully updated!", icon: 'mdi-checkbox-marked-circle', show: true })
                }).catch(e => {
                    if (e.response && e.response.status === 422)
                        Object.assign(customErrorMessages.value, e.response.data.errors)
                    else {
                        Object.assign(dialog.value, { ...handleRequestError(store, router, e), show: true })

                    }
                })
                loadingData.value = false
            }
        }
        const submitPassword = async (e) => {
            e.preventDefault()
            let formIsValid = await isValidPassword()
            if (formIsValid.valid) {
                loadingPassword.value = true
                await axios.put(
                    import.meta.env.VITE__API_URL + "/users/update-password/" + props.id, { password: userPassword.value.password }, { withCredentials: true }
                ).then((response) => {
                    Object.assign(dialog.value, { title: "Changes have been applied!", message: "The password has been changed!", icon: 'mdi-checkbox-marked-circle', show: true })
                }).catch(e => {
                    if (e.response && e.response.status === 422)
                        Object.assign(customErrorMessages.value, e.response.data.errors)
                    else {
                        Object.assign(dialog.value, { ...handleRequestError(store, router, e), show: true })

                    }
                })
                loadingPassword.value = false
            }
        }

        //Note: The empty error must be raised manually beacuse of a bug of the v-file-input formPicture.value.validate()
        //is not working correctly if not validated at the backend and this might send nothing and still mark the form as valid
        const submitPicture = async (e) => {
            e.preventDefault()
            let formPictureIsValid = await isValidPicture()
            console.log(formPictureIsValid.valid)
            if(formPictureIsValid.valid){
                const formData = new FormData()
                formData.append('profile_picture', pictureRef.value.files[0])
                loadingPicture.value = true
                await axios.post(
                    import.meta.env.VITE__API_URL + "/users/update-picture/" + props.id, formData, { headers: {'Content-Type': 'multipart/form-data'}, withCredentials: true }
                ).then((response) => {
                    Object.assign(dialog.value, { title: "Changes have been applied!", message: "The profile picutre has been changed!", icon: 'mdi-checkbox-marked-circle', show: true })
                    if(props.id == store.getters.getUser.id){
                        store.dispatch('setUser', {...store.getters.getUser, profile_picture:response.data.profile_image})
                        context.emit('update-user', true)
                    }
                }).catch(e => {
                    if ((e.response && e.response.status === 422) || (e.response && e.response.status === 400))
                        Object.assign(customErrorMessages.value, e.response.data.errors)
                    else {
                        Object.assign(dialog.value, { ...handleRequestError(store, router, e), show: true })
                    }
                })
                loadingPicture.value = false
            }
            

        }
        const isValidData = async () => {
            return formData.value.validate()
        }
        const isValidPassword = async () => {
            return formPassword.value.validate()
        }
        const isValidPicture = async () => {
            return formPicture.value.validate()
        }

        const back = () => {
            router.push({name: "Users"})
        }
        return {
            dialog,
            closeDialog,


            isValidPicture,
            pictureRef,
            formPicture,
            loadingPicture,
            userPicture,
            submitPicture,
            previewPicture,
            userPictureModel,
            defaultUserPicture,

            isValidData,
            submitData,
            formData,
            loadingData,
            userData,

            isValidPassword,
            submitPassword,
            formPassword,
            loadingPassword,
            userPassword,

            dataValidation,
            customErrorMessages,
            message,
            back,
        }
    }
}
</script>
<style scoped>
.profile-img-holder {
    width: 100%;
    text-align: center;
    margin-bottom: 30px;

}

.user-form-page {
    display: flex;
    flex-direction: column;
    align-items: center;
    min-height: 100vh;
    width: 100%;
    max-width: 500px;
    gap: 30px;
    padding: 30px;
}

.form-actins-cont {
    display: flex;
    padding-bottom: 20px;
    width: 100%;
    justify-content: center;
}

.back-button-cont {
    width: 100%;
}

.user-card {
    width: 100%;
}</style>