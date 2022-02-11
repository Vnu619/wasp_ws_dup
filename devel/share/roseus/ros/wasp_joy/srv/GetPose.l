;; Auto-generated. Do not edit!


(when (boundp 'wasp_joy::GetPose)
  (if (not (find-package "WASP_JOY"))
    (make-package "WASP_JOY"))
  (shadow 'GetPose (find-package "WASP_JOY")))
(unless (find-package "WASP_JOY::GETPOSE")
  (make-package "WASP_JOY::GETPOSE"))
(unless (find-package "WASP_JOY::GETPOSEREQUEST")
  (make-package "WASP_JOY::GETPOSEREQUEST"))
(unless (find-package "WASP_JOY::GETPOSERESPONSE")
  (make-package "WASP_JOY::GETPOSERESPONSE"))

(in-package "ROS")





(defclass wasp_joy::GetPoseRequest
  :super ros::object
  :slots (_name ))

(defmethod wasp_joy::GetPoseRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass wasp_joy::GetPoseResponse
  :super ros::object
  :slots (_x _y _theta_z _theta_w ))

(defmethod wasp_joy::GetPoseResponse
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta_z __theta_z) 0.0)
    ((:theta_w __theta_w) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta_z (float __theta_z))
   (setq _theta_w (float __theta_w))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta_z
   (&optional __theta_z)
   (if __theta_z (setq _theta_z __theta_z)) _theta_z)
  (:theta_w
   (&optional __theta_w)
   (if __theta_w (setq _theta_w __theta_w)) _theta_w)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _theta_z
    8
    ;; float64 _theta_w
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta_z
       (sys::poke _theta_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta_w
       (sys::poke _theta_w (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta_z
     (setq _theta_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta_w
     (setq _theta_w (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass wasp_joy::GetPose
  :super ros::object
  :slots ())

(setf (get wasp_joy::GetPose :md5sum-) "d5621c4e029c396eafa0fc5c878af17c")
(setf (get wasp_joy::GetPose :datatype-) "wasp_joy/GetPose")
(setf (get wasp_joy::GetPose :request) wasp_joy::GetPoseRequest)
(setf (get wasp_joy::GetPose :response) wasp_joy::GetPoseResponse)

(defmethod wasp_joy::GetPoseRequest
  (:response () (instance wasp_joy::GetPoseResponse :init)))

(setf (get wasp_joy::GetPoseRequest :md5sum-) "d5621c4e029c396eafa0fc5c878af17c")
(setf (get wasp_joy::GetPoseRequest :datatype-) "wasp_joy/GetPoseRequest")
(setf (get wasp_joy::GetPoseRequest :definition-)
      "string name

---

float64 x
float64 y
float64 theta_z
float64 theta_w

")

(setf (get wasp_joy::GetPoseResponse :md5sum-) "d5621c4e029c396eafa0fc5c878af17c")
(setf (get wasp_joy::GetPoseResponse :datatype-) "wasp_joy/GetPoseResponse")
(setf (get wasp_joy::GetPoseResponse :definition-)
      "string name

---

float64 x
float64 y
float64 theta_z
float64 theta_w

")



(provide :wasp_joy/GetPose "d5621c4e029c396eafa0fc5c878af17c")


