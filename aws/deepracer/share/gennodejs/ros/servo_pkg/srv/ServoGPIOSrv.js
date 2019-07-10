// Auto-generated. Do not edit!

// (in-package servo_pkg.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ServoGPIOSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.enable = null;
    }
    else {
      if (initObj.hasOwnProperty('enable')) {
        this.enable = initObj.enable
      }
      else {
        this.enable = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ServoGPIOSrvRequest
    // Serialize message field [enable]
    bufferOffset = _serializer.int32(obj.enable, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ServoGPIOSrvRequest
    let len;
    let data = new ServoGPIOSrvRequest(null);
    // Deserialize message field [enable]
    data.enable = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'servo_pkg/ServoGPIOSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a7d7302aaa1be3c7095acb91a001edf8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 enable
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ServoGPIOSrvRequest(null);
    if (msg.enable !== undefined) {
      resolved.enable = msg.enable;
    }
    else {
      resolved.enable = 0
    }

    return resolved;
    }
};

class ServoGPIOSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.error = null;
    }
    else {
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ServoGPIOSrvResponse
    // Serialize message field [error]
    bufferOffset = _serializer.int32(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ServoGPIOSrvResponse
    let len;
    let data = new ServoGPIOSrvResponse(null);
    // Deserialize message field [error]
    data.error = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'servo_pkg/ServoGPIOSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd9e7447d5716e291370d8c7c21840938';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 error
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ServoGPIOSrvResponse(null);
    if (msg.error !== undefined) {
      resolved.error = msg.error;
    }
    else {
      resolved.error = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: ServoGPIOSrvRequest,
  Response: ServoGPIOSrvResponse,
  md5sum() { return '40b334e92c50632c64188546bf265721'; },
  datatype() { return 'servo_pkg/ServoGPIOSrv'; }
};
