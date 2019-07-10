
(cl:in-package :asdf)

(defsystem "inference_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "InferResults" :depends-on ("_package_InferResults"))
    (:file "_package_InferResults" :depends-on ("_package"))
    (:file "InferResultsArray" :depends-on ("_package_InferResultsArray"))
    (:file "_package_InferResultsArray" :depends-on ("_package"))
    (:file "InferenceState" :depends-on ("_package_InferenceState"))
    (:file "_package_InferenceState" :depends-on ("_package"))
    (:file "LoadModel" :depends-on ("_package_LoadModel"))
    (:file "_package_LoadModel" :depends-on ("_package"))
  ))