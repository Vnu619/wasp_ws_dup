// Auto-generated. Do not edit!

// (in-package wasp_joy.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class wall {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.init = null;
      this.move = null;
    }
    else {
      if (initObj.hasOwnProperty('init')) {
        this.init = initObj.init
      }
      else {
        this.init = 0.0;
      }
      if (initObj.hasOwnProperty('move')) {
        this.move = initObj.move
      }
      else {
        this.move = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type wall
    // Serialize message field [init]
    bufferOffset = _serializer.float64(obj.init, buffer, bufferOffset);
    // Serialize message field [move]
    bufferOffset = _serializer.float64(obj.move, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type wall
    let len;
    let data = new wall(null);
    // Deserialize message field [init]
    data.init = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [move]
    data.move = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'wasp_joy/wall';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c4d4a2a8340d6604dab35f7221e2246d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 init
    float64 move
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new wall(null);
    if (msg.init !== undefined) {
      resolved.init = msg.init;
    }
    else {
      resolved.init = 0.0
    }

    if (msg.move !== undefined) {
      resolved.move = msg.move;
    }
    else {
      resolved.move = 0.0
    }

    return resolved;
    }
};

module.exports = wall;
