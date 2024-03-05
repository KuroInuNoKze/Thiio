<template>
    <div class="container">
        <h1 class="main-title">Users</h1>
        <NotificationDialog :dialog="dialog.show" :title="dialog.title" :message="dialog.message" :icon="dialog.icon" @closeDialog="closeDialog" />
        <v-data-table :loading="loading" :items="items" :headers="headers" density="compact">

            <template v-slot:loading>
                <v-skeleton-loader type="table-row@10"></v-skeleton-loader>
            </template>
            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title>List of Users</v-toolbar-title>
                    <v-divider class="mx-4" inset vertical></v-divider>
                    <v-spacer></v-spacer>
                    <v-btn :to="{ name: 'userFormCreate' }">Create User</v-btn>
 
                    <v-dialog v-model="dialogDelete" max-width="500px">
                        <v-card>
                            <v-card-title class="text-h5">Are you sure you want to delete this item?</v-card-title>
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn color="blue-darken-1" variant="text" @click="closeDelete">Cancel</v-btn>
                                <v-btn color="blue-darken-1" variant="text" @click="deleteItemConfirm">OK</v-btn>
                                <v-spacer></v-spacer>
                            </v-card-actions>
                        </v-card>
                    </v-dialog> 
                </v-toolbar>
            </template>
            <template v-slot:item.actions="{ item }">
                <v-icon size="small" class="me-2" @click="editItem(item)">
                    mdi-pencil
                </v-icon>
                <v-icon size="small" @click="deleteItem(item)">
                    mdi-delete
                </v-icon>
            </template>
            <template v-slot:no-data>
                <v-btn color="primary" @click="fetchData">
                    Reset
                </v-btn>
            </template>
        </v-data-table>
    </div>
</template>
<script>
import { ref, nextTick, watch, onMounted } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'
import { useStore } from 'vuex'
import { handleRequestError } from '@/assets/js/utils'
import NotificationDialog from '@/components/NotificationDialog.vue'
export default {
    name: 'Users Index',

    setup() {
        const router = useRouter()
        const store = useStore()

        const dialog = ref({title: '',message: '',icon: '', show: false})
        const closeDialog = () => { dialog.value.show = false }

        onMounted(() => {
            fetchData()
        })
        
        const fetchData = async () => {
            loading.value = true

            await axios.get(
                import.meta.env.VITE__API_URL + "/users", { withCredentials: true }
            ).then((response) => {
                items.value = response.data
            }).catch(e => Object.assign(dialog.value, {...handleRequestError(store, router, e), show: true}))

            loading.value = false
        }
        const headers = [
            { title: 'ID', key: 'id', value: 'id' },
            { title: 'Name', key: 'name', value: 'name' },
            { title: 'Email', key: 'email', value: 'email' },
            { title: 'Actions', key: 'actions', sortable: false },
        ]
        const loading = ref(false)
        const items = ref([])

        const dialogDelete = ref(false)

        const editedItem = ref({
            id: '',
            name: '',
            email: '',
        })
        const defaultItem = ref({
            id: '',
            name: '',
            email: '',
        })

        const editedIndex = ref(-1)

        const editItem = (item) => {
            router.push({ name: 'userFormUpdate', params: { id: item.id } })
        }

        const deleteItem = (item) => {
            editedIndex.value = items.value.indexOf(item)
            editedItem.value = Object.assign({}, item)
            dialogDelete.value = true
        }

        const deleteItemConfirm = async () => {
                await axios.delete(
                    import.meta.env.VITE__API_URL + "/users/"+ editedItem.value.id  , { withCredentials: true }
                ).then((response) => {
                    console.log(response)
                    items.value.splice(editedIndex.value, 1)
                    closeDelete()
                }).catch(e => {
                    Object.assign(dialog.value, {title: "User deleted", message: "The user has been removed!", icon: 'mdi-checkbox-marked-circle', show: true})
                    if (e.response && e.response.status === 422)
                        Object.assign(customErrorMessages.value, e.response.data.errors)
                    else {
                        Object.assign(dialog.value, {...handleRequestError(store, router, e), show: true})
                    }
                })
        }

        const closeDelete = () => {
            dialogDelete.value = false
            nextTick(() => {
                editedItem.value = Object.assign({}, defaultItem.value)
                editedIndex.value = -1
            })
        }

        watch(dialogDelete, async (val) => val || closeDelete())

        const save = () => {
            if (editedIndex.value > -1) {
                Object.assign(items.value[editedIndex.value], editedItem.value)
            } else {
                items.value.push(editedItem.value)
            }
            close()
        }

        return {
            dialog,
            closeDialog,

            headers,
            loading,
            items,
            dialogDelete,
            editedItem,
            defaultItem,
            editedIndex,
            fetchData,
            editItem,
            deleteItem,
            deleteItemConfirm,
            close,
            closeDelete,
            save,
            
        }
    },
}
</script>