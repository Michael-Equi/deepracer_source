
(cl:in-package :asdf)

(defsystem "inference_pkg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "InferenceStateSrv" :depends-on ("_package_InferenceStateSrv"))
    (:file "_package_InferenceStateSrv" :depends-on ("_package"))
    (:file "LoadModelSrv" :depends-on ("_package_LoadModelSrv"))
    (:file "_package_LoadModelSrv" :depends-on ("_package"))
    (:file "ModelOptimize" :depends-on ("_package_ModelOptimize"))
    (:file "_package_ModelOptimize" :depends-on ("_package"))
  ))