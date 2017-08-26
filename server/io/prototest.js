//Test protobuf transmission

const protoPort = 1102;
const IP = '192.168.50.103';

const net = require('net');

const protopath = process.cwd() + '/protobufs/pm_proto.proto';
const protobuf = require("protobufjs");

protobuf.load(protopath, function(err, root){
  if(err){
    throw err;
  }

  let pmproto = root.lookupType("pmproto");
  let payload = { type: 2 };
  let errMsg = pmproto.verify(payload);
  if(errMsg){
    throw errMsg;
  }
  let message = pmproto.create(payload);
  let msg = pmproto.encode(message).finish();

  console.log(msg);



  let sock = net.createConnection({
    port: protoPort,
    host: IP,
    localAddress: '192.168.50.248'
  });

  sock.on('data', function(data){
    console.log(data);
  });

  sock.write(msg, function(err){
    if(err){
      console.log(err);
    }
  })
});
