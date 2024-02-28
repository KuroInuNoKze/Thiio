/**
 * router/index.ts
 *
 * Automatic routes for `./src/pages/*.vue`
 */

// Composables
import { createRouter, createWebHistory } from 'vue-router'
import AdminLayout from '../layouts/AdminLayout.vue'

import store from '@/store'


const publicRoutes = [
  { 'path': '/', 'name': 'Login', 'component': () => import('@/pages/login.vue'), 'meta': { isAuth: false } },
]

const authRoutes = [
  { 'path': '/users', 'name': 'Users', 'component': () => import('@/pages/users/index.vue'), 'meta': { 'layout': AdminLayout, isAuth: true } },
  {
    'path': '/users',
    children: [
      {
        path: ':id',
        name: 'userFormUpdate',
        component: () => import('@/pages/users/update.vue'),
        'meta': { 'layout': AdminLayout, isAuth: true },
        props: true,
      },
      {
        path: 'create',
        name: 'userFormCreate',
        component: () => import('@/pages/users/create.vue'),
        'meta': { 'layout': AdminLayout, isAuth: true }
      },
    ]
  },
  // { 'path': '/users/:ida', 'name': 'userFormUpdate', 'component': () => import('@/pages/users/form.vue'), 'meta': { 'layout': AdminLayout, isAuth: true } },
  { 'path': '/dashboard', 'name': 'Dashboard', 'component': () => import('@/pages/Dashboard.vue'), 'meta': { 'layout': AdminLayout, isAuth: true } },

]

const router = createRouter({
  history: createWebHistory(),
  base: process.env.BASE_URL,
  routes: [...publicRoutes, ...authRoutes,]
})
router.beforeEach((to, from) => {
  let validToken = store.getters['getAuth']
  if (authRoutes.map(e => e.name).includes(to.name) && !validToken) {
    return { name: 'Login' }
  } else if (validToken && to.name == 'Login') {
    return { name: 'Dashboard' }
  }
})
export default router
