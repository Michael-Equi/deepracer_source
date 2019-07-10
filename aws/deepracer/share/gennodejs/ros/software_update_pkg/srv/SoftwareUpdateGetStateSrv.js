// Auto-generated. Do not edit!

// (in-package software_update_pkg.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SoftwareUpdateGetStateSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.forceUpdateCheck = null;
    }
    else {
      if (initObj.hasOwnProperty('forceUpdateCheck')) {
        this.forceUpdateCheck = initObj.forceUpdateCheck
      }
      else {
        this.forceUpdateCheck = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SoftwareUpdateGetStateSrvRequest
    // Serialize message field [forceUpdateCheck]
    bufferOffset = _serializer.int32(obj.forceUpdateCheck, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SoftwareUpdateGetStateSrvRequest
    let len;
    let data = new SoftwareUpdateGetStateSrvRequest(null);
    // Deserialize message field [forceUpdateCheck]
    data.forceUpdateCheck = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/SoftwareUpdateGetStateSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '793dcc7e7c90759251abec90a40e3e89';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 forceUpdateCheck
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SoftwareUpdateGetStateSrvRequest(null);
    if (msg.forceUpdateCheck !== undefined) {
      resolved.forceUpdateCheck = msg.forceUpdateCheck;
    }
    else {
      resolved.forceUpdateCheck = 0
    }

    return resolved;
    }
};

class SoftwareUpdateGetStateSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.softwareUpdateState = null;
    }
    else {
      if (initObj.hasOwnProperty('softwareUpdateState')) {
        this.softwareUpdateState = initObj.softwareUpdateState
      }
      else {
        this.softwareUpdateState = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SoftwareUpdateGetStateSrvResponse
    // Serialize message field [softwareUpdateState]
    bufferOffset = _serializer.int32(obj.softwareUpdateState, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SoftwareUpdateGetStateSrvResponse
    let len;
    let data = new SoftwareUpdateGetStateSrvResponse(null);
    // Deserialize message field [softwareUpdateState]
    data.softwareUpdateState = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/SoftwareUpdateGetStateSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b729ee7cc97d7a31ceb375c277eb5124';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 softwareUpdateState
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SoftwareUpdateGetStateSrvResponse(null);
    if (msg.softwareUpdateState !== undefined) {
      resolved.softwareUpdateState = msg.softwareUpdateState;
    }
    else {
      resolved.softwareUpdateState = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: SoftwareUpdateGetStateSrvRequest,
  Response: SoftwareUpdateGetStateSrvResponse,
  md5sum() { return '38ceedc74510c56025a61b74f60c273e'; },
  datatype() { return 'software_update_pkg/SoftwareUpdateGetStateSrv'; }
};
