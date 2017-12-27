const fs = require('fs');

const len = {
  bank: 12,
  church: 8,
  laundry: 8,
  katmandu: 7
}

const color = {
  intensity: 65535,
  red: 255,
  green: 255,
  blue: 255,
  white: 255
}

function makeStack(len){

  let fixtures = [];

  for(let i = 0; i < len; i++){
    fixtures.push({
      fixture_id: (i + 1),
      fade: 1000,
      color: color
    })
  }

  let stack = {
    version: 1,
    cuestacks: [
      {
        cuestack_id: 1,
        label: "White",
        tweet: "None",
        loop: true,
        cuesteps: [
          {
            wait: 5000,
            fixtures: fixtures
          }
        ]
      }
    ]
  }

  return stack;
}

fs.writeFileSync("wh_bank.json", JSON.stringify(makeStack(len.bank), null, 2));
fs.writeFileSync("wh_church.json", JSON.stringify(makeStack(len.church), null, 2));
fs.writeFileSync("wh_laundry.json", JSON.stringify(makeStack(len.laundry), null, 2));
fs.writeFileSync("wh_katmandu.json", JSON.stringify(makeStack(len.katmandu), null, 2));
