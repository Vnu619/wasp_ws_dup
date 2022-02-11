; Auto-generated. Do not edit!


(cl:in-package wasp_logistics-msg)


;//! \htmlinclude LogisticsFeedback.msg.html

(cl:defclass <LogisticsFeedback> (roslisp-msg-protocol:ros-message)
  ((distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (liftup
    :reader liftup
    :initarg :liftup
    :type cl:integer
    :initform 0)
   (liftdown
    :reader liftdown
    :initarg :liftdown
    :type cl:integer
    :initform 0))
)

(cl:defclass LogisticsFeedback (<LogisticsFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LogisticsFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LogisticsFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wasp_logistics-msg:<LogisticsFeedback> is deprecated: use wasp_logistics-msg:LogisticsFeedback instead.")))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <LogisticsFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:distance-val is deprecated.  Use wasp_logistics-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'liftup-val :lambda-list '(m))
(cl:defmethod liftup-val ((m <LogisticsFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:liftup-val is deprecated.  Use wasp_logistics-msg:liftup instead.")
  (liftup m))

(cl:ensure-generic-function 'liftdown-val :lambda-list '(m))
(cl:defmethod liftdown-val ((m <LogisticsFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:liftdown-val is deprecated.  Use wasp_logistics-msg:liftdown instead.")
  (liftdown m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LogisticsFeedback>) ostream)
  "Serializes a message object of type '<LogisticsFeedback>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'liftup)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'liftdown)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LogisticsFeedback>) istream)
  "Deserializes a message object of type '<LogisticsFeedback>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'liftup) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'liftdown) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LogisticsFeedback>)))
  "Returns string type for a message object of type '<LogisticsFeedback>"
  "wasp_logistics/LogisticsFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LogisticsFeedback)))
  "Returns string type for a message object of type 'LogisticsFeedback"
  "wasp_logistics/LogisticsFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LogisticsFeedback>)))
  "Returns md5sum for a message object of type '<LogisticsFeedback>"
  "5c7dbc18f58ce4ac772abd20f60ad4b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LogisticsFeedback)))
  "Returns md5sum for a message object of type 'LogisticsFeedback"
  "5c7dbc18f58ce4ac772abd20f60ad4b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LogisticsFeedback>)))
  "Returns full string definition for message of type '<LogisticsFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback~%float32 distance~%int32 liftup~%int32 liftdown~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LogisticsFeedback)))
  "Returns full string definition for message of type 'LogisticsFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback~%float32 distance~%int32 liftup~%int32 liftdown~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LogisticsFeedback>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LogisticsFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'LogisticsFeedback
    (cl:cons ':distance (distance msg))
    (cl:cons ':liftup (liftup msg))
    (cl:cons ':liftdown (liftdown msg))
))
