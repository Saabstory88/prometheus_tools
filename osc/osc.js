const dgram = require('dgram');
const udp = dgram.createSocket('udp4');
const osc = require('osc-min');



udp.on('message', function(msg){
  console.log(msg);
})

let msg = osc.toBuffer({
  address: "/set/loadandgo",
  args: [1, 1]
});

udp.bind(9000, '192.168.1.125');


function test(){
  udp.setBroadcast(true);
  
  udp.send(msg, 9000, "192.168.1.255", function(err){
    if(err) { console.log(err) };
  });
}

setTimeout(test, 1000);
