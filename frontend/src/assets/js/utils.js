import axiosErrorMessages from "./errorMessages/axiosErrorMessages"
import loginFormErrorMessages from "./errorMessages/loginFormErrorMessages"
const handleRequestError = (store, router, error, alert = false) => {
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

const handleLoginRequestError = (error) => {
    console.log('The error code is:', error)
    if(!error.response && error.code === 'ERR_NETWORK'){
        return {title: "Check your conection", message: "There's something wrong with your conection to our server.", icon: 'mdi-close-network'}
    }
    else if (error.response && error.response.status === 401) {
        return {title: "Wrong Credentials", message: (loginFormErrorMessages[error.response.status] != undefined ? loginFormErrorMessages[error.response.status] : loginFormErrorMessages['default']), icon: 'mdi-close-circle'}
    }
    else {
        return {title: `Error ${error.response.status}`, message: (loginFormErrorMessages[error.response.status] != undefined ? loginFormErrorMessages[error.response.status] : loginFormErrorMessages['default']), icon: 'mdi-close-circle'}
    }
}
export {handleRequestError, handleLoginRequestError }