
(cl:in-package :asdf)

(defsystem "wasp_joy-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "logistics" :depends-on ("_package_logistics"))
    (:file "_package_logistics" :depends-on ("_package"))
    (:file "wall" :depends-on ("_package_wall"))
    (:file "_package_wall" :depends-on ("_package"))
  ))