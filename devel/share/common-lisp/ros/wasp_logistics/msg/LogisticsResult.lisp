; Auto-generated. Do not edit!


(cl:in-package wasp_logistics-msg)


;//! \htmlinclude LogisticsResult.msg.html

(cl:defclass <LogisticsResult> (roslisp-msg-protocol:ros-message)
  ((liftup_
    :reader liftup_
    :initarg :liftup_
    :type cl:integer
    :initform 0)
   (liftdown_
    :reader liftdown_
    :initarg :liftdown_
    :type cl:integer
    :initform 0)
   (final
    :reader final
    :initarg :final
    :type cl:integer
    :initform 0))
)

(cl:defclass LogisticsResult (<LogisticsResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LogisticsResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LogisticsResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wasp_logistics-msg:<LogisticsResult> is deprecated: use wasp_logistics-msg:LogisticsResult instead.")))

(cl:ensure-generic-function 'liftup_-val :lambda-list '(m))
(cl:defmethod liftup_-val ((m <LogisticsResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:liftup_-val is deprecated.  Use wasp_logistics-msg:liftup_ instead.")
  (liftup_ m))

(cl:ensure-generic-function 'liftdown_-val :lambda-list '(m))
(cl:defmethod liftdown_-val ((m <LogisticsResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:liftdown_-val is deprecated.  Use wasp_logistics-msg:liftdown_ instead.")
  (liftdown_ m))

(cl:ensure-generic-function 'final-val :lambda-list '(m))
(cl:defmethod final-val ((m <LogisticsResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:final-val is deprecated.  Use wasp_logistics-msg:final instead.")
  (final m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LogisticsResult>) ostream)
  "Serializes a message object of type '<LogisticsResult>"
  (cl:let* ((signed (cl:slot-value msg 'liftup_)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'liftdown_)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'final)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LogisticsResult>) istream)
  "Deserializes a message object of type '<LogisticsResult>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'liftup_) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'liftdown_) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'final) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LogisticsResult>)))
  "Returns string type for a message object of type '<LogisticsResult>"
  "wasp_logistics/LogisticsResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LogisticsResult)))
  "Returns string type for a message object of type 'LogisticsResult"
  "wasp_logistics/LogisticsResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LogisticsResult>)))
  "Returns md5sum for a message object of type '<LogisticsResult>"
  "609a04ed842c289f52a4ee3c9b0c5e0f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LogisticsResult)))
  "Returns md5sum for a message object of type 'LogisticsResult"
  "609a04ed842c289f52a4ee3c9b0c5e0f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LogisticsResult>)))
  "Returns full string definition for message of type '<LogisticsResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%int32 liftup_~%int32 liftdown_~%int32 final~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LogisticsResult)))
  "Returns full string definition for message of type 'LogisticsResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%int32 liftup_~%int32 liftdown_~%int32 final~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LogisticsResult>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LogisticsResult>))
  "Converts a ROS message object to a list"
  (cl:list 'LogisticsResult
    (cl:cons ':liftup_ (liftup_ msg))
    (cl:cons ':liftdown_ (liftdown_ msg))
    (cl:cons ':final (final msg))
))
