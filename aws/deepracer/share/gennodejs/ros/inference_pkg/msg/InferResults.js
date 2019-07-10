// Auto-generated. Do not edit!

// (in-package inference_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class InferResults {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.classLabel = null;
      this.classProb = null;
      this.xMin = null;
      this.yMin = null;
      this.xMax = null;
      this.yMax = null;
    }
    else {
      if (initObj.hasOwnProperty('classLabel')) {
        this.classLabel = initObj.classLabel
      }
      else {
        this.classLabel = 0;
      }
      if (initObj.hasOwnProperty('classProb')) {
        this.classProb = initObj.classProb
      }
      else {
        this.classProb = 0.0;
      }
      if (initObj.hasOwnProperty('xMin')) {
        this.xMin = initObj.xMin
      }
      else {
        this.xMin = 0.0;
      }
      if (initObj.hasOwnProperty('yMin')) {
        this.yMin = initObj.yMin
      }
      else {
        this.yMin = 0.0;
      }
      if (initObj.hasOwnProperty('xMax')) {
        this.xMax = initObj.xMax
      }
      else {
        this.xMax = 0.0;
      }
      if (initObj.hasOwnProperty('yMax')) {
        this.yMax = initObj.yMax
      }
      else {
        this.yMax = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type InferResults
    // Serialize message field [classLabel]
    bufferOffset = _serializer.int32(obj.classLabel, buffer, bufferOffset);
    // Serialize message field [classProb]
    bufferOffset = _serializer.float32(obj.classProb, buffer, bufferOffset);
    // Serialize message field [xMin]
    bufferOffset = _serializer.float32(obj.xMin, buffer, bufferOffset);
    // Serialize message field [yMin]
    bufferOffset = _serializer.float32(obj.yMin, buffer, bufferOffset);
    // Serialize message field [xMax]
    bufferOffset = _serializer.float32(obj.xMax, buffer, bufferOffset);
    // Serialize message field [yMax]
    bufferOffset = _serializer.float32(obj.yMax, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InferResults
    let len;
    let data = new InferResults(null);
    // Deserialize message field [classLabel]
    data.classLabel = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [classProb]
    data.classProb = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [xMin]
    data.xMin = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yMin]
    data.yMin = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [xMax]
    data.xMax = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yMax]
    data.yMax = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'inference_pkg/InferResults';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1135a834c1577618b60cb2ddd0fff748';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 classLabel
    float32 classProb
    float32 xMin
    float32 yMin
    float32 xMax
    float32 yMax
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new InferResults(null);
    if (msg.classLabel !== undefined) {
      resolved.classLabel = msg.classLabel;
    }
    else {
      resolved.classLabel = 0
    }

    if (msg.classProb !== undefined) {
      resolved.classProb = msg.classProb;
    }
    else {
      resolved.classProb = 0.0
    }

    if (msg.xMin !== undefined) {
      resolved.xMin = msg.xMin;
    }
    else {
      resolved.xMin = 0.0
    }

    if (msg.yMin !== undefined) {
      resolved.yMin = msg.yMin;
    }
    else {
      resolved.yMin = 0.0
    }

    if (msg.xMax !== undefined) {
      resolved.xMax = msg.xMax;
    }
    else {
      resolved.xMax = 0.0
    }

    if (msg.yMax !== undefined) {
      resolved.yMax = msg.yMax;
    }
    else {
      resolved.yMax = 0.0
    }

    return resolved;
    }
};

module.exports = InferResults;
