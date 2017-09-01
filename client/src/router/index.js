import Vue from 'vue'
import Router from 'vue-router'
import Patch from '@/components/Patch'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Patch',
      component: Patch
    }
  ]
})
