// Auto-generated. Do not edit!

// (in-package media_pkg.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class VideoStateSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.activateVideo = null;
    }
    else {
      if (initObj.hasOwnProperty('activateVideo')) {
        this.activateVideo = initObj.activateVideo
      }
      else {
        this.activateVideo = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VideoStateSrvRequest
    // Serialize message field [activateVideo]
    bufferOffset = _serializer.int8(obj.activateVideo, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VideoStateSrvRequest
    let len;
    let data = new VideoStateSrvRequest(null);
    // Deserialize message field [activateVideo]
    data.activateVideo = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'media_pkg/VideoStateSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ec7b37bd7e77659bf0c17f46d1a05b12';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 activateVideo
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VideoStateSrvRequest(null);
    if (msg.activateVideo !== undefined) {
      resolved.activateVideo = msg.activateVideo;
    }
    else {
      resolved.activateVideo = 0
    }

    return resolved;
    }
};

class VideoStateSrvResponse {
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
    // Serializes a message object of type VideoStateSrvResponse
    // Serialize message field [error]
    bufferOffset = _serializer.int32(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VideoStateSrvResponse
    let len;
    let data = new VideoStateSrvResponse(null);
    // Deserialize message field [error]
    data.error = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'media_pkg/VideoStateSrvResponse';
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
    const resolved = new VideoStateSrvResponse(null);
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
  Request: VideoStateSrvRequest,
  Response: VideoStateSrvResponse,
  md5sum() { return '4416021135ac788256017c226f5dd174'; },
  datatype() { return 'media_pkg/VideoStateSrv'; }
};
