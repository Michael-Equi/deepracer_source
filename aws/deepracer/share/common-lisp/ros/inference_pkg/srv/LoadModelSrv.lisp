; Auto-generated. Do not edit!


(cl:in-package inference_pkg-srv)


;//! \htmlinclude LoadModelSrv-request.msg.html

(cl:defclass <LoadModelSrv-request> (roslisp-msg-protocol:ros-message)
  ((artifactPath
    :reader artifactPath
    :initarg :artifactPath
    :type cl:string
    :initform "")
   (taskType
    :reader taskType
    :initarg :taskType
    :type cl:fixnum
    :initform 0)
   (preProcessType
    :reader preProcessType
    :initarg :preProcessType
    :type cl:fixnum
    :initform 0))
)

(cl:defclass LoadModelSrv-request (<LoadModelSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadModelSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadModelSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name inference_pkg-srv:<LoadModelSrv-request> is deprecated: use inference_pkg-srv:LoadModelSrv-request instead.")))

(cl:ensure-generic-function 'artifactPath-val :lambda-list '(m))
(cl:defmethod artifactPath-val ((m <LoadModelSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:artifactPath-val is deprecated.  Use inference_pkg-srv:artifactPath instead.")
  (artifactPath m))

(cl:ensure-generic-function 'taskType-val :lambda-list '(m))
(cl:defmethod taskType-val ((m <LoadModelSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:taskType-val is deprecated.  Use inference_pkg-srv:taskType instead.")
  (taskType m))

(cl:ensure-generic-function 'preProcessType-val :lambda-list '(m))
(cl:defmethod preProcessType-val ((m <LoadModelSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:preProcessType-val is deprecated.  Use inference_pkg-srv:preProcessType instead.")
  (preProcessType m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadModelSrv-request>) ostream)
  "Serializes a message object of type '<LoadModelSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'artifactPath))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'artifactPath))
  (cl:let* ((signed (cl:slot-value msg 'taskType)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'preProcessType)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadModelSrv-request>) istream)
  "Deserializes a message object of type '<LoadModelSrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'artifactPath) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'artifactPath) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'taskType) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'preProcessType) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadModelSrv-request>)))
  "Returns string type for a service object of type '<LoadModelSrv-request>"
  "inference_pkg/LoadModelSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadModelSrv-request)))
  "Returns string type for a service object of type 'LoadModelSrv-request"
  "inference_pkg/LoadModelSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadModelSrv-request>)))
  "Returns md5sum for a message object of type '<LoadModelSrv-request>"
  "2198cf91d52845545921e65722dce857")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadModelSrv-request)))
  "Returns md5sum for a message object of type 'LoadModelSrv-request"
  "2198cf91d52845545921e65722dce857")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadModelSrv-request>)))
  "Returns full string definition for message of type '<LoadModelSrv-request>"
  (cl:format cl:nil "string artifactPath~%int8 taskType~%int8 preProcessType~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadModelSrv-request)))
  "Returns full string definition for message of type 'LoadModelSrv-request"
  (cl:format cl:nil "string artifactPath~%int8 taskType~%int8 preProcessType~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadModelSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'artifactPath))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadModelSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadModelSrv-request
    (cl:cons ':artifactPath (artifactPath msg))
    (cl:cons ':taskType (taskType msg))
    (cl:cons ':preProcessType (preProcessType msg))
))
;//! \htmlinclude LoadModelSrv-response.msg.html

(cl:defclass <LoadModelSrv-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:integer
    :initform 0))
)

(cl:defclass LoadModelSrv-response (<LoadModelSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadModelSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadModelSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name inference_pkg-srv:<LoadModelSrv-response> is deprecated: use inference_pkg-srv:LoadModelSrv-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <LoadModelSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:error-val is deprecated.  Use inference_pkg-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadModelSrv-response>) ostream)
  "Serializes a message object of type '<LoadModelSrv-response>"
  (cl:let* ((signed (cl:slot-value msg 'error)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadModelSrv-response>) istream)
  "Deserializes a message object of type '<LoadModelSrv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadModelSrv-response>)))
  "Returns string type for a service object of type '<LoadModelSrv-response>"
  "inference_pkg/LoadModelSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadModelSrv-response)))
  "Returns string type for a service object of type 'LoadModelSrv-response"
  "inference_pkg/LoadModelSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadModelSrv-response>)))
  "Returns md5sum for a message object of type '<LoadModelSrv-response>"
  "2198cf91d52845545921e65722dce857")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadModelSrv-response)))
  "Returns md5sum for a message object of type 'LoadModelSrv-response"
  "2198cf91d52845545921e65722dce857")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadModelSrv-response>)))
  "Returns full string definition for message of type '<LoadModelSrv-response>"
  (cl:format cl:nil "int32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadModelSrv-response)))
  "Returns full string definition for message of type 'LoadModelSrv-response"
  (cl:format cl:nil "int32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadModelSrv-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadModelSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadModelSrv-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LoadModelSrv)))
  'LoadModelSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LoadModelSrv)))
  'LoadModelSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadModelSrv)))
  "Returns string type for a service object of type '<LoadModelSrv>"
  "inference_pkg/LoadModelSrv")