;; Auto-generated. Do not edit!


(when (boundp 'wasp_joy::wall)
  (if (not (find-package "WASP_JOY"))
    (make-package "WASP_JOY"))
  (shadow 'wall (find-package "WASP_JOY")))
(unless (find-package "WASP_JOY::WALL")
  (make-package "WASP_JOY::WALL"))

(in-package "ROS")
;;//! \htmlinclude wall.msg.html


(defclass wasp_joy::wall
  :super ros::object
  :slots (_init _move ))

(defmethod wasp_joy::wall
  (:init
   (&key
    ((:init __init) 0.0)
    ((:move __move) 0.0)
    )
   (send-super :init)
   (setq _init (float __init))
   (setq _move (float __move))
   self)
  (:init
   (&optional __init)
   (if __init (setq _init __init)) _init)
  (:move
   (&optional __move)
   (if __move (setq _move __move)) _move)
  (:serialization-length
   ()
   (+
    ;; float64 _init
    8
    ;; float64 _move
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _init
       (sys::poke _init (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _move
       (sys::poke _move (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _init
     (setq _init (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _move
     (setq _move (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get wasp_joy::wall :md5sum-) "c4d4a2a8340d6604dab35f7221e2246d")
(setf (get wasp_joy::wall :datatype-) "wasp_joy/wall")
(setf (get wasp_joy::wall :definition-)
      "float64 init
float64 move

")



(provide :wasp_joy/wall "c4d4a2a8340d6604dab35f7221e2246d")


