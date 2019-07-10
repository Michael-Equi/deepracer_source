
"use strict";

let SetLedCtrlSrv = require('./SetLedCtrlSrv.js')
let ServoCalSrv = require('./ServoCalSrv.js')
let CarCtrlSrv = require('./CarCtrlSrv.js')
let GetLedCtrlSrv = require('./GetLedCtrlSrv.js')
let GetCalSrv = require('./GetCalSrv.js')
let ServoGPIOSrv = require('./ServoGPIOSrv.js')

module.exports = {
  SetLedCtrlSrv: SetLedCtrlSrv,
  ServoCalSrv: ServoCalSrv,
  CarCtrlSrv: CarCtrlSrv,
  GetLedCtrlSrv: GetLedCtrlSrv,
  GetCalSrv: GetCalSrv,
  ServoGPIOSrv: ServoGPIOSrv,
};
