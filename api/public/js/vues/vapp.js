Vue.component('fixture-item', {
  props: ['fixture'],
  template: `<div class="card fixture-card">
    <div class="card-header">
      <h5>{{ fixture.label }}</h5>
    </div>
    <div class="card-body">
      <span class="badge badge-success">ADR: {{ fixture.start_address }}</span>
      <br>
      <ul class="list-group">
        <li
          v-for="item in fixture.channel_map"
          v-bind:key="item"
         class="list-group-item">
          {{ item }}
         </li>
      </ul>
    </div>
  </div>`
});

$.getJSON('/patch', function(data){
  var patch = JSON.parse(data);
  console.log(patch)
  var vm = new Vue({
    el: '#patch',
    data: {
      patch: patch
    }
  });
});
