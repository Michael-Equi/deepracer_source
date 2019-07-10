
"use strict";

let SoftwareUpdateGetStateSrv = require('./SoftwareUpdateGetStateSrv.js')
let GetDeviceInfoSrv = require('./GetDeviceInfoSrv.js')
let ConsoleUploadModelSrv = require('./ConsoleUploadModelSrv.js')
let SoftwareUpdateStatusSrv = require('./SoftwareUpdateStatusSrv.js')
let OTGLinkStateSrv = require('./OTGLinkStateSrv.js')
let BeginSoftwareUpdateSrv = require('./BeginSoftwareUpdateSrv.js')
let VerifyModelReadySrv = require('./VerifyModelReadySrv.js')

module.exports = {
  SoftwareUpdateGetStateSrv: SoftwareUpdateGetStateSrv,
  GetDeviceInfoSrv: GetDeviceInfoSrv,
  ConsoleUploadModelSrv: ConsoleUploadModelSrv,
  SoftwareUpdateStatusSrv: SoftwareUpdateStatusSrv,
  OTGLinkStateSrv: OTGLinkStateSrv,
  BeginSoftwareUpdateSrv: BeginSoftwareUpdateSrv,
  VerifyModelReadySrv: VerifyModelReadySrv,
};
