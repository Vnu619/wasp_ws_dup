; Auto-generated. Do not edit!


(cl:in-package wasp_logistics-msg)


;//! \htmlinclude TrolleyAlignGoal.msg.html

(cl:defclass <TrolleyAlignGoal> (roslisp-msg-protocol:ros-message)
  ((align
    :reader align
    :initarg :align
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass TrolleyAlignGoal (<TrolleyAlignGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrolleyAlignGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrolleyAlignGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wasp_logistics-msg:<TrolleyAlignGoal> is deprecated: use wasp_logistics-msg:TrolleyAlignGoal instead.")))

(cl:ensure-generic-function 'align-val :lambda-list '(m))
(cl:defmethod align-val ((m <TrolleyAlignGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wasp_logistics-msg:align-val is deprecated.  Use wasp_logistics-msg:align instead.")
  (align m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrolleyAlignGoal>) ostream)
  "Serializes a message object of type '<TrolleyAlignGoal>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'align) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrolleyAlignGoal>) istream)
  "Deserializes a message object of type '<TrolleyAlignGoal>"
    (cl:setf (cl:slot-value msg 'align) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrolleyAlignGoal>)))
  "Returns string type for a message object of type '<TrolleyAlignGoal>"
  "wasp_logistics/TrolleyAlignGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrolleyAlignGoal)))
  "Returns string type for a message object of type 'TrolleyAlignGoal"
  "wasp_logistics/TrolleyAlignGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrolleyAlignGoal>)))
  "Returns md5sum for a message object of type '<TrolleyAlignGoal>"
  "3d78b99c0a1f9f75d262b241769b0800")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrolleyAlignGoal)))
  "Returns md5sum for a message object of type 'TrolleyAlignGoal"
  "3d78b99c0a1f9f75d262b241769b0800")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrolleyAlignGoal>)))
  "Returns full string definition for message of type '<TrolleyAlignGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%bool align~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrolleyAlignGoal)))
  "Returns full string definition for message of type 'TrolleyAlignGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%bool align~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrolleyAlignGoal>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrolleyAlignGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'TrolleyAlignGoal
    (cl:cons ':align (align msg))
))
