; Auto-generated. Do not edit!


(cl:in-package inference_pkg-srv)


;//! \htmlinclude ModelOptimize-request.msg.html

(cl:defclass <ModelOptimize-request> (roslisp-msg-protocol:ros-message)
  ((model_name
    :reader model_name
    :initarg :model_name
    :type cl:string
    :initform "")
   (img_format
    :reader img_format
    :initarg :img_format
    :type cl:string
    :initform "")
   (width
    :reader width
    :initarg :width
    :type cl:integer
    :initform 0)
   (height
    :reader height
    :initarg :height
    :type cl:integer
    :initform 0)
   (num_channels
    :reader num_channels
    :initarg :num_channels
    :type cl:integer
    :initform 0)
   (platform
    :reader platform
    :initarg :platform
    :type cl:integer
    :initform 0))
)

(cl:defclass ModelOptimize-request (<ModelOptimize-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ModelOptimize-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ModelOptimize-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name inference_pkg-srv:<ModelOptimize-request> is deprecated: use inference_pkg-srv:ModelOptimize-request instead.")))

(cl:ensure-generic-function 'model_name-val :lambda-list '(m))
(cl:defmethod model_name-val ((m <ModelOptimize-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:model_name-val is deprecated.  Use inference_pkg-srv:model_name instead.")
  (model_name m))

(cl:ensure-generic-function 'img_format-val :lambda-list '(m))
(cl:defmethod img_format-val ((m <ModelOptimize-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:img_format-val is deprecated.  Use inference_pkg-srv:img_format instead.")
  (img_format m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <ModelOptimize-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:width-val is deprecated.  Use inference_pkg-srv:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <ModelOptimize-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:height-val is deprecated.  Use inference_pkg-srv:height instead.")
  (height m))

(cl:ensure-generic-function 'num_channels-val :lambda-list '(m))
(cl:defmethod num_channels-val ((m <ModelOptimize-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:num_channels-val is deprecated.  Use inference_pkg-srv:num_channels instead.")
  (num_channels m))

(cl:ensure-generic-function 'platform-val :lambda-list '(m))
(cl:defmethod platform-val ((m <ModelOptimize-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:platform-val is deprecated.  Use inference_pkg-srv:platform instead.")
  (platform m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ModelOptimize-request>) ostream)
  "Serializes a message object of type '<ModelOptimize-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'model_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'model_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'img_format))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'img_format))
  (cl:let* ((signed (cl:slot-value msg 'width)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'height)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'num_channels)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'platform)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ModelOptimize-request>) istream)
  "Deserializes a message object of type '<ModelOptimize-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'model_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'model_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'img_format) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'img_format) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'width) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'height) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_channels) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'platform) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ModelOptimize-request>)))
  "Returns string type for a service object of type '<ModelOptimize-request>"
  "inference_pkg/ModelOptimizeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ModelOptimize-request)))
  "Returns string type for a service object of type 'ModelOptimize-request"
  "inference_pkg/ModelOptimizeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ModelOptimize-request>)))
  "Returns md5sum for a message object of type '<ModelOptimize-request>"
  "8be2292cb24bff10bcc1a8b3e969b144")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ModelOptimize-request)))
  "Returns md5sum for a message object of type 'ModelOptimize-request"
  "8be2292cb24bff10bcc1a8b3e969b144")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ModelOptimize-request>)))
  "Returns full string definition for message of type '<ModelOptimize-request>"
  (cl:format cl:nil "string model_name~%string img_format~%int32 width~%int32 height~%int32 num_channels~%int32 platform~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ModelOptimize-request)))
  "Returns full string definition for message of type 'ModelOptimize-request"
  (cl:format cl:nil "string model_name~%string img_format~%int32 width~%int32 height~%int32 num_channels~%int32 platform~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ModelOptimize-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'model_name))
     4 (cl:length (cl:slot-value msg 'img_format))
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ModelOptimize-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ModelOptimize-request
    (cl:cons ':model_name (model_name msg))
    (cl:cons ':img_format (img_format msg))
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':num_channels (num_channels msg))
    (cl:cons ':platform (platform msg))
))
;//! \htmlinclude ModelOptimize-response.msg.html

(cl:defclass <ModelOptimize-response> (roslisp-msg-protocol:ros-message)
  ((artifactPath
    :reader artifactPath
    :initarg :artifactPath
    :type cl:string
    :initform "")
   (hasError
    :reader hasError
    :initarg :hasError
    :type cl:integer
    :initform 0))
)

(cl:defclass ModelOptimize-response (<ModelOptimize-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ModelOptimize-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ModelOptimize-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name inference_pkg-srv:<ModelOptimize-response> is deprecated: use inference_pkg-srv:ModelOptimize-response instead.")))

(cl:ensure-generic-function 'artifactPath-val :lambda-list '(m))
(cl:defmethod artifactPath-val ((m <ModelOptimize-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:artifactPath-val is deprecated.  Use inference_pkg-srv:artifactPath instead.")
  (artifactPath m))

(cl:ensure-generic-function 'hasError-val :lambda-list '(m))
(cl:defmethod hasError-val ((m <ModelOptimize-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-srv:hasError-val is deprecated.  Use inference_pkg-srv:hasError instead.")
  (hasError m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ModelOptimize-response>) ostream)
  "Serializes a message object of type '<ModelOptimize-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'artifactPath))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'artifactPath))
  (cl:let* ((signed (cl:slot-value msg 'hasError)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ModelOptimize-response>) istream)
  "Deserializes a message object of type '<ModelOptimize-response>"
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
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hasError) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ModelOptimize-response>)))
  "Returns string type for a service object of type '<ModelOptimize-response>"
  "inference_pkg/ModelOptimizeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ModelOptimize-response)))
  "Returns string type for a service object of type 'ModelOptimize-response"
  "inference_pkg/ModelOptimizeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ModelOptimize-response>)))
  "Returns md5sum for a message object of type '<ModelOptimize-response>"
  "8be2292cb24bff10bcc1a8b3e969b144")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ModelOptimize-response)))
  "Returns md5sum for a message object of type 'ModelOptimize-response"
  "8be2292cb24bff10bcc1a8b3e969b144")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ModelOptimize-response>)))
  "Returns full string definition for message of type '<ModelOptimize-response>"
  (cl:format cl:nil "string artifactPath~%int32 hasError~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ModelOptimize-response)))
  "Returns full string definition for message of type 'ModelOptimize-response"
  (cl:format cl:nil "string artifactPath~%int32 hasError~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ModelOptimize-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'artifactPath))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ModelOptimize-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ModelOptimize-response
    (cl:cons ':artifactPath (artifactPath msg))
    (cl:cons ':hasError (hasError msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ModelOptimize)))
  'ModelOptimize-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ModelOptimize)))
  'ModelOptimize-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ModelOptimize)))
  "Returns string type for a service object of type '<ModelOptimize>"
  "inference_pkg/ModelOptimize")