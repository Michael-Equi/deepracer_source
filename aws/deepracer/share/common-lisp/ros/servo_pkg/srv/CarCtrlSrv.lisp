; Auto-generated. Do not edit!


(cl:in-package servo_pkg-srv)


;//! \htmlinclude CarCtrlSrv-request.msg.html

(cl:defclass <CarCtrlSrv-request> (roslisp-msg-protocol:ros-message)
  ((angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (throttle
    :reader throttle
    :initarg :throttle
    :type cl:float
    :initform 0.0))
)

(cl:defclass CarCtrlSrv-request (<CarCtrlSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CarCtrlSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CarCtrlSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_pkg-srv:<CarCtrlSrv-request> is deprecated: use servo_pkg-srv:CarCtrlSrv-request instead.")))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <CarCtrlSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:angle-val is deprecated.  Use servo_pkg-srv:angle instead.")
  (angle m))

(cl:ensure-generic-function 'throttle-val :lambda-list '(m))
(cl:defmethod throttle-val ((m <CarCtrlSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:throttle-val is deprecated.  Use servo_pkg-srv:throttle instead.")
  (throttle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CarCtrlSrv-request>) ostream)
  "Serializes a message object of type '<CarCtrlSrv-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'throttle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CarCtrlSrv-request>) istream)
  "Deserializes a message object of type '<CarCtrlSrv-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'throttle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CarCtrlSrv-request>)))
  "Returns string type for a service object of type '<CarCtrlSrv-request>"
  "servo_pkg/CarCtrlSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CarCtrlSrv-request)))
  "Returns string type for a service object of type 'CarCtrlSrv-request"
  "servo_pkg/CarCtrlSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CarCtrlSrv-request>)))
  "Returns md5sum for a message object of type '<CarCtrlSrv-request>"
  "eb0b21617c9a5a64365c67e7a8ff07e1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CarCtrlSrv-request)))
  "Returns md5sum for a message object of type 'CarCtrlSrv-request"
  "eb0b21617c9a5a64365c67e7a8ff07e1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CarCtrlSrv-request>)))
  "Returns full string definition for message of type '<CarCtrlSrv-request>"
  (cl:format cl:nil "float32 angle~%float32 throttle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CarCtrlSrv-request)))
  "Returns full string definition for message of type 'CarCtrlSrv-request"
  (cl:format cl:nil "float32 angle~%float32 throttle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CarCtrlSrv-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CarCtrlSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CarCtrlSrv-request
    (cl:cons ':angle (angle msg))
    (cl:cons ':throttle (throttle msg))
))
;//! \htmlinclude CarCtrlSrv-response.msg.html

(cl:defclass <CarCtrlSrv-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:integer
    :initform 0))
)

(cl:defclass CarCtrlSrv-response (<CarCtrlSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CarCtrlSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CarCtrlSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_pkg-srv:<CarCtrlSrv-response> is deprecated: use servo_pkg-srv:CarCtrlSrv-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <CarCtrlSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:error-val is deprecated.  Use servo_pkg-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CarCtrlSrv-response>) ostream)
  "Serializes a message object of type '<CarCtrlSrv-response>"
  (cl:let* ((signed (cl:slot-value msg 'error)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CarCtrlSrv-response>) istream)
  "Deserializes a message object of type '<CarCtrlSrv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CarCtrlSrv-response>)))
  "Returns string type for a service object of type '<CarCtrlSrv-response>"
  "servo_pkg/CarCtrlSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CarCtrlSrv-response)))
  "Returns string type for a service object of type 'CarCtrlSrv-response"
  "servo_pkg/CarCtrlSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CarCtrlSrv-response>)))
  "Returns md5sum for a message object of type '<CarCtrlSrv-response>"
  "eb0b21617c9a5a64365c67e7a8ff07e1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CarCtrlSrv-response)))
  "Returns md5sum for a message object of type 'CarCtrlSrv-response"
  "eb0b21617c9a5a64365c67e7a8ff07e1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CarCtrlSrv-response>)))
  "Returns full string definition for message of type '<CarCtrlSrv-response>"
  (cl:format cl:nil "int32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CarCtrlSrv-response)))
  "Returns full string definition for message of type 'CarCtrlSrv-response"
  (cl:format cl:nil "int32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CarCtrlSrv-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CarCtrlSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CarCtrlSrv-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CarCtrlSrv)))
  'CarCtrlSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CarCtrlSrv)))
  'CarCtrlSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CarCtrlSrv)))
  "Returns string type for a service object of type '<CarCtrlSrv>"
  "servo_pkg/CarCtrlSrv")