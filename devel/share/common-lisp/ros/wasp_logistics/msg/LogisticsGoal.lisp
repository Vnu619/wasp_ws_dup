; Auto-generated. Do not edit!


(cl:in-package wasp_logistics-msg)


;//! \htmlinclude LogisticsGoal.msg.html

(cl:defclass <LogisticsGoal> (roslisp-msg-protocol:ros-message)
  ((active
    :reader active
    :initarg :active
    :type cl:boolean
    :initform cl:nil)
   (distance
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

(cl:defclass LogisticsGoal (<LogisticsGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LogisticsGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LogisticsGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wasp_logistics-msg:<LogisticsGoal> is deprecated: use wasp_logistics-msg:LogisticsGoal instead.")))

(cl:ensure-generic-function 'active-val :lambda-list '(m))
(cl:defmethod active-val ((m <LogisticsGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:active-val is deprecated.  Use wasp_logistics-msg:active instead.")
  (active m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <LogisticsGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:distance-val is deprecated.  Use wasp_logistics-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'liftup-val :lambda-list '(m))
(cl:defmethod liftup-val ((m <LogisticsGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:liftup-val is deprecated.  Use wasp_logistics-msg:liftup instead.")
  (liftup m))

(cl:ensure-generic-function 'liftdown-val :lambda-list '(m))
(cl:defmethod liftdown-val ((m <LogisticsGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:liftdown-val is deprecated.  Use wasp_logistics-msg:liftdown instead.")
  (liftdown m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LogisticsGoal>) ostream)
  "Serializes a message object of type '<LogisticsGoal>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'active) 1 0)) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LogisticsGoal>) istream)
  "Deserializes a message object of type '<LogisticsGoal>"
    (cl:setf (cl:slot-value msg 'active) (cl:not (cl:zerop (cl:read-byte istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LogisticsGoal>)))
  "Returns string type for a message object of type '<LogisticsGoal>"
  "wasp_logistics/LogisticsGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LogisticsGoal)))
  "Returns string type for a message object of type 'LogisticsGoal"
  "wasp_logistics/LogisticsGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LogisticsGoal>)))
  "Returns md5sum for a message object of type '<LogisticsGoal>"
  "eb138febd2383e49af85d47988e04ff4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LogisticsGoal)))
  "Returns md5sum for a message object of type 'LogisticsGoal"
  "eb138febd2383e49af85d47988e04ff4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LogisticsGoal>)))
  "Returns full string definition for message of type '<LogisticsGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%bool active~%float32 distance~%int32 liftup~%int32 liftdown~%#float32 startpoint_x~%#float32 startpoint_y~%#float32 startpoint_z~%#float32 startpoint_w~%#float32 endpoint_x~%#float32 endpoint_y~%#float32 endpoint_z~%#float32 endpoint_w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LogisticsGoal)))
  "Returns full string definition for message of type 'LogisticsGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%bool active~%float32 distance~%int32 liftup~%int32 liftdown~%#float32 startpoint_x~%#float32 startpoint_y~%#float32 startpoint_z~%#float32 startpoint_w~%#float32 endpoint_x~%#float32 endpoint_y~%#float32 endpoint_z~%#float32 endpoint_w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LogisticsGoal>))
  (cl:+ 0
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LogisticsGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'LogisticsGoal
    (cl:cons ':active (active msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':liftup (liftup msg))
    (cl:cons ':liftdown (liftdown msg))
))
