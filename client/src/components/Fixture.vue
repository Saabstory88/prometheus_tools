<template>
  <li>{{ fxItem.name }}</li>
</template>

<script>
export default {
  name: 'fixture',
  props: ["fxItem"],
  inherit: true
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
