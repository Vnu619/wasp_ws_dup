
(cl:in-package :asdf)

(defsystem "waypoint_navi-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "wpexecuteAction" :depends-on ("_package_wpexecuteAction"))
    (:file "_package_wpexecuteAction" :depends-on ("_package"))
    (:file "wpexecuteActionFeedback" :depends-on ("_package_wpexecuteActionFeedback"))
    (:file "_package_wpexecuteActionFeedback" :depends-on ("_package"))
    (:file "wpexecuteActionGoal" :depends-on ("_package_wpexecuteActionGoal"))
    (:file "_package_wpexecuteActionGoal" :depends-on ("_package"))
    (:file "wpexecuteActionResult" :depends-on ("_package_wpexecuteActionResult"))
    (:file "_package_wpexecuteActionResult" :depends-on ("_package"))
    (:file "wpexecuteFeedback" :depends-on ("_package_wpexecuteFeedback"))
    (:file "_package_wpexecuteFeedback" :depends-on ("_package"))
    (:file "wpexecuteGoal" :depends-on ("_package_wpexecuteGoal"))
    (:file "_package_wpexecuteGoal" :depends-on ("_package"))
    (:file "wpexecuteResult" :depends-on ("_package_wpexecuteResult"))
    (:file "_package_wpexecuteResult" :depends-on ("_package"))
  ))