<template>
    <div class="user-form-page">
        <NotificationDialog :dialog="dialog.show" :title="dialog.title" :message="dialog.message" :icon="dialog.icon"
            @closeDialog="closeDialog" />
        <div class="back-button-cont"> <v-btn type="button" text="Back" @click="back"></v-btn> </div>
        <v-card class="user-card">
            <v-card-title class="text-center">New User</v-card-title>
            <v-card-item>
                <v-form ref="form" validate-on="submit lazy" @submit.prevent="submit">
                    <div class="profile-img-holder"><v-avatar size="60"><v-img :src="userPicture.picture"
                                :alt="user.name"></v-img></v-avatar></div>
                    <v-file-input ref="pictureRef" v-model="userPictureModel" label="Profile Picture" variant="outlined"
                        :error-messages="customErrorMessages.picture" accept="image/*" show-size counter
                        prepend-icon="mdi-camera" @change="previewPicture" @click:clear="previewPicture"></v-file-input>
                    <v-text-field v-model="user.name" :rules="[dataValidation.generalRules.required]"
                        :error-messages="customErrorMessages.name" label="Name" placeholder="John Doe"></v-text-field>
                    <v-text-field v-model="user.email"
                        :rules="[dataValidation.generalRules.required, dataValidation.generalRules.minLength, ...dataValidation.emailRules]"
                        :error-messages="customErrorMessages.email" label="Email"
                        placeholder="johndoe@gmail.com"></v-text-field>
                    <v-text-field v-model="user.password"
                        :rules="[dataValidation.generalRules.required, dataValidation.generalRules.minLength, ...dataValidation.passwordRules]"
                        :error-messages="customErrorMessages.password" label="Password" placeholder="Password"
                        type="password"></v-text-field>
                    <v-text-field v-model="user.passwordConfirm"
                        :rules="[dataValidation.generalRules.required, dataValidation.generalRules.minLength, ...dataValidation.passwordRules]"
                        :error-messages="customErrorMessages.passwordConfirm" label="Repeat Password"
                        placeholder="Repeat Password" type="password"></v-text-field>
                    <div class="form-actins-cont">
                        <v-btn :loading="loading" type="submit" class="me-4" text="Create"></v-btn>
                        <v-btn type="button" text="Cancel" @click="cancel"></v-btn>
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
import { ref, computed, defineEmits } from 'vue'
import { handleRequestError } from '@/assets/js/utils'
import NotificationDialog from '@/components/NotificationDialog.vue'

export default {
    props: {
        id: Number
    },
    setup() {
        const router = useRouter()
        const store = useStore()

        const dialog = ref({ title: '', message: '', icon: '', show: false })
        const closeDialog = () => { dialog.value.show = false }

        const userPicture = ref({ picture: import.meta.env.VITE__RES_PROFILE_URL + '/default-profile-picture.png' })
        const userPictureModel = ref(null)
        const previewPicture = (e) => {
            let base64String = "";
            if (e.target.files && e.target.files[0]) {
                user.value.profile_picture = e.target.files[0]
                const reader = new FileReader();
                reader.onload = (e) => {
                    base64String = e.target.result;
                    userPicture.value.picture = base64String
                }
                reader.readAsDataURL(e.target.files[0])
            }
            else
                {
                    user.value.profile_picture = null
                    userPicture.value.picture = import.meta.env.VITE__RES_PROFILE_URL + '/default-profile-picture.png'
                }
        }

        const form = ref(null)
        const loading = ref(false)
        const user = ref({ name: '', email: '', password: '', passwordConfirm: '', profile_picture: '' })
        const message = ref('')
        const customErrorMessages = ref({ name: [], email: [], password: [], passwordConfirm: [] })

        const dataValidation = {
            generalRules: {
                required: v => !!v || "This field can't be empty.",
                minLength: v => (v && v.length >= 8) || `This field must be at least 8 characters`,
            },
            emailRules: [
                v => (/^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$/.test(v)) || 'Must be a valid e-mail.',
            ],
            passwordRules: [
                v => (user.value.password === user.value.passwordConfirm) || 'Password and Password confirmation must match.',
                // v => (/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/).test(v) || 'asdasA<sub>s</sub>d',
            ],
        }

        const submit = async (e) => {
            e.preventDefault();
            message.value = ''
            let formIsValid = await isValid();
            if (formIsValid.valid) {
                loading.value = true
                await axios.post(
                    import.meta.env.VITE__API_URL + "/users/create", user.value, { headers: {'Content-Type': 'multipart/form-data'} , withCredentials: true }
                ).then((response) => {
                    router.push({ name: 'Users' })
                }).catch(e => {
                    if (e.response && e.response.status === 422)
                        Object.assign(customErrorMessages.value, e.response.data.errors)
                    else {
                        Object.assign(dialog.value, { ...handleRequestError(store, router, e), show: true })
                    }
                })
                loading.value = false
            }
        }

        const isValid = async () => {
            return form.value.validate()
        }
        const cancel = () => {
            router.go(-1)
        }

        const back = () => {
            router.push({name: "Users"})
        }
        return {
            dialog,
            closeDialog,
            user,
            userPictureModel,
            userPicture,
            dataValidation,
            customErrorMessages,
            loading,
            message,
            form,
            submit,
            cancel,
            previewPicture,
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