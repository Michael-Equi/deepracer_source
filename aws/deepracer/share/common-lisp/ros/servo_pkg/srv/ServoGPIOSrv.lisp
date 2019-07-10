; Auto-generated. Do not edit!


(cl:in-package servo_pkg-srv)


;//! \htmlinclude ServoGPIOSrv-request.msg.html

(cl:defclass <ServoGPIOSrv-request> (roslisp-msg-protocol:ros-message)
  ((enable
    :reader enable
    :initarg :enable
    :type cl:integer
    :initform 0))
)

(cl:defclass ServoGPIOSrv-request (<ServoGPIOSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ServoGPIOSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ServoGPIOSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_pkg-srv:<ServoGPIOSrv-request> is deprecated: use servo_pkg-srv:ServoGPIOSrv-request instead.")))

(cl:ensure-generic-function 'enable-val :lambda-list '(m))
(cl:defmethod enable-val ((m <ServoGPIOSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:enable-val is deprecated.  Use servo_pkg-srv:enable instead.")
  (enable m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ServoGPIOSrv-request>) ostream)
  "Serializes a message object of type '<ServoGPIOSrv-request>"
  (cl:let* ((signed (cl:slot-value msg 'enable)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ServoGPIOSrv-request>) istream)
  "Deserializes a message object of type '<ServoGPIOSrv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'enable) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ServoGPIOSrv-request>)))
  "Returns string type for a service object of type '<ServoGPIOSrv-request>"
  "servo_pkg/ServoGPIOSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ServoGPIOSrv-request)))
  "Returns string type for a service object of type 'ServoGPIOSrv-request"
  "servo_pkg/ServoGPIOSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ServoGPIOSrv-request>)))
  "Returns md5sum for a message object of type '<ServoGPIOSrv-request>"
  "40b334e92c50632c64188546bf265721")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ServoGPIOSrv-request)))
  "Returns md5sum for a message object of type 'ServoGPIOSrv-request"
  "40b334e92c50632c64188546bf265721")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ServoGPIOSrv-request>)))
  "Returns full string definition for message of type '<ServoGPIOSrv-request>"
  (cl:format cl:nil "int32 enable~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ServoGPIOSrv-request)))
  "Returns full string definition for message of type 'ServoGPIOSrv-request"
  (cl:format cl:nil "int32 enable~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ServoGPIOSrv-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ServoGPIOSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ServoGPIOSrv-request
    (cl:cons ':enable (enable msg))
))
;//! \htmlinclude ServoGPIOSrv-response.msg.html

(cl:defclass <ServoGPIOSrv-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:integer
    :initform 0))
)

(cl:defclass ServoGPIOSrv-response (<ServoGPIOSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ServoGPIOSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ServoGPIOSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_pkg-srv:<ServoGPIOSrv-response> is deprecated: use servo_pkg-srv:ServoGPIOSrv-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <ServoGPIOSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:error-val is deprecated.  Use servo_pkg-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ServoGPIOSrv-response>) ostream)
  "Serializes a message object of type '<ServoGPIOSrv-response>"
  (cl:let* ((signed (cl:slot-value msg 'error)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ServoGPIOSrv-response>) istream)
  "Deserializes a message object of type '<ServoGPIOSrv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ServoGPIOSrv-response>)))
  "Returns string type for a service object of type '<ServoGPIOSrv-response>"
  "servo_pkg/ServoGPIOSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ServoGPIOSrv-response)))
  "Returns string type for a service object of type 'ServoGPIOSrv-response"
  "servo_pkg/ServoGPIOSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ServoGPIOSrv-response>)))
  "Returns md5sum for a message object of type '<ServoGPIOSrv-response>"
  "40b334e92c50632c64188546bf265721")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ServoGPIOSrv-response)))
  "Returns md5sum for a message object of type 'ServoGPIOSrv-response"
  "40b334e92c50632c64188546bf265721")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ServoGPIOSrv-response>)))
  "Returns full string definition for message of type '<ServoGPIOSrv-response>"
  (cl:format cl:nil "int32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ServoGPIOSrv-response)))
  "Returns full string definition for message of type 'ServoGPIOSrv-response"
  (cl:format cl:nil "int32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ServoGPIOSrv-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ServoGPIOSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ServoGPIOSrv-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ServoGPIOSrv)))
  'ServoGPIOSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ServoGPIOSrv)))
  'ServoGPIOSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ServoGPIOSrv)))
  "Returns string type for a service object of type '<ServoGPIOSrv>"
  "servo_pkg/ServoGPIOSrv")