; Auto-generated. Do not edit!


(cl:in-package wasp_logistics-msg)


;//! \htmlinclude logistics.msg.html

(cl:defclass <logistics> (roslisp-msg-protocol:ros-message)
  ((liftup
    :reader liftup
    :initarg :liftup
    :type cl:float
    :initform 0.0)
   (liftdown
    :reader liftdown
    :initarg :liftdown
    :type cl:float
    :initform 0.0)
   (extrude
    :reader extrude
    :initarg :extrude
    :type cl:float
    :initform 0.0)
   (intrude
    :reader intrude
    :initarg :intrude
    :type cl:float
    :initform 0.0))
)

(cl:defclass logistics (<logistics>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <logistics>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'logistics)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wasp_logistics-msg:<logistics> is deprecated: use wasp_logistics-msg:logistics instead.")))

(cl:ensure-generic-function 'liftup-val :lambda-list '(m))
(cl:defmethod liftup-val ((m <logistics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:liftup-val is deprecated.  Use wasp_logistics-msg:liftup instead.")
  (liftup m))

(cl:ensure-generic-function 'liftdown-val :lambda-list '(m))
(cl:defmethod liftdown-val ((m <logistics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:liftdown-val is deprecated.  Use wasp_logistics-msg:liftdown instead.")
  (liftdown m))

(cl:ensure-generic-function 'extrude-val :lambda-list '(m))
(cl:defmethod extrude-val ((m <logistics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:extrude-val is deprecated.  Use wasp_logistics-msg:extrude instead.")
  (extrude m))

(cl:ensure-generic-function 'intrude-val :lambda-list '(m))
(cl:defmethod intrude-val ((m <logistics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:intrude-val is deprecated.  Use wasp_logistics-msg:intrude instead.")
  (intrude m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <logistics>) ostream)
  "Serializes a message object of type '<logistics>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'liftup))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'liftdown))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'extrude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'intrude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <logistics>) istream)
  "Deserializes a message object of type '<logistics>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'liftup) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'liftdown) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'extrude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'intrude) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<logistics>)))
  "Returns string type for a message object of type '<logistics>"
  "wasp_logistics/logistics")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'logistics)))
  "Returns string type for a message object of type 'logistics"
  "wasp_logistics/logistics")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<logistics>)))
  "Returns md5sum for a message object of type '<logistics>"
  "d042c562a5284d9dab240d01fee79629")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'logistics)))
  "Returns md5sum for a message object of type 'logistics"
  "d042c562a5284d9dab240d01fee79629")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<logistics>)))
  "Returns full string definition for message of type '<logistics>"
  (cl:format cl:nil "float64 liftup~%float64 liftdown~%float64 extrude~%float64 intrude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'logistics)))
  "Returns full string definition for message of type 'logistics"
  (cl:format cl:nil "float64 liftup~%float64 liftdown~%float64 extrude~%float64 intrude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <logistics>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <logistics>))
  "Converts a ROS message object to a list"
  (cl:list 'logistics
    (cl:cons ':liftup (liftup msg))
    (cl:cons ':liftdown (liftdown msg))
    (cl:cons ':extrude (extrude msg))
    (cl:cons ':intrude (intrude msg))
))
