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

class SoftwareUpdateStatusSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.request = null;
    }
    else {
      if (initObj.hasOwnProperty('request')) {
        this.request = initObj.request
      }
      else {
        this.request = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SoftwareUpdateStatusSrvRequest
    // Serialize message field [request]
    bufferOffset = _serializer.int32(obj.request, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SoftwareUpdateStatusSrvRequest
    let len;
    let data = new SoftwareUpdateStatusSrvRequest(null);
    // Deserialize message field [request]
    data.request = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/SoftwareUpdateStatusSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '650f0ccd41c8f8d53ada80be6ddde434';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 request
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SoftwareUpdateStatusSrvRequest(null);
    if (msg.request !== undefined) {
      resolved.request = msg.request;
    }
    else {
      resolved.request = 0
    }

    return resolved;
    }
};

class SoftwareUpdateStatusSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.status = null;
      this.update_pct = null;
    }
    else {
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = '';
      }
      if (initObj.hasOwnProperty('update_pct')) {
        this.update_pct = initObj.update_pct
      }
      else {
        this.update_pct = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SoftwareUpdateStatusSrvResponse
    // Serialize message field [status]
    bufferOffset = _serializer.string(obj.status, buffer, bufferOffset);
    // Serialize message field [update_pct]
    bufferOffset = _serializer.float32(obj.update_pct, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SoftwareUpdateStatusSrvResponse
    let len;
    let data = new SoftwareUpdateStatusSrvResponse(null);
    // Deserialize message field [status]
    data.status = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [update_pct]
    data.update_pct = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.status.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/SoftwareUpdateStatusSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8cdeeeeeb578c6d87b3e8a3c4e176be3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string status
    float32 update_pct
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SoftwareUpdateStatusSrvResponse(null);
    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = ''
    }

    if (msg.update_pct !== undefined) {
      resolved.update_pct = msg.update_pct;
    }
    else {
      resolved.update_pct = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: SoftwareUpdateStatusSrvRequest,
  Response: SoftwareUpdateStatusSrvResponse,
  md5sum() { return '16a53cec453a3486977f4ea29e18c7f4'; },
  datatype() { return 'software_update_pkg/SoftwareUpdateStatusSrv'; }
};
