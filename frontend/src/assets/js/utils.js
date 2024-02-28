import axiosErrorMessages from "./errorMessages/axiosErrorMessages"
const handleRequestError = (store, router, error, alert = false) => {
    console.log('The error code is:', error)
    if(!error.response && error.code === 'ERR_NETWORK'){
        return {title: "Check your conection", message: "There's something wrong with your conection to our server.", icon: 'mdi-close-network'}
    }
    else if (error.response && error.response.status === 401) {
        store.dispatch('clearUser')
        router.push({ name: 'Login' })
    }
    else {
        if(!alert)
            return {title: `Error ${error.response.status}`, message: (axiosErrorMessages[error.response.status] != undefined ? axiosErrorMessages[error.response.status] : axiosErrorMessages['default']), icon: 'mdi-close-circle'}
        alert(axiosErrorMessages[error.response.status] != undefined ? axiosErrorMessages[error.response.status] : axiosErrorMessages['default'])
    }
}
export {handleRequestError, }