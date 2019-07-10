; Auto-generated. Do not edit!


(cl:in-package servo_pkg-srv)


;//! \htmlinclude GetLedCtrlSrv-request.msg.html

(cl:defclass <GetLedCtrlSrv-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetLedCtrlSrv-request (<GetLedCtrlSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetLedCtrlSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetLedCtrlSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_pkg-srv:<GetLedCtrlSrv-request> is deprecated: use servo_pkg-srv:GetLedCtrlSrv-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetLedCtrlSrv-request>) ostream)
  "Serializes a message object of type '<GetLedCtrlSrv-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetLedCtrlSrv-request>) istream)
  "Deserializes a message object of type '<GetLedCtrlSrv-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetLedCtrlSrv-request>)))
  "Returns string type for a service object of type '<GetLedCtrlSrv-request>"
  "servo_pkg/GetLedCtrlSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetLedCtrlSrv-request)))
  "Returns string type for a service object of type 'GetLedCtrlSrv-request"
  "servo_pkg/GetLedCtrlSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetLedCtrlSrv-request>)))
  "Returns md5sum for a message object of type '<GetLedCtrlSrv-request>"
  "c68492118bb6d7180f53625820775c5d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetLedCtrlSrv-request)))
  "Returns md5sum for a message object of type 'GetLedCtrlSrv-request"
  "c68492118bb6d7180f53625820775c5d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetLedCtrlSrv-request>)))
  "Returns full string definition for message of type '<GetLedCtrlSrv-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetLedCtrlSrv-request)))
  "Returns full string definition for message of type 'GetLedCtrlSrv-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetLedCtrlSrv-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetLedCtrlSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetLedCtrlSrv-request
))
;//! \htmlinclude GetLedCtrlSrv-response.msg.html

(cl:defclass <GetLedCtrlSrv-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass GetLedCtrlSrv-response (<GetLedCtrlSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetLedCtrlSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetLedCtrlSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_pkg-srv:<GetLedCtrlSrv-response> is deprecated: use servo_pkg-srv:GetLedCtrlSrv-response instead.")))

(cl:ensure-generic-function 'red-val :lambda-list '(m))
(cl:defmethod red-val ((m <GetLedCtrlSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:red-val is deprecated.  Use servo_pkg-srv:red instead.")
  (red m))

(cl:ensure-generic-function 'green-val :lambda-list '(m))
(cl:defmethod green-val ((m <GetLedCtrlSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:green-val is deprecated.  Use servo_pkg-srv:green instead.")
  (green m))

(cl:ensure-generic-function 'blue-val :lambda-list '(m))
(cl:defmethod blue-val ((m <GetLedCtrlSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:blue-val is deprecated.  Use servo_pkg-srv:blue instead.")
  (blue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetLedCtrlSrv-response>) ostream)
  "Serializes a message object of type '<GetLedCtrlSrv-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetLedCtrlSrv-response>) istream)
  "Deserializes a message object of type '<GetLedCtrlSrv-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetLedCtrlSrv-response>)))
  "Returns string type for a service object of type '<GetLedCtrlSrv-response>"
  "servo_pkg/GetLedCtrlSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetLedCtrlSrv-response)))
  "Returns string type for a service object of type 'GetLedCtrlSrv-response"
  "servo_pkg/GetLedCtrlSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetLedCtrlSrv-response>)))
  "Returns md5sum for a message object of type '<GetLedCtrlSrv-response>"
  "c68492118bb6d7180f53625820775c5d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetLedCtrlSrv-response)))
  "Returns md5sum for a message object of type 'GetLedCtrlSrv-response"
  "c68492118bb6d7180f53625820775c5d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetLedCtrlSrv-response>)))
  "Returns full string definition for message of type '<GetLedCtrlSrv-response>"
  (cl:format cl:nil "int32 red~%int32 green~%int32 blue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetLedCtrlSrv-response)))
  "Returns full string definition for message of type 'GetLedCtrlSrv-response"
  (cl:format cl:nil "int32 red~%int32 green~%int32 blue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetLedCtrlSrv-response>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetLedCtrlSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetLedCtrlSrv-response
    (cl:cons ':red (red msg))
    (cl:cons ':green (green msg))
    (cl:cons ':blue (blue msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetLedCtrlSrv)))
  'GetLedCtrlSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetLedCtrlSrv)))
  'GetLedCtrlSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetLedCtrlSrv)))
  "Returns string type for a service object of type '<GetLedCtrlSrv>"
  "servo_pkg/GetLedCtrlSrv")