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

class ConsoleUploadModelSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.modelPath = null;
      this.upload = null;
    }
    else {
      if (initObj.hasOwnProperty('modelPath')) {
        this.modelPath = initObj.modelPath
      }
      else {
        this.modelPath = '';
      }
      if (initObj.hasOwnProperty('upload')) {
        this.upload = initObj.upload
      }
      else {
        this.upload = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ConsoleUploadModelSrvRequest
    // Serialize message field [modelPath]
    bufferOffset = _serializer.string(obj.modelPath, buffer, bufferOffset);
    // Serialize message field [upload]
    bufferOffset = _serializer.int32(obj.upload, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ConsoleUploadModelSrvRequest
    let len;
    let data = new ConsoleUploadModelSrvRequest(null);
    // Deserialize message field [modelPath]
    data.modelPath = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [upload]
    data.upload = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.modelPath.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/ConsoleUploadModelSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '56bd30b9f9dc544786f5e8d05b4b64ac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string modelPath
    int32  upload
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ConsoleUploadModelSrvRequest(null);
    if (msg.modelPath !== undefined) {
      resolved.modelPath = msg.modelPath;
    }
    else {
      resolved.modelPath = ''
    }

    if (msg.upload !== undefined) {
      resolved.upload = msg.upload;
    }
    else {
      resolved.upload = 0
    }

    return resolved;
    }
};

class ConsoleUploadModelSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ConsoleUploadModelSrvResponse
    // Serialize message field [status]
    bufferOffset = _serializer.string(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ConsoleUploadModelSrvResponse
    let len;
    let data = new ConsoleUploadModelSrvResponse(null);
    // Deserialize message field [status]
    data.status = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.status.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/ConsoleUploadModelSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4fe5af303955c287688e7347e9b00278';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string status
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ConsoleUploadModelSrvResponse(null);
    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: ConsoleUploadModelSrvRequest,
  Response: ConsoleUploadModelSrvResponse,
  md5sum() { return 'c93eb4029ae5d4427bceee7bdbd54e60'; },
  datatype() { return 'software_update_pkg/ConsoleUploadModelSrv'; }
};
