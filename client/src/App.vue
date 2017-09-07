<template>
  <div>
    <navbar></navbar>
    <br>
    <patch v-bind:fixtures="fixtures"></patch>
  </div>
</template>

<script>

import Navbar from '@/components/Navbar'
import Patch from './components/Patch.vue'

export default {
  name: 'app',
  data: {
    fixtures: [
      {
        id: 1,
        name: "Fixture 1"
      },{
        id: 2,
        name: "Fixture 1"
      },{
        id: 3,
        name: "Fixture 1"
      }
    ]
  },
  components: {
    Navbar,
    Patch
  }
}
</script>

<style>

</style>
