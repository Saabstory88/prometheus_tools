const dgram = require('dgram');
const udp = dgram.createSocket('udp4');

const discPort = 1557

udp.on('message', function(msg, rinfo){
  console.log(msg.toString());
  console.log(rinfo);
});

udp.bind(discPort, '192.168.1.139', function(){
  udp.setBroadcast(true);
  console.log('Prometheus Finder: Listening...');
  let buf = new Buffer('ping');
  udp.send(buf, discPort, '192.168.1.255', function(err){
    if(err){
      console.log(err);
    } else {
      console.log('Sent...')
    }
  })
});
