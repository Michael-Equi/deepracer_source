; Auto-generated. Do not edit!


(cl:in-package software_update_pkg-srv)


;//! \htmlinclude ConsoleUploadModelSrv-request.msg.html

(cl:defclass <ConsoleUploadModelSrv-request> (roslisp-msg-protocol:ros-message)
  ((modelPath
    :reader modelPath
    :initarg :modelPath
    :type cl:string
    :initform "")
   (upload
    :reader upload
    :initarg :upload
    :type cl:integer
    :initform 0))
)

(cl:defclass ConsoleUploadModelSrv-request (<ConsoleUploadModelSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConsoleUploadModelSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConsoleUploadModelSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<ConsoleUploadModelSrv-request> is deprecated: use software_update_pkg-srv:ConsoleUploadModelSrv-request instead.")))

(cl:ensure-generic-function 'modelPath-val :lambda-list '(m))
(cl:defmethod modelPath-val ((m <ConsoleUploadModelSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:modelPath-val is deprecated.  Use software_update_pkg-srv:modelPath instead.")
  (modelPath m))

(cl:ensure-generic-function 'upload-val :lambda-list '(m))
(cl:defmethod upload-val ((m <ConsoleUploadModelSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:upload-val is deprecated.  Use software_update_pkg-srv:upload instead.")
  (upload m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConsoleUploadModelSrv-request>) ostream)
  "Serializes a message object of type '<ConsoleUploadModelSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'modelPath))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'modelPath))
  (cl:let* ((signed (cl:slot-value msg 'upload)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConsoleUploadModelSrv-request>) istream)
  "Deserializes a message object of type '<ConsoleUploadModelSrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'modelPath) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'modelPath) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'upload) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConsoleUploadModelSrv-request>)))
  "Returns string type for a service object of type '<ConsoleUploadModelSrv-request>"
  "software_update_pkg/ConsoleUploadModelSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConsoleUploadModelSrv-request)))
  "Returns string type for a service object of type 'ConsoleUploadModelSrv-request"
  "software_update_pkg/ConsoleUploadModelSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConsoleUploadModelSrv-request>)))
  "Returns md5sum for a message object of type '<ConsoleUploadModelSrv-request>"
  "c93eb4029ae5d4427bceee7bdbd54e60")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConsoleUploadModelSrv-request)))
  "Returns md5sum for a message object of type 'ConsoleUploadModelSrv-request"
  "c93eb4029ae5d4427bceee7bdbd54e60")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConsoleUploadModelSrv-request>)))
  "Returns full string definition for message of type '<ConsoleUploadModelSrv-request>"
  (cl:format cl:nil "string modelPath~%int32  upload~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConsoleUploadModelSrv-request)))
  "Returns full string definition for message of type 'ConsoleUploadModelSrv-request"
  (cl:format cl:nil "string modelPath~%int32  upload~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConsoleUploadModelSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'modelPath))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConsoleUploadModelSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ConsoleUploadModelSrv-request
    (cl:cons ':modelPath (modelPath msg))
    (cl:cons ':upload (upload msg))
))
;//! \htmlinclude ConsoleUploadModelSrv-response.msg.html

(cl:defclass <ConsoleUploadModelSrv-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:string
    :initform ""))
)

(cl:defclass ConsoleUploadModelSrv-response (<ConsoleUploadModelSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConsoleUploadModelSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConsoleUploadModelSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<ConsoleUploadModelSrv-response> is deprecated: use software_update_pkg-srv:ConsoleUploadModelSrv-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <ConsoleUploadModelSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:status-val is deprecated.  Use software_update_pkg-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConsoleUploadModelSrv-response>) ostream)
  "Serializes a message object of type '<ConsoleUploadModelSrv-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConsoleUploadModelSrv-response>) istream)
  "Deserializes a message object of type '<ConsoleUploadModelSrv-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConsoleUploadModelSrv-response>)))
  "Returns string type for a service object of type '<ConsoleUploadModelSrv-response>"
  "software_update_pkg/ConsoleUploadModelSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConsoleUploadModelSrv-response)))
  "Returns string type for a service object of type 'ConsoleUploadModelSrv-response"
  "software_update_pkg/ConsoleUploadModelSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConsoleUploadModelSrv-response>)))
  "Returns md5sum for a message object of type '<ConsoleUploadModelSrv-response>"
  "c93eb4029ae5d4427bceee7bdbd54e60")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConsoleUploadModelSrv-response)))
  "Returns md5sum for a message object of type 'ConsoleUploadModelSrv-response"
  "c93eb4029ae5d4427bceee7bdbd54e60")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConsoleUploadModelSrv-response>)))
  "Returns full string definition for message of type '<ConsoleUploadModelSrv-response>"
  (cl:format cl:nil "string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConsoleUploadModelSrv-response)))
  "Returns full string definition for message of type 'ConsoleUploadModelSrv-response"
  (cl:format cl:nil "string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConsoleUploadModelSrv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConsoleUploadModelSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ConsoleUploadModelSrv-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ConsoleUploadModelSrv)))
  'ConsoleUploadModelSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ConsoleUploadModelSrv)))
  'ConsoleUploadModelSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConsoleUploadModelSrv)))
  "Returns string type for a service object of type '<ConsoleUploadModelSrv>"
  "software_update_pkg/ConsoleUploadModelSrv")