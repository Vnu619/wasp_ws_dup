; Auto-generated. Do not edit!


(cl:in-package wasp_joy-msg)


;//! \htmlinclude wall.msg.html

(cl:defclass <wall> (roslisp-msg-protocol:ros-message)
  ((init
    :reader init
    :initarg :init
    :type cl:float
    :initform 0.0)
   (move
    :reader move
    :initarg :move
    :type cl:float
    :initform 0.0))
)

(cl:defclass wall (<wall>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <wall>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'wall)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wasp_joy-msg:<wall> is deprecated: use wasp_joy-msg:wall instead.")))

(cl:ensure-generic-function 'init-val :lambda-list '(m))
(cl:defmethod init-val ((m <wall>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_joy-msg:init-val is deprecated.  Use wasp_joy-msg:init instead.")
  (init m))

(cl:ensure-generic-function 'move-val :lambda-list '(m))
(cl:defmethod move-val ((m <wall>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_joy-msg:move-val is deprecated.  Use wasp_joy-msg:move instead.")
  (move m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <wall>) ostream)
  "Serializes a message object of type '<wall>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'init))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'move))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <wall>) istream)
  "Deserializes a message object of type '<wall>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'init) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'move) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<wall>)))
  "Returns string type for a message object of type '<wall>"
  "wasp_joy/wall")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'wall)))
  "Returns string type for a message object of type 'wall"
  "wasp_joy/wall")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<wall>)))
  "Returns md5sum for a message object of type '<wall>"
  "c4d4a2a8340d6604dab35f7221e2246d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'wall)))
  "Returns md5sum for a message object of type 'wall"
  "c4d4a2a8340d6604dab35f7221e2246d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<wall>)))
  "Returns full string definition for message of type '<wall>"
  (cl:format cl:nil "float64 init~%float64 move~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'wall)))
  "Returns full string definition for message of type 'wall"
  (cl:format cl:nil "float64 init~%float64 move~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <wall>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <wall>))
  "Converts a ROS message object to a list"
  (cl:list 'wall
    (cl:cons ':init (init msg))
    (cl:cons ':move (move msg))
))
