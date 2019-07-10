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

class GetCalSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.calType = null;
    }
    else {
      if (initObj.hasOwnProperty('calType')) {
        this.calType = initObj.calType
      }
      else {
        this.calType = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetCalSrvRequest
    // Serialize message field [calType]
    bufferOffset = _serializer.int32(obj.calType, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetCalSrvRequest
    let len;
    let data = new GetCalSrvRequest(null);
    // Deserialize message field [calType]
    data.calType = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'servo_pkg/GetCalSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0953077ff1a4d9967dfe51a38a0e6839';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 calType
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetCalSrvRequest(null);
    if (msg.calType !== undefined) {
      resolved.calType = msg.calType;
    }
    else {
      resolved.calType = 0
    }

    return resolved;
    }
};

class GetCalSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.max = null;
      this.mid = null;
      this.min = null;
      this.polarity = null;
      this.error = null;
    }
    else {
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
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetCalSrvResponse
    // Serialize message field [max]
    bufferOffset = _serializer.int32(obj.max, buffer, bufferOffset);
    // Serialize message field [mid]
    bufferOffset = _serializer.int32(obj.mid, buffer, bufferOffset);
    // Serialize message field [min]
    bufferOffset = _serializer.int32(obj.min, buffer, bufferOffset);
    // Serialize message field [polarity]
    bufferOffset = _serializer.int32(obj.polarity, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.int32(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetCalSrvResponse
    let len;
    let data = new GetCalSrvResponse(null);
    // Deserialize message field [max]
    data.max = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [mid]
    data.mid = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [min]
    data.min = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [polarity]
    data.polarity = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [error]
    data.error = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'servo_pkg/GetCalSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f4e021b96e068be0c651932663e87871';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 max
    int32 mid
    int32 min
    int32 polarity
    int32 error
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetCalSrvResponse(null);
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
  Request: GetCalSrvRequest,
  Response: GetCalSrvResponse,
  md5sum() { return '6b1cfc4aeba5f476d0600a3aa0cb37e2'; },
  datatype() { return 'servo_pkg/GetCalSrv'; }
};
