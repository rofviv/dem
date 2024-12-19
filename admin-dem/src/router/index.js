import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '*',
    component: () => import('../views/Error404.vue')
  },
  {
    path: '/admin/login',
    name: 'login',
    component: () => import('../views/Login.vue')
  },
  {
    path: '/admin/dashboard',
    name: 'dashboard',
    component: () => import('../views/Dashboard.vue'),
    meta: {
      // requiresAuth: true
    }
  },
  {
    path: '/admin/users',
    name: 'users',
    component: () => import('../views/Users.vue'),
    meta: {
      // requiresAuth: true
    }
  },
  {
    path: '/admin/mapview',
    name: 'mapview',
    component: () => import('../views/MapView.vue'),
    meta: {
      // requiresAuth: true
    }
  },
  {
    path: '/admin/Emergency',
    name: 'emergency',
    component: () => import('../views/Emergency.vue'),
    meta: {
      // requiresAuth: true
    }
  },
  {
    path: '/admin/callcenter',
    name: 'callcenter',
    component: () => import('../views/CallCenter.vue'),
    meta: {
      // requiresAuth: true
    }
  },
  {
    path: '/admin/report',
    name: 'report',
    component: () => import('../views/Report.vue'),
    meta: {
      // requiresAuth: true
    }
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
