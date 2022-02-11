;; Auto-generated. Do not edit!


(when (boundp 'wasp_logistics::GetPose)
  (if (not (find-package "WASP_LOGISTICS"))
    (make-package "WASP_LOGISTICS"))
  (shadow 'GetPose (find-package "WASP_LOGISTICS")))
(unless (find-package "WASP_LOGISTICS::GETPOSE")
  (make-package "WASP_LOGISTICS::GETPOSE"))
(unless (find-package "WASP_LOGISTICS::GETPOSEREQUEST")
  (make-package "WASP_LOGISTICS::GETPOSEREQUEST"))
(unless (find-package "WASP_LOGISTICS::GETPOSERESPONSE")
  (make-package "WASP_LOGISTICS::GETPOSERESPONSE"))

(in-package "ROS")





(defclass wasp_logistics::GetPoseRequest
  :super ros::object
  :slots (_name ))

(defmethod wasp_logistics::GetPoseRequest
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

(defclass wasp_logistics::GetPoseResponse
  :super ros::object
  :slots (_x _y _theta ))

(defmethod wasp_logistics::GetPoseResponse
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _theta
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
     ;; float64 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta
     (setq _theta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass wasp_logistics::GetPose
  :super ros::object
  :slots ())

(setf (get wasp_logistics::GetPose :md5sum-) "5cf41b477a9443795d118795e7f68e1a")
(setf (get wasp_logistics::GetPose :datatype-) "wasp_logistics/GetPose")
(setf (get wasp_logistics::GetPose :request) wasp_logistics::GetPoseRequest)
(setf (get wasp_logistics::GetPose :response) wasp_logistics::GetPoseResponse)

(defmethod wasp_logistics::GetPoseRequest
  (:response () (instance wasp_logistics::GetPoseResponse :init)))

(setf (get wasp_logistics::GetPoseRequest :md5sum-) "5cf41b477a9443795d118795e7f68e1a")
(setf (get wasp_logistics::GetPoseRequest :datatype-) "wasp_logistics/GetPoseRequest")
(setf (get wasp_logistics::GetPoseRequest :definition-)
      "string name

---

float64 x
float64 y
float64 theta

")

(setf (get wasp_logistics::GetPoseResponse :md5sum-) "5cf41b477a9443795d118795e7f68e1a")
(setf (get wasp_logistics::GetPoseResponse :datatype-) "wasp_logistics/GetPoseResponse")
(setf (get wasp_logistics::GetPoseResponse :definition-)
      "string name

---

float64 x
float64 y
float64 theta

")



(provide :wasp_logistics/GetPose "5cf41b477a9443795d118795e7f68e1a")


