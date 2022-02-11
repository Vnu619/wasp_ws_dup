;; Auto-generated. Do not edit!


(when (boundp 'wasp_logistics::logistics)
  (if (not (find-package "WASP_LOGISTICS"))
    (make-package "WASP_LOGISTICS"))
  (shadow 'logistics (find-package "WASP_LOGISTICS")))
(unless (find-package "WASP_LOGISTICS::LOGISTICS")
  (make-package "WASP_LOGISTICS::LOGISTICS"))

(in-package "ROS")
;;//! \htmlinclude logistics.msg.html


(defclass wasp_logistics::logistics
  :super ros::object
  :slots (_liftup _liftdown _extrude _intrude ))

(defmethod wasp_logistics::logistics
  (:init
   (&key
    ((:liftup __liftup) 0.0)
    ((:liftdown __liftdown) 0.0)
    ((:extrude __extrude) 0.0)
    ((:intrude __intrude) 0.0)
    )
   (send-super :init)
   (setq _liftup (float __liftup))
   (setq _liftdown (float __liftdown))
   (setq _extrude (float __extrude))
   (setq _intrude (float __intrude))
   self)
  (:liftup
   (&optional __liftup)
   (if __liftup (setq _liftup __liftup)) _liftup)
  (:liftdown
   (&optional __liftdown)
   (if __liftdown (setq _liftdown __liftdown)) _liftdown)
  (:extrude
   (&optional __extrude)
   (if __extrude (setq _extrude __extrude)) _extrude)
  (:intrude
   (&optional __intrude)
   (if __intrude (setq _intrude __intrude)) _intrude)
  (:serialization-length
   ()
   (+
    ;; float64 _liftup
    8
    ;; float64 _liftdown
    8
    ;; float64 _extrude
    8
    ;; float64 _intrude
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _liftup
       (sys::poke _liftup (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _liftdown
       (sys::poke _liftdown (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _extrude
       (sys::poke _extrude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _intrude
       (sys::poke _intrude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _liftup
     (setq _liftup (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _liftdown
     (setq _liftdown (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _extrude
     (setq _extrude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _intrude
     (setq _intrude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get wasp_logistics::logistics :md5sum-) "d042c562a5284d9dab240d01fee79629")
(setf (get wasp_logistics::logistics :datatype-) "wasp_logistics/logistics")
(setf (get wasp_logistics::logistics :definition-)
      "float64 liftup
float64 liftdown
float64 extrude
float64 intrude

")



(provide :wasp_logistics/logistics "d042c562a5284d9dab240d01fee79629")

