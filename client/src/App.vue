<template>
  <div>
    <navbar></navbar>
    <br>
    <patch></patch>
  </div>
</template>

<script>

import Navbar from '@/components/Navbar'
import Patch from '@/components/Patch'

export default {
  name: 'app',
  components: {
    'navbar': Navbar,
    'patch': Patch
  }
}
</script>

<style>

</style>
