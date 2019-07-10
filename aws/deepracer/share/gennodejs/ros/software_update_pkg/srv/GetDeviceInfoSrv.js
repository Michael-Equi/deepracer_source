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

class GetDeviceInfoSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetDeviceInfoSrvRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetDeviceInfoSrvRequest
    let len;
    let data = new GetDeviceInfoSrvRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/GetDeviceInfoSrvRequest';
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
    const resolved = new GetDeviceInfoSrvRequest(null);
    return resolved;
    }
};

class GetDeviceInfoSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.hardware_version = null;
      this.software_version = null;
    }
    else {
      if (initObj.hasOwnProperty('hardware_version')) {
        this.hardware_version = initObj.hardware_version
      }
      else {
        this.hardware_version = '';
      }
      if (initObj.hasOwnProperty('software_version')) {
        this.software_version = initObj.software_version
      }
      else {
        this.software_version = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetDeviceInfoSrvResponse
    // Serialize message field [hardware_version]
    bufferOffset = _serializer.string(obj.hardware_version, buffer, bufferOffset);
    // Serialize message field [software_version]
    bufferOffset = _serializer.string(obj.software_version, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetDeviceInfoSrvResponse
    let len;
    let data = new GetDeviceInfoSrvResponse(null);
    // Deserialize message field [hardware_version]
    data.hardware_version = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [software_version]
    data.software_version = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.hardware_version.length;
    length += object.software_version.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/GetDeviceInfoSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '20e5c824a7eab55a41bcdd6797da20c5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string hardware_version
    string software_version
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetDeviceInfoSrvResponse(null);
    if (msg.hardware_version !== undefined) {
      resolved.hardware_version = msg.hardware_version;
    }
    else {
      resolved.hardware_version = ''
    }

    if (msg.software_version !== undefined) {
      resolved.software_version = msg.software_version;
    }
    else {
      resolved.software_version = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: GetDeviceInfoSrvRequest,
  Response: GetDeviceInfoSrvResponse,
  md5sum() { return '20e5c824a7eab55a41bcdd6797da20c5'; },
  datatype() { return 'software_update_pkg/GetDeviceInfoSrv'; }
};
