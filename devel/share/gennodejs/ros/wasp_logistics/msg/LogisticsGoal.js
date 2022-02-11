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

class LogisticsGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.active = null;
      this.distance = null;
      this.liftup = null;
      this.liftdown = null;
    }
    else {
      if (initObj.hasOwnProperty('active')) {
        this.active = initObj.active
      }
      else {
        this.active = false;
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
      if (initObj.hasOwnProperty('liftup')) {
        this.liftup = initObj.liftup
      }
      else {
        this.liftup = 0;
      }
      if (initObj.hasOwnProperty('liftdown')) {
        this.liftdown = initObj.liftdown
      }
      else {
        this.liftdown = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LogisticsGoal
    // Serialize message field [active]
    bufferOffset = _serializer.bool(obj.active, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float32(obj.distance, buffer, bufferOffset);
    // Serialize message field [liftup]
    bufferOffset = _serializer.int32(obj.liftup, buffer, bufferOffset);
    // Serialize message field [liftdown]
    bufferOffset = _serializer.int32(obj.liftdown, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LogisticsGoal
    let len;
    let data = new LogisticsGoal(null);
    // Deserialize message field [active]
    data.active = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [liftup]
    data.liftup = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [liftdown]
    data.liftdown = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'wasp_logistics/LogisticsGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb138febd2383e49af85d47988e04ff4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    #goal definition
    bool active
    float32 distance
    int32 liftup
    int32 liftdown
    #float32 startpoint_x
    #float32 startpoint_y
    #float32 startpoint_z
    #float32 startpoint_w
    #float32 endpoint_x
    #float32 endpoint_y
    #float32 endpoint_z
    #float32 endpoint_w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LogisticsGoal(null);
    if (msg.active !== undefined) {
      resolved.active = msg.active;
    }
    else {
      resolved.active = false
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    if (msg.liftup !== undefined) {
      resolved.liftup = msg.liftup;
    }
    else {
      resolved.liftup = 0
    }

    if (msg.liftdown !== undefined) {
      resolved.liftdown = msg.liftdown;
    }
    else {
      resolved.liftdown = 0
    }

    return resolved;
    }
};

module.exports = LogisticsGoal;