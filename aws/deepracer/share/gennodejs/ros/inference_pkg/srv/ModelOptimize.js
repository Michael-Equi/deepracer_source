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

class ModelOptimizeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.model_name = null;
      this.img_format = null;
      this.width = null;
      this.height = null;
      this.num_channels = null;
      this.platform = null;
    }
    else {
      if (initObj.hasOwnProperty('model_name')) {
        this.model_name = initObj.model_name
      }
      else {
        this.model_name = '';
      }
      if (initObj.hasOwnProperty('img_format')) {
        this.img_format = initObj.img_format
      }
      else {
        this.img_format = '';
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0;
      }
      if (initObj.hasOwnProperty('num_channels')) {
        this.num_channels = initObj.num_channels
      }
      else {
        this.num_channels = 0;
      }
      if (initObj.hasOwnProperty('platform')) {
        this.platform = initObj.platform
      }
      else {
        this.platform = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ModelOptimizeRequest
    // Serialize message field [model_name]
    bufferOffset = _serializer.string(obj.model_name, buffer, bufferOffset);
    // Serialize message field [img_format]
    bufferOffset = _serializer.string(obj.img_format, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.int32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.int32(obj.height, buffer, bufferOffset);
    // Serialize message field [num_channels]
    bufferOffset = _serializer.int32(obj.num_channels, buffer, bufferOffset);
    // Serialize message field [platform]
    bufferOffset = _serializer.int32(obj.platform, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ModelOptimizeRequest
    let len;
    let data = new ModelOptimizeRequest(null);
    // Deserialize message field [model_name]
    data.model_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [img_format]
    data.img_format = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [num_channels]
    data.num_channels = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [platform]
    data.platform = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.model_name.length;
    length += object.img_format.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'inference_pkg/ModelOptimizeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9cd0bf66689e521db74ed931ae8b0f5a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string model_name
    string img_format
    int32 width
    int32 height
    int32 num_channels
    int32 platform
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ModelOptimizeRequest(null);
    if (msg.model_name !== undefined) {
      resolved.model_name = msg.model_name;
    }
    else {
      resolved.model_name = ''
    }

    if (msg.img_format !== undefined) {
      resolved.img_format = msg.img_format;
    }
    else {
      resolved.img_format = ''
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0
    }

    if (msg.num_channels !== undefined) {
      resolved.num_channels = msg.num_channels;
    }
    else {
      resolved.num_channels = 0
    }

    if (msg.platform !== undefined) {
      resolved.platform = msg.platform;
    }
    else {
      resolved.platform = 0
    }

    return resolved;
    }
};

class ModelOptimizeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.artifactPath = null;
      this.hasError = null;
    }
    else {
      if (initObj.hasOwnProperty('artifactPath')) {
        this.artifactPath = initObj.artifactPath
      }
      else {
        this.artifactPath = '';
      }
      if (initObj.hasOwnProperty('hasError')) {
        this.hasError = initObj.hasError
      }
      else {
        this.hasError = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ModelOptimizeResponse
    // Serialize message field [artifactPath]
    bufferOffset = _serializer.string(obj.artifactPath, buffer, bufferOffset);
    // Serialize message field [hasError]
    bufferOffset = _serializer.int32(obj.hasError, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ModelOptimizeResponse
    let len;
    let data = new ModelOptimizeResponse(null);
    // Deserialize message field [artifactPath]
    data.artifactPath = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [hasError]
    data.hasError = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.artifactPath.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'inference_pkg/ModelOptimizeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0a0e581938c544a1c907ad58e7948581';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string artifactPath
    int32 hasError
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ModelOptimizeResponse(null);
    if (msg.artifactPath !== undefined) {
      resolved.artifactPath = msg.artifactPath;
    }
    else {
      resolved.artifactPath = ''
    }

    if (msg.hasError !== undefined) {
      resolved.hasError = msg.hasError;
    }
    else {
      resolved.hasError = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: ModelOptimizeRequest,
  Response: ModelOptimizeResponse,
  md5sum() { return '8be2292cb24bff10bcc1a8b3e969b144'; },
  datatype() { return 'inference_pkg/ModelOptimize'; }
};
