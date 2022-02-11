;; Auto-generated. Do not edit!


(when (boundp 'wasp_logistics::TrolleyAlignFeedback)
  (if (not (find-package "WASP_LOGISTICS"))
    (make-package "WASP_LOGISTICS"))
  (shadow 'TrolleyAlignFeedback (find-package "WASP_LOGISTICS")))
(unless (find-package "WASP_LOGISTICS::TROLLEYALIGNFEEDBACK")
  (make-package "WASP_LOGISTICS::TROLLEYALIGNFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude TrolleyAlignFeedback.msg.html


(defclass wasp_logistics::TrolleyAlignFeedback
  :super ros::object
  :slots (_align_distance ))

(defmethod wasp_logistics::TrolleyAlignFeedback
  (:init
   (&key
    ((:align_distance __align_distance) 0.0)
    )
   (send-super :init)
   (setq _align_distance (float __align_distance))
   self)
  (:align_distance
   (&optional __align_distance)
   (if __align_distance (setq _align_distance __align_distance)) _align_distance)
  (:serialization-length
   ()
   (+
    ;; float32 _align_distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _align_distance
       (sys::poke _align_distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _align_distance
     (setq _align_distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get wasp_logistics::TrolleyAlignFeedback :md5sum-) "b7244dbdfcdb44c8b9d2912950696c78")
(setf (get wasp_logistics::TrolleyAlignFeedback :datatype-) "wasp_logistics/TrolleyAlignFeedback")
(setf (get wasp_logistics::TrolleyAlignFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#feedback
float32 align_distance



")



(provide :wasp_logistics/TrolleyAlignFeedback "b7244dbdfcdb44c8b9d2912950696c78")

