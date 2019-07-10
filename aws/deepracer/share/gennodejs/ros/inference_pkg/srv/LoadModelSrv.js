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

class LoadModelSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.artifactPath = null;
      this.taskType = null;
      this.preProcessType = null;
    }
    else {
      if (initObj.hasOwnProperty('artifactPath')) {
        this.artifactPath = initObj.artifactPath
      }
      else {
        this.artifactPath = '';
      }
      if (initObj.hasOwnProperty('taskType')) {
        this.taskType = initObj.taskType
      }
      else {
        this.taskType = 0;
      }
      if (initObj.hasOwnProperty('preProcessType')) {
        this.preProcessType = initObj.preProcessType
      }
      else {
        this.preProcessType = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LoadModelSrvRequest
    // Serialize message field [artifactPath]
    bufferOffset = _serializer.string(obj.artifactPath, buffer, bufferOffset);
    // Serialize message field [taskType]
    bufferOffset = _serializer.int8(obj.taskType, buffer, bufferOffset);
    // Serialize message field [preProcessType]
    bufferOffset = _serializer.int8(obj.preProcessType, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoadModelSrvRequest
    let len;
    let data = new LoadModelSrvRequest(null);
    // Deserialize message field [artifactPath]
    data.artifactPath = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [taskType]
    data.taskType = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [preProcessType]
    data.preProcessType = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.artifactPath.length;
    return length + 6;
  }

  static datatype() {
    // Returns string type for a service object
    return 'inference_pkg/LoadModelSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2cefb6760143db888f1dbb3cfad7b34c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string artifactPath
    int8 taskType
    int8 preProcessType
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LoadModelSrvRequest(null);
    if (msg.artifactPath !== undefined) {
      resolved.artifactPath = msg.artifactPath;
    }
    else {
      resolved.artifactPath = ''
    }

    if (msg.taskType !== undefined) {
      resolved.taskType = msg.taskType;
    }
    else {
      resolved.taskType = 0
    }

    if (msg.preProcessType !== undefined) {
      resolved.preProcessType = msg.preProcessType;
    }
    else {
      resolved.preProcessType = 0
    }

    return resolved;
    }
};

class LoadModelSrvResponse {
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
    // Serializes a message object of type LoadModelSrvResponse
    // Serialize message field [error]
    bufferOffset = _serializer.int32(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoadModelSrvResponse
    let len;
    let data = new LoadModelSrvResponse(null);
    // Deserialize message field [error]
    data.error = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'inference_pkg/LoadModelSrvResponse';
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
    const resolved = new LoadModelSrvResponse(null);
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
  Request: LoadModelSrvRequest,
  Response: LoadModelSrvResponse,
  md5sum() { return '2198cf91d52845545921e65722dce857'; },
  datatype() { return 'inference_pkg/LoadModelSrv'; }
};
