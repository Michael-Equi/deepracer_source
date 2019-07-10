; Auto-generated. Do not edit!


(cl:in-package inference_pkg-srv)


;//! \htmlinclude InferenceStateSrv-request.msg.html

(cl:defclass <InferenceStateSrv-request> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:fixnum
    :initform 0)
   (taskType
    :reader taskType
    :initarg :taskType
    :type cl:fixnum
    :initform 0))
)

(cl:defclass InferenceStateSrv-request (<InferenceStateSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InferenceStateSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InferenceStateSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name inference_pkg-srv:<InferenceStateSrv-request> is deprecated: use inference_pkg-srv:InferenceStateSrv-request instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <InferenceStateSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:start-val is deprecated.  Use inference_pkg-srv:start instead.")
  (start m))

(cl:ensure-generic-function 'taskType-val :lambda-list '(m))
(cl:defmethod taskType-val ((m <InferenceStateSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:taskType-val is deprecated.  Use inference_pkg-srv:taskType instead.")
  (taskType m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InferenceStateSrv-request>) ostream)
  "Serializes a message object of type '<InferenceStateSrv-request>"
  (cl:let* ((signed (cl:slot-value msg 'start)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'taskType)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InferenceStateSrv-request>) istream)
  "Deserializes a message object of type '<InferenceStateSrv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'start) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'taskType) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InferenceStateSrv-request>)))
  "Returns string type for a service object of type '<InferenceStateSrv-request>"
  "inference_pkg/InferenceStateSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InferenceStateSrv-request)))
  "Returns string type for a service object of type 'InferenceStateSrv-request"
  "inference_pkg/InferenceStateSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InferenceStateSrv-request>)))
  "Returns md5sum for a message object of type '<InferenceStateSrv-request>"
  "e1c619b05d3cc42965b2e64132c9d838")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InferenceStateSrv-request)))
  "Returns md5sum for a message object of type 'InferenceStateSrv-request"
  "e1c619b05d3cc42965b2e64132c9d838")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InferenceStateSrv-request>)))
  "Returns full string definition for message of type '<InferenceStateSrv-request>"
  (cl:format cl:nil "int8 start~%int8 taskType~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InferenceStateSrv-request)))
  "Returns full string definition for message of type 'InferenceStateSrv-request"
  (cl:format cl:nil "int8 start~%int8 taskType~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InferenceStateSrv-request>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InferenceStateSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'InferenceStateSrv-request
    (cl:cons ':start (start msg))
    (cl:cons ':taskType (taskType msg))
))
;//! \htmlinclude InferenceStateSrv-response.msg.html

(cl:defclass <InferenceStateSrv-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:integer
    :initform 0))
)

(cl:defclass InferenceStateSrv-response (<InferenceStateSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InferenceStateSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InferenceStateSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name inference_pkg-srv:<InferenceStateSrv-response> is deprecated: use inference_pkg-srv:InferenceStateSrv-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <InferenceStateSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:error-val is deprecated.  Use inference_pkg-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InferenceStateSrv-response>) ostream)
  "Serializes a message object of type '<InferenceStateSrv-response>"
  (cl:let* ((signed (cl:slot-value msg 'error)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InferenceStateSrv-response>) istream)
  "Deserializes a message object of type '<InferenceStateSrv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InferenceStateSrv-response>)))
  "Returns string type for a service object of type '<InferenceStateSrv-response>"
  "inference_pkg/InferenceStateSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InferenceStateSrv-response)))
  "Returns string type for a service object of type 'InferenceStateSrv-response"
  "inference_pkg/InferenceStateSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InferenceStateSrv-response>)))
  "Returns md5sum for a message object of type '<InferenceStateSrv-response>"
  "e1c619b05d3cc42965b2e64132c9d838")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InferenceStateSrv-response)))
  "Returns md5sum for a message object of type 'InferenceStateSrv-response"
  "e1c619b05d3cc42965b2e64132c9d838")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InferenceStateSrv-response>)))
  "Returns full string definition for message of type '<InferenceStateSrv-response>"
  (cl:format cl:nil "int32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InferenceStateSrv-response)))
  "Returns full string definition for message of type 'InferenceStateSrv-response"
  (cl:format cl:nil "int32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InferenceStateSrv-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InferenceStateSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'InferenceStateSrv-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'InferenceStateSrv)))
  'InferenceStateSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'InferenceStateSrv)))
  'InferenceStateSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InferenceStateSrv)))
  "Returns string type for a service object of type '<InferenceStateSrv>"
  "inference_pkg/InferenceStateSrv")