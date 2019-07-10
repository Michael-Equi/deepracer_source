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

class ServoCalSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.calType = null;
      this.max = null;
      this.mid = null;
      this.min = null;
      this.polarity = null;
    }
    else {
      if (initObj.hasOwnProperty('calType')) {
        this.calType = initObj.calType
      }
      else {
        this.calType = 0;
      }
      if (initObj.hasOwnProperty('max')) {
        this.max = initObj.max
      }
      else {
        this.max = 0;
      }
      if (initObj.hasOwnProperty('mid')) {
        this.mid = initObj.mid
      }
      else {
        this.mid = 0;
      }
      if (initObj.hasOwnProperty('min')) {
        this.min = initObj.min
      }
      else {
        this.min = 0;
      }
      if (initObj.hasOwnProperty('polarity')) {
        this.polarity = initObj.polarity
      }
      else {
        this.polarity = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ServoCalSrvRequest
    // Serialize message field [calType]
    bufferOffset = _serializer.int32(obj.calType, buffer, bufferOffset);
    // Serialize message field [max]
    bufferOffset = _serializer.int32(obj.max, buffer, bufferOffset);
    // Serialize message field [mid]
    bufferOffset = _serializer.int32(obj.mid, buffer, bufferOffset);
    // Serialize message field [min]
    bufferOffset = _serializer.int32(obj.min, buffer, bufferOffset);
    // Serialize message field [polarity]
    bufferOffset = _serializer.int32(obj.polarity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ServoCalSrvRequest
    let len;
    let data = new ServoCalSrvRequest(null);
    // Deserialize message field [calType]
    data.calType = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [max]
    data.max = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [mid]
    data.mid = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [min]
    data.min = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [polarity]
    data.polarity = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'servo_pkg/ServoCalSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4d3d2def2f1f5300e3d0a3b79cb1580f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 calType
    int32 max
    int32 mid
    int32 min
    int32 polarity
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ServoCalSrvRequest(null);
    if (msg.calType !== undefined) {
      resolved.calType = msg.calType;
    }
    else {
      resolved.calType = 0
    }

    if (msg.max !== undefined) {
      resolved.max = msg.max;
    }
    else {
      resolved.max = 0
    }

    if (msg.mid !== undefined) {
      resolved.mid = msg.mid;
    }
    else {
      resolved.mid = 0
    }

    if (msg.min !== undefined) {
      resolved.min = msg.min;
    }
    else {
      resolved.min = 0
    }

    if (msg.polarity !== undefined) {
      resolved.polarity = msg.polarity;
    }
    else {
      resolved.polarity = 0
    }

    return resolved;
    }
};

class ServoCalSrvResponse {
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
    // Serializes a message object of type ServoCalSrvResponse
    // Serialize message field [error]
    bufferOffset = _serializer.int32(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ServoCalSrvResponse
    let len;
    let data = new ServoCalSrvResponse(null);
    // Deserialize message field [error]
    data.error = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'servo_pkg/ServoCalSrvResponse';
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
    const resolved = new ServoCalSrvResponse(null);
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
  Request: ServoCalSrvRequest,
  Response: ServoCalSrvResponse,
  md5sum() { return '8c3ae23f62ed4c96e0ddbc457a5bafb6'; },
  datatype() { return 'servo_pkg/ServoCalSrv'; }
};
