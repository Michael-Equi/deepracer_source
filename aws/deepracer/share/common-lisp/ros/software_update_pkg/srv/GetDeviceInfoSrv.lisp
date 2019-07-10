; Auto-generated. Do not edit!


(cl:in-package software_update_pkg-srv)


;//! \htmlinclude GetDeviceInfoSrv-request.msg.html

(cl:defclass <GetDeviceInfoSrv-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetDeviceInfoSrv-request (<GetDeviceInfoSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetDeviceInfoSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetDeviceInfoSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<GetDeviceInfoSrv-request> is deprecated: use software_update_pkg-srv:GetDeviceInfoSrv-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetDeviceInfoSrv-request>) ostream)
  "Serializes a message object of type '<GetDeviceInfoSrv-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetDeviceInfoSrv-request>) istream)
  "Deserializes a message object of type '<GetDeviceInfoSrv-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetDeviceInfoSrv-request>)))
  "Returns string type for a service object of type '<GetDeviceInfoSrv-request>"
  "software_update_pkg/GetDeviceInfoSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDeviceInfoSrv-request)))
  "Returns string type for a service object of type 'GetDeviceInfoSrv-request"
  "software_update_pkg/GetDeviceInfoSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetDeviceInfoSrv-request>)))
  "Returns md5sum for a message object of type '<GetDeviceInfoSrv-request>"
  "20e5c824a7eab55a41bcdd6797da20c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetDeviceInfoSrv-request)))
  "Returns md5sum for a message object of type 'GetDeviceInfoSrv-request"
  "20e5c824a7eab55a41bcdd6797da20c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetDeviceInfoSrv-request>)))
  "Returns full string definition for message of type '<GetDeviceInfoSrv-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetDeviceInfoSrv-request)))
  "Returns full string definition for message of type 'GetDeviceInfoSrv-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetDeviceInfoSrv-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetDeviceInfoSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetDeviceInfoSrv-request
))
;//! \htmlinclude GetDeviceInfoSrv-response.msg.html

(cl:defclass <GetDeviceInfoSrv-response> (roslisp-msg-protocol:ros-message)
  ((hardware_version
    :reader hardware_version
    :initarg :hardware_version
    :type cl:string
    :initform "")
   (software_version
    :reader software_version
    :initarg :software_version
    :type cl:string
    :initform ""))
)

(cl:defclass GetDeviceInfoSrv-response (<GetDeviceInfoSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetDeviceInfoSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetDeviceInfoSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<GetDeviceInfoSrv-response> is deprecated: use software_update_pkg-srv:GetDeviceInfoSrv-response instead.")))

(cl:ensure-generic-function 'hardware_version-val :lambda-list '(m))
(cl:defmethod hardware_version-val ((m <GetDeviceInfoSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:hardware_version-val is deprecated.  Use software_update_pkg-srv:hardware_version instead.")
  (hardware_version m))

(cl:ensure-generic-function 'software_version-val :lambda-list '(m))
(cl:defmethod software_version-val ((m <GetDeviceInfoSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:software_version-val is deprecated.  Use software_update_pkg-srv:software_version instead.")
  (software_version m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetDeviceInfoSrv-response>) ostream)
  "Serializes a message object of type '<GetDeviceInfoSrv-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'hardware_version))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'hardware_version))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'software_version))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'software_version))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetDeviceInfoSrv-response>) istream)
  "Deserializes a message object of type '<GetDeviceInfoSrv-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hardware_version) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'hardware_version) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'software_version) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'software_version) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetDeviceInfoSrv-response>)))
  "Returns string type for a service object of type '<GetDeviceInfoSrv-response>"
  "software_update_pkg/GetDeviceInfoSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDeviceInfoSrv-response)))
  "Returns string type for a service object of type 'GetDeviceInfoSrv-response"
  "software_update_pkg/GetDeviceInfoSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetDeviceInfoSrv-response>)))
  "Returns md5sum for a message object of type '<GetDeviceInfoSrv-response>"
  "20e5c824a7eab55a41bcdd6797da20c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetDeviceInfoSrv-response)))
  "Returns md5sum for a message object of type 'GetDeviceInfoSrv-response"
  "20e5c824a7eab55a41bcdd6797da20c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetDeviceInfoSrv-response>)))
  "Returns full string definition for message of type '<GetDeviceInfoSrv-response>"
  (cl:format cl:nil "string hardware_version~%string software_version~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetDeviceInfoSrv-response)))
  "Returns full string definition for message of type 'GetDeviceInfoSrv-response"
  (cl:format cl:nil "string hardware_version~%string software_version~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetDeviceInfoSrv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'hardware_version))
     4 (cl:length (cl:slot-value msg 'software_version))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetDeviceInfoSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetDeviceInfoSrv-response
    (cl:cons ':hardware_version (hardware_version msg))
    (cl:cons ':software_version (software_version msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetDeviceInfoSrv)))
  'GetDeviceInfoSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetDeviceInfoSrv)))
  'GetDeviceInfoSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDeviceInfoSrv)))
  "Returns string type for a service object of type '<GetDeviceInfoSrv>"
  "software_update_pkg/GetDeviceInfoSrv")