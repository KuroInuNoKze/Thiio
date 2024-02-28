import { createStore } from 'vuex'
import VuexPersistence from 'vuex-persist'


export default createStore({
  state: {
    authenticated: false,
    userDataFetched: false,
    user: { name: '', email: '', profilePicture: '' },
  },
  mutations: {
    SET_AUTH: (state, auth) => state.authenticated = auth,
    SET_USER: (state, userData) => state.user = userData
  },
  actions: {
    setAuth: (context, auth) => context.commit('SET_AUTH', auth),
    setUser: (context, data) => context.commit('SET_USER', data),
    clearUser: (context) => {
      context.commit('SET_USER', { name: '', email: '', profilePicture: '' })
      context.commit('SET_AUTH', false)
    },
  },
  getters: {
    getAuth(state) {
      return state.authenticated
    },
    getUser(state) {
      return state.user
    },

  },
  plugins: [new VuexPersistence().plugin]
})