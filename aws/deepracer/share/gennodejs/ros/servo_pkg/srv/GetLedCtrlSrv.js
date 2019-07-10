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

class GetLedCtrlSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetLedCtrlSrvRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetLedCtrlSrvRequest
    let len;
    let data = new GetLedCtrlSrvRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'servo_pkg/GetLedCtrlSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetLedCtrlSrvRequest(null);
    return resolved;
    }
};

class GetLedCtrlSrvResponse {
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
    // Serializes a message object of type GetLedCtrlSrvResponse
    // Serialize message field [red]
    bufferOffset = _serializer.int32(obj.red, buffer, bufferOffset);
    // Serialize message field [green]
    bufferOffset = _serializer.int32(obj.green, buffer, bufferOffset);
    // Serialize message field [blue]
    bufferOffset = _serializer.int32(obj.blue, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetLedCtrlSrvResponse
    let len;
    let data = new GetLedCtrlSrvResponse(null);
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
    return 'servo_pkg/GetLedCtrlSrvResponse';
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
    const resolved = new GetLedCtrlSrvResponse(null);
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

module.exports = {
  Request: GetLedCtrlSrvRequest,
  Response: GetLedCtrlSrvResponse,
  md5sum() { return 'c68492118bb6d7180f53625820775c5d'; },
  datatype() { return 'servo_pkg/GetLedCtrlSrv'; }
};
