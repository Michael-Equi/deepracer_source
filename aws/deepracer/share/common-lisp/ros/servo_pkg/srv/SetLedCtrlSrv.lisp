; Auto-generated. Do not edit!


(cl:in-package servo_pkg-srv)


;//! \htmlinclude SetLedCtrlSrv-request.msg.html

(cl:defclass <SetLedCtrlSrv-request> (roslisp-msg-protocol:ros-message)
  ((red
    :reader red
    :initarg :red
    :type cl:integer
    :initform 0)
   (green
    :reader green
    :initarg :green
    :type cl:integer
    :initform 0)
   (blue
    :reader blue
    :initarg :blue
    :type cl:integer
    :initform 0))
)

(cl:defclass SetLedCtrlSrv-request (<SetLedCtrlSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetLedCtrlSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetLedCtrlSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_pkg-srv:<SetLedCtrlSrv-request> is deprecated: use servo_pkg-srv:SetLedCtrlSrv-request instead.")))

(cl:ensure-generic-function 'red-val :lambda-list '(m))
(cl:defmethod red-val ((m <SetLedCtrlSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:red-val is deprecated.  Use servo_pkg-srv:red instead.")
  (red m))

(cl:ensure-generic-function 'green-val :lambda-list '(m))
(cl:defmethod green-val ((m <SetLedCtrlSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:green-val is deprecated.  Use servo_pkg-srv:green instead.")
  (green m))

(cl:ensure-generic-function 'blue-val :lambda-list '(m))
(cl:defmethod blue-val ((m <SetLedCtrlSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:blue-val is deprecated.  Use servo_pkg-srv:blue instead.")
  (blue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetLedCtrlSrv-request>) ostream)
  "Serializes a message object of type '<SetLedCtrlSrv-request>"
  (cl:let* ((signed (cl:slot-value msg 'red)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'green)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'blue)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetLedCtrlSrv-request>) istream)
  "Deserializes a message object of type '<SetLedCtrlSrv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'red) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'green) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'blue) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetLedCtrlSrv-request>)))
  "Returns string type for a service object of type '<SetLedCtrlSrv-request>"
  "servo_pkg/SetLedCtrlSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLedCtrlSrv-request)))
  "Returns string type for a service object of type 'SetLedCtrlSrv-request"
  "servo_pkg/SetLedCtrlSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetLedCtrlSrv-request>)))
  "Returns md5sum for a message object of type '<SetLedCtrlSrv-request>"
  "a490b8b3cfdfafc7016c7a71f0a934af")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetLedCtrlSrv-request)))
  "Returns md5sum for a message object of type 'SetLedCtrlSrv-request"
  "a490b8b3cfdfafc7016c7a71f0a934af")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetLedCtrlSrv-request>)))
  "Returns full string definition for message of type '<SetLedCtrlSrv-request>"
  (cl:format cl:nil "int32 red~%int32 green~%int32 blue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetLedCtrlSrv-request)))
  "Returns full string definition for message of type 'SetLedCtrlSrv-request"
  (cl:format cl:nil "int32 red~%int32 green~%int32 blue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetLedCtrlSrv-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetLedCtrlSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetLedCtrlSrv-request
    (cl:cons ':red (red msg))
    (cl:cons ':green (green msg))
    (cl:cons ':blue (blue msg))
))
;//! \htmlinclude SetLedCtrlSrv-response.msg.html

(cl:defclass <SetLedCtrlSrv-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:integer
    :initform 0))
)

(cl:defclass SetLedCtrlSrv-response (<SetLedCtrlSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetLedCtrlSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetLedCtrlSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_pkg-srv:<SetLedCtrlSrv-response> is deprecated: use servo_pkg-srv:SetLedCtrlSrv-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetLedCtrlSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:error-val is deprecated.  Use servo_pkg-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetLedCtrlSrv-response>) ostream)
  "Serializes a message object of type '<SetLedCtrlSrv-response>"
  (cl:let* ((signed (cl:slot-value msg 'error)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetLedCtrlSrv-response>) istream)
  "Deserializes a message object of type '<SetLedCtrlSrv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetLedCtrlSrv-response>)))
  "Returns string type for a service object of type '<SetLedCtrlSrv-response>"
  "servo_pkg/SetLedCtrlSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLedCtrlSrv-response)))
  "Returns string type for a service object of type 'SetLedCtrlSrv-response"
  "servo_pkg/SetLedCtrlSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetLedCtrlSrv-response>)))
  "Returns md5sum for a message object of type '<SetLedCtrlSrv-response>"
  "a490b8b3cfdfafc7016c7a71f0a934af")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetLedCtrlSrv-response)))
  "Returns md5sum for a message object of type 'SetLedCtrlSrv-response"
  "a490b8b3cfdfafc7016c7a71f0a934af")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetLedCtrlSrv-response>)))
  "Returns full string definition for message of type '<SetLedCtrlSrv-response>"
  (cl:format cl:nil "int32 error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetLedCtrlSrv-response)))
  "Returns full string definition for message of type 'SetLedCtrlSrv-response"
  (cl:format cl:nil "int32 error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetLedCtrlSrv-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetLedCtrlSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetLedCtrlSrv-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetLedCtrlSrv)))
  'SetLedCtrlSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetLedCtrlSrv)))
  'SetLedCtrlSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLedCtrlSrv)))
  "Returns string type for a service object of type '<SetLedCtrlSrv>"
  "servo_pkg/SetLedCtrlSrv")