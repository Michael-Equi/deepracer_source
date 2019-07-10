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

class OTGLinkStateSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OTGLinkStateSrvRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OTGLinkStateSrvRequest
    let len;
    let data = new OTGLinkStateSrvRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/OTGLinkStateSrvRequest';
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
    const resolved = new OTGLinkStateSrvRequest(null);
    return resolved;
    }
};

class OTGLinkStateSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.link_state = null;
    }
    else {
      if (initObj.hasOwnProperty('link_state')) {
        this.link_state = initObj.link_state
      }
      else {
        this.link_state = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OTGLinkStateSrvResponse
    // Serialize message field [link_state]
    bufferOffset = _serializer.bool(obj.link_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OTGLinkStateSrvResponse
    let len;
    let data = new OTGLinkStateSrvResponse(null);
    // Deserialize message field [link_state]
    data.link_state = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'software_update_pkg/OTGLinkStateSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ce83a82cad932a54230aee1371ab9c07';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool link_state
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OTGLinkStateSrvResponse(null);
    if (msg.link_state !== undefined) {
      resolved.link_state = msg.link_state;
    }
    else {
      resolved.link_state = false
    }

    return resolved;
    }
};

module.exports = {
  Request: OTGLinkStateSrvRequest,
  Response: OTGLinkStateSrvResponse,
  md5sum() { return 'ce83a82cad932a54230aee1371ab9c07'; },
  datatype() { return 'software_update_pkg/OTGLinkStateSrv'; }
};
