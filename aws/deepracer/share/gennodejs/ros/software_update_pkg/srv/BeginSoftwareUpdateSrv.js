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

class BeginSoftwareUpdateSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.is_reboot = null;
    }
    else {
      if (initObj.hasOwnProperty('is_reboot')) {
        this.is_reboot = initObj.is_reboot
      }
      else {
        this.is_reboot = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BeginSoftwareUpdateSrvRequest
    // Serialize message field [is_reboot]
    bufferOffset = _serializer.int32(obj.is_reboot, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BeginSoftwareUpdateSrvRequest
    let len;
    let data = new BeginSoftwareUpdateSrvRequest(null);
    // Deserialize message field [is_reboot]
    data.is_reboot = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/BeginSoftwareUpdateSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b774560357a6945efcc4af6311004d72';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 is_reboot
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BeginSoftwareUpdateSrvRequest(null);
    if (msg.is_reboot !== undefined) {
      resolved.is_reboot = msg.is_reboot;
    }
    else {
      resolved.is_reboot = 0
    }

    return resolved;
    }
};

class BeginSoftwareUpdateSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.response_status = null;
    }
    else {
      if (initObj.hasOwnProperty('response_status')) {
        this.response_status = initObj.response_status
      }
      else {
        this.response_status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BeginSoftwareUpdateSrvResponse
    // Serialize message field [response_status]
    bufferOffset = _serializer.int32(obj.response_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BeginSoftwareUpdateSrvResponse
    let len;
    let data = new BeginSoftwareUpdateSrvResponse(null);
    // Deserialize message field [response_status]
    data.response_status = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/BeginSoftwareUpdateSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7a6a0fbfad2fb3a7c88b8901b0eec60f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 response_status
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BeginSoftwareUpdateSrvResponse(null);
    if (msg.response_status !== undefined) {
      resolved.response_status = msg.response_status;
    }
    else {
      resolved.response_status = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: BeginSoftwareUpdateSrvRequest,
  Response: BeginSoftwareUpdateSrvResponse,
  md5sum() { return 'ea2599098a45cca9fd2a26d9af6c5b79'; },
  datatype() { return 'software_update_pkg/BeginSoftwareUpdateSrv'; }
};
