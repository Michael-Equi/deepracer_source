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

class VerifyModelReadySrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.modelName = null;
    }
    else {
      if (initObj.hasOwnProperty('modelName')) {
        this.modelName = initObj.modelName
      }
      else {
        this.modelName = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VerifyModelReadySrvRequest
    // Serialize message field [modelName]
    bufferOffset = _serializer.string(obj.modelName, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VerifyModelReadySrvRequest
    let len;
    let data = new VerifyModelReadySrvRequest(null);
    // Deserialize message field [modelName]
    data.modelName = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.modelName.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/VerifyModelReadySrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3c06c022573b0aeae889b8dfdb49aed1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string modelName
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VerifyModelReadySrvRequest(null);
    if (msg.modelName !== undefined) {
      resolved.modelName = msg.modelName;
    }
    else {
      resolved.modelName = ''
    }

    return resolved;
    }
};

class VerifyModelReadySrvResponse {
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
        this.response_status = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VerifyModelReadySrvResponse
    // Serialize message field [response_status]
    bufferOffset = _serializer.bool(obj.response_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VerifyModelReadySrvResponse
    let len;
    let data = new VerifyModelReadySrvResponse(null);
    // Deserialize message field [response_status]
    data.response_status = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/VerifyModelReadySrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '13bf419397b3ecd4fcf3d84264fa31e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool response_status
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VerifyModelReadySrvResponse(null);
    if (msg.response_status !== undefined) {
      resolved.response_status = msg.response_status;
    }
    else {
      resolved.response_status = false
    }

    return resolved;
    }
};

module.exports = {
  Request: VerifyModelReadySrvRequest,
  Response: VerifyModelReadySrvResponse,
  md5sum() { return '8f8f9b97fa5ac9c24924e52aea4bca80'; },
  datatype() { return 'software_update_pkg/VerifyModelReadySrv'; }
};
