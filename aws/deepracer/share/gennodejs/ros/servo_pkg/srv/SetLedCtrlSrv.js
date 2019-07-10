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

class SetLedCtrlSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.red = null;
      this.green = null;
      this.blue = null;
    }
    else {
      if (initObj.hasOwnProperty('red')) {
        this.red = initObj.red
      }
      else {
        this.red = 0;
      }
      if (initObj.hasOwnProperty('green')) {
        this.green = initObj.green
      }
      else {
        this.green = 0;
      }
      if (initObj.hasOwnProperty('blue')) {
        this.blue = initObj.blue
      }
      else {
        this.blue = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetLedCtrlSrvRequest
    // Serialize message field [red]
    bufferOffset = _serializer.int32(obj.red, buffer, bufferOffset);
    // Serialize message field [green]
    bufferOffset = _serializer.int32(obj.green, buffer, bufferOffset);
    // Serialize message field [blue]
    bufferOffset = _serializer.int32(obj.blue, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetLedCtrlSrvRequest
    let len;
    let data = new SetLedCtrlSrvRequest(null);
    // Deserialize message field [red]
    data.red = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [green]
    data.green = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [blue]
    data.blue = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'servo_pkg/SetLedCtrlSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c68492118bb6d7180f53625820775c5d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 red
    int32 green
    int32 blue
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetLedCtrlSrvRequest(null);
    if (msg.red !== undefined) {
      resolved.red = msg.red;
    }
    else {
      resolved.red = 0
    }

    if (msg.green !== undefined) {
      resolved.green = msg.green;
    }
    else {
      resolved.green = 0
    }

    if (msg.blue !== undefined) {
      resolved.blue = msg.blue;
    }
    else {
      resolved.blue = 0
    }

    return resolved;
    }
};

class SetLedCtrlSrvResponse {
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
    // Serializes a message object of type SetLedCtrlSrvResponse
    // Serialize message field [error]
    bufferOffset = _serializer.int32(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetLedCtrlSrvResponse
    let len;
    let data = new SetLedCtrlSrvResponse(null);
    // Deserialize message field [error]
    data.error = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'servo_pkg/SetLedCtrlSrvResponse';
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
    const resolved = new SetLedCtrlSrvResponse(null);
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
  Request: SetLedCtrlSrvRequest,
  Response: SetLedCtrlSrvResponse,
  md5sum() { return 'a490b8b3cfdfafc7016c7a71f0a934af'; },
  datatype() { return 'servo_pkg/SetLedCtrlSrv'; }
};
