; Auto-generated. Do not edit!


(cl:in-package software_update_pkg-srv)


;//! \htmlinclude SoftwareUpdateStatusSrv-request.msg.html

(cl:defclass <SoftwareUpdateStatusSrv-request> (roslisp-msg-protocol:ros-message)
  ((request
    :reader request
    :initarg :request
    :type cl:integer
    :initform 0))
)

(cl:defclass SoftwareUpdateStatusSrv-request (<SoftwareUpdateStatusSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SoftwareUpdateStatusSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SoftwareUpdateStatusSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<SoftwareUpdateStatusSrv-request> is deprecated: use software_update_pkg-srv:SoftwareUpdateStatusSrv-request instead.")))

(cl:ensure-generic-function 'request-val :lambda-list '(m))
(cl:defmethod request-val ((m <SoftwareUpdateStatusSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:request-val is deprecated.  Use software_update_pkg-srv:request instead.")
  (request m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SoftwareUpdateStatusSrv-request>) ostream)
  "Serializes a message object of type '<SoftwareUpdateStatusSrv-request>"
  (cl:let* ((signed (cl:slot-value msg 'request)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SoftwareUpdateStatusSrv-request>) istream)
  "Deserializes a message object of type '<SoftwareUpdateStatusSrv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'request) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SoftwareUpdateStatusSrv-request>)))
  "Returns string type for a service object of type '<SoftwareUpdateStatusSrv-request>"
  "software_update_pkg/SoftwareUpdateStatusSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SoftwareUpdateStatusSrv-request)))
  "Returns string type for a service object of type 'SoftwareUpdateStatusSrv-request"
  "software_update_pkg/SoftwareUpdateStatusSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SoftwareUpdateStatusSrv-request>)))
  "Returns md5sum for a message object of type '<SoftwareUpdateStatusSrv-request>"
  "16a53cec453a3486977f4ea29e18c7f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SoftwareUpdateStatusSrv-request)))
  "Returns md5sum for a message object of type 'SoftwareUpdateStatusSrv-request"
  "16a53cec453a3486977f4ea29e18c7f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SoftwareUpdateStatusSrv-request>)))
  "Returns full string definition for message of type '<SoftwareUpdateStatusSrv-request>"
  (cl:format cl:nil "int32 request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SoftwareUpdateStatusSrv-request)))
  "Returns full string definition for message of type 'SoftwareUpdateStatusSrv-request"
  (cl:format cl:nil "int32 request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SoftwareUpdateStatusSrv-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SoftwareUpdateStatusSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SoftwareUpdateStatusSrv-request
    (cl:cons ':request (request msg))
))
;//! \htmlinclude SoftwareUpdateStatusSrv-response.msg.html

(cl:defclass <SoftwareUpdateStatusSrv-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:string
    :initform "")
   (update_pct
    :reader update_pct
    :initarg :update_pct
    :type cl:float
    :initform 0.0))
)

(cl:defclass SoftwareUpdateStatusSrv-response (<SoftwareUpdateStatusSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SoftwareUpdateStatusSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SoftwareUpdateStatusSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<SoftwareUpdateStatusSrv-response> is deprecated: use software_update_pkg-srv:SoftwareUpdateStatusSrv-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <SoftwareUpdateStatusSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:status-val is deprecated.  Use software_update_pkg-srv:status instead.")
  (status m))

(cl:ensure-generic-function 'update_pct-val :lambda-list '(m))
(cl:defmethod update_pct-val ((m <SoftwareUpdateStatusSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:update_pct-val is deprecated.  Use software_update_pkg-srv:update_pct instead.")
  (update_pct m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SoftwareUpdateStatusSrv-response>) ostream)
  "Serializes a message object of type '<SoftwareUpdateStatusSrv-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'update_pct))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SoftwareUpdateStatusSrv-response>) istream)
  "Deserializes a message object of type '<SoftwareUpdateStatusSrv-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'update_pct) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SoftwareUpdateStatusSrv-response>)))
  "Returns string type for a service object of type '<SoftwareUpdateStatusSrv-response>"
  "software_update_pkg/SoftwareUpdateStatusSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SoftwareUpdateStatusSrv-response)))
  "Returns string type for a service object of type 'SoftwareUpdateStatusSrv-response"
  "software_update_pkg/SoftwareUpdateStatusSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SoftwareUpdateStatusSrv-response>)))
  "Returns md5sum for a message object of type '<SoftwareUpdateStatusSrv-response>"
  "16a53cec453a3486977f4ea29e18c7f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SoftwareUpdateStatusSrv-response)))
  "Returns md5sum for a message object of type 'SoftwareUpdateStatusSrv-response"
  "16a53cec453a3486977f4ea29e18c7f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SoftwareUpdateStatusSrv-response>)))
  "Returns full string definition for message of type '<SoftwareUpdateStatusSrv-response>"
  (cl:format cl:nil "string status~%float32 update_pct~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SoftwareUpdateStatusSrv-response)))
  "Returns full string definition for message of type 'SoftwareUpdateStatusSrv-response"
  (cl:format cl:nil "string status~%float32 update_pct~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SoftwareUpdateStatusSrv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'status))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SoftwareUpdateStatusSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SoftwareUpdateStatusSrv-response
    (cl:cons ':status (status msg))
    (cl:cons ':update_pct (update_pct msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SoftwareUpdateStatusSrv)))
  'SoftwareUpdateStatusSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SoftwareUpdateStatusSrv)))
  'SoftwareUpdateStatusSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SoftwareUpdateStatusSrv)))
  "Returns string type for a service object of type '<SoftwareUpdateStatusSrv>"
  "software_update_pkg/SoftwareUpdateStatusSrv")