// Auto-generated. Do not edit!

// (in-package wasp_logistics.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class logistics {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.liftup = null;
      this.liftdown = null;
      this.extrude = null;
      this.intrude = null;
    }
    else {
      if (initObj.hasOwnProperty('liftup')) {
        this.liftup = initObj.liftup
      }
      else {
        this.liftup = 0.0;
      }
      if (initObj.hasOwnProperty('liftdown')) {
        this.liftdown = initObj.liftdown
      }
      else {
        this.liftdown = 0.0;
      }
      if (initObj.hasOwnProperty('extrude')) {
        this.extrude = initObj.extrude
      }
      else {
        this.extrude = 0.0;
      }
      if (initObj.hasOwnProperty('intrude')) {
        this.intrude = initObj.intrude
      }
      else {
        this.intrude = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type logistics
    // Serialize message field [liftup]
    bufferOffset = _serializer.float64(obj.liftup, buffer, bufferOffset);
    // Serialize message field [liftdown]
    bufferOffset = _serializer.float64(obj.liftdown, buffer, bufferOffset);
    // Serialize message field [extrude]
    bufferOffset = _serializer.float64(obj.extrude, buffer, bufferOffset);
    // Serialize message field [intrude]
    bufferOffset = _serializer.float64(obj.intrude, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type logistics
    let len;
    let data = new logistics(null);
    // Deserialize message field [liftup]
    data.liftup = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [liftdown]
    data.liftdown = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [extrude]
    data.extrude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [intrude]
    data.intrude = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'wasp_logistics/logistics';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd042c562a5284d9dab240d01fee79629';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 liftup
    float64 liftdown
    float64 extrude
    float64 intrude
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new logistics(null);
    if (msg.liftup !== undefined) {
      resolved.liftup = msg.liftup;
    }
    else {
      resolved.liftup = 0.0
    }

    if (msg.liftdown !== undefined) {
      resolved.liftdown = msg.liftdown;
    }
    else {
      resolved.liftdown = 0.0
    }

    if (msg.extrude !== undefined) {
      resolved.extrude = msg.extrude;
    }
    else {
      resolved.extrude = 0.0
    }

    if (msg.intrude !== undefined) {
      resolved.intrude = msg.intrude;
    }
    else {
      resolved.intrude = 0.0
    }

    return resolved;
    }
};

module.exports = logistics;
