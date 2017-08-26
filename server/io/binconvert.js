//Test protobuf transmission

const protoPort = 1102;
const IP = '192.168.1.136';

const net = require('net');
const fs = require('fs');

const protopath = process.cwd() + '/protobufs/patch.proto';
const protobuf = require("protobufjs");

let patch = fs.readFileSync('./examples/patch.bin');

protobuf.load(protopath, function(err, root){
  if(err){
    throw err;
  }

  let message = {};

  let patch_proto = root.lookupType("fixture");
  try {
    message = patch_proto.decodeDelimited(patch);
  } catch (e) {
    if (e instanceof protobuf.util.ProtocolError) {
      console.log('Protocol Error...')
    } else {
      console.log('Wire Type Error...')
    }
    console.log(e);
  }

  console.log(JSON.stringify(message, null, 2));
});
