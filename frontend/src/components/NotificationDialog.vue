<template>
    <v-dialog max-width="500" v-model="dialog" persistent>
        <template v-slot:default="{ dialog }">

            <v-card :title="title" class="text-center">
                <div class="card-icon"><v-icon :icon="icon" size="x-large"></v-icon></div>
                <v-card-text>
                    {{ message }}
                </v-card-text>

                <v-card-actions>
                    <v-spacer></v-spacer>

                    <v-btn text="Close" @click="close"></v-btn>
                </v-card-actions>
            </v-card>
        </template>
    </v-dialog>
</template>
  
<script>
import { ref, computed, watch } from 'vue';

export default {
    name: 'Notification Dialog',
    props: {
        dialog: Boolean,
        title: String,
        message: String,
        icon: String
    },
    setup(props, context) {
        const dialog = computed(() => props.dialog)
        const title = computed(() => props.title)
        const message = computed(() => props.message)
        const icon = computed(() => props.icon)
        const close =  () => context.emit("closeDialog", false)

        return {
            close,
            dialog,
            title,
            message,
            icon,
        }
    }
}
</script>
<style scoped>
.card-icon i{
margin: 30px 0px 10px;
}
.card-icon i:before{
    font-size: 60px;
}
</style>