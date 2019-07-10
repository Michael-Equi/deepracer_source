// Auto-generated. Do not edit!

// (in-package inference_pkg.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class InferenceStateSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.start = null;
      this.taskType = null;
    }
    else {
      if (initObj.hasOwnProperty('start')) {
        this.start = initObj.start
      }
      else {
        this.start = 0;
      }
      if (initObj.hasOwnProperty('taskType')) {
        this.taskType = initObj.taskType
      }
      else {
        this.taskType = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type InferenceStateSrvRequest
    // Serialize message field [start]
    bufferOffset = _serializer.int8(obj.start, buffer, bufferOffset);
    // Serialize message field [taskType]
    bufferOffset = _serializer.int8(obj.taskType, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InferenceStateSrvRequest
    let len;
    let data = new InferenceStateSrvRequest(null);
    // Deserialize message field [start]
    data.start = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [taskType]
    data.taskType = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'inference_pkg/InferenceStateSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e93371787653751937b5b69a750c077f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 start
    int8 taskType
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new InferenceStateSrvRequest(null);
    if (msg.start !== undefined) {
      resolved.start = msg.start;
    }
    else {
      resolved.start = 0
    }

    if (msg.taskType !== undefined) {
      resolved.taskType = msg.taskType;
    }
    else {
      resolved.taskType = 0
    }

    return resolved;
    }
};

class InferenceStateSrvResponse {
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
    // Serializes a message object of type InferenceStateSrvResponse
    // Serialize message field [error]
    bufferOffset = _serializer.int32(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InferenceStateSrvResponse
    let len;
    let data = new InferenceStateSrvResponse(null);
    // Deserialize message field [error]
    data.error = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'inference_pkg/InferenceStateSrvResponse';
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
    const resolved = new InferenceStateSrvResponse(null);
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
  Request: InferenceStateSrvRequest,
  Response: InferenceStateSrvResponse,
  md5sum() { return 'e1c619b05d3cc42965b2e64132c9d838'; },
  datatype() { return 'inference_pkg/InferenceStateSrv'; }
};
