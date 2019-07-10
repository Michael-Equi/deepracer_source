
(cl:in-package :asdf)

(defsystem "media_pkg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "VideoStateSrv" :depends-on ("_package_VideoStateSrv"))
    (:file "_package_VideoStateSrv" :depends-on ("_package"))
  ))