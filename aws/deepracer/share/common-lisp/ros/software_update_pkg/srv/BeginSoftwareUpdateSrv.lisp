; Auto-generated. Do not edit!


(cl:in-package software_update_pkg-srv)


;//! \htmlinclude BeginSoftwareUpdateSrv-request.msg.html

(cl:defclass <BeginSoftwareUpdateSrv-request> (roslisp-msg-protocol:ros-message)
  ((is_reboot
    :reader is_reboot
    :initarg :is_reboot
    :type cl:integer
    :initform 0))
)

(cl:defclass BeginSoftwareUpdateSrv-request (<BeginSoftwareUpdateSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BeginSoftwareUpdateSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BeginSoftwareUpdateSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<BeginSoftwareUpdateSrv-request> is deprecated: use software_update_pkg-srv:BeginSoftwareUpdateSrv-request instead.")))

(cl:ensure-generic-function 'is_reboot-val :lambda-list '(m))
(cl:defmethod is_reboot-val ((m <BeginSoftwareUpdateSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:is_reboot-val is deprecated.  Use software_update_pkg-srv:is_reboot instead.")
  (is_reboot m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BeginSoftwareUpdateSrv-request>) ostream)
  "Serializes a message object of type '<BeginSoftwareUpdateSrv-request>"
  (cl:let* ((signed (cl:slot-value msg 'is_reboot)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BeginSoftwareUpdateSrv-request>) istream)
  "Deserializes a message object of type '<BeginSoftwareUpdateSrv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'is_reboot) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BeginSoftwareUpdateSrv-request>)))
  "Returns string type for a service object of type '<BeginSoftwareUpdateSrv-request>"
  "software_update_pkg/BeginSoftwareUpdateSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BeginSoftwareUpdateSrv-request)))
  "Returns string type for a service object of type 'BeginSoftwareUpdateSrv-request"
  "software_update_pkg/BeginSoftwareUpdateSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BeginSoftwareUpdateSrv-request>)))
  "Returns md5sum for a message object of type '<BeginSoftwareUpdateSrv-request>"
  "ea2599098a45cca9fd2a26d9af6c5b79")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BeginSoftwareUpdateSrv-request)))
  "Returns md5sum for a message object of type 'BeginSoftwareUpdateSrv-request"
  "ea2599098a45cca9fd2a26d9af6c5b79")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BeginSoftwareUpdateSrv-request>)))
  "Returns full string definition for message of type '<BeginSoftwareUpdateSrv-request>"
  (cl:format cl:nil "int32 is_reboot~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BeginSoftwareUpdateSrv-request)))
  "Returns full string definition for message of type 'BeginSoftwareUpdateSrv-request"
  (cl:format cl:nil "int32 is_reboot~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BeginSoftwareUpdateSrv-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BeginSoftwareUpdateSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'BeginSoftwareUpdateSrv-request
    (cl:cons ':is_reboot (is_reboot msg))
))
;//! \htmlinclude BeginSoftwareUpdateSrv-response.msg.html

(cl:defclass <BeginSoftwareUpdateSrv-response> (roslisp-msg-protocol:ros-message)
  ((response_status
    :reader response_status
    :initarg :response_status
    :type cl:integer
    :initform 0))
)

(cl:defclass BeginSoftwareUpdateSrv-response (<BeginSoftwareUpdateSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BeginSoftwareUpdateSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BeginSoftwareUpdateSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<BeginSoftwareUpdateSrv-response> is deprecated: use software_update_pkg-srv:BeginSoftwareUpdateSrv-response instead.")))

(cl:ensure-generic-function 'response_status-val :lambda-list '(m))
(cl:defmethod response_status-val ((m <BeginSoftwareUpdateSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:response_status-val is deprecated.  Use software_update_pkg-srv:response_status instead.")
  (response_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BeginSoftwareUpdateSrv-response>) ostream)
  "Serializes a message object of type '<BeginSoftwareUpdateSrv-response>"
  (cl:let* ((signed (cl:slot-value msg 'response_status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BeginSoftwareUpdateSrv-response>) istream)
  "Deserializes a message object of type '<BeginSoftwareUpdateSrv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'response_status) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BeginSoftwareUpdateSrv-response>)))
  "Returns string type for a service object of type '<BeginSoftwareUpdateSrv-response>"
  "software_update_pkg/BeginSoftwareUpdateSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BeginSoftwareUpdateSrv-response)))
  "Returns string type for a service object of type 'BeginSoftwareUpdateSrv-response"
  "software_update_pkg/BeginSoftwareUpdateSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BeginSoftwareUpdateSrv-response>)))
  "Returns md5sum for a message object of type '<BeginSoftwareUpdateSrv-response>"
  "ea2599098a45cca9fd2a26d9af6c5b79")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BeginSoftwareUpdateSrv-response)))
  "Returns md5sum for a message object of type 'BeginSoftwareUpdateSrv-response"
  "ea2599098a45cca9fd2a26d9af6c5b79")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BeginSoftwareUpdateSrv-response>)))
  "Returns full string definition for message of type '<BeginSoftwareUpdateSrv-response>"
  (cl:format cl:nil "int32 response_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BeginSoftwareUpdateSrv-response)))
  "Returns full string definition for message of type 'BeginSoftwareUpdateSrv-response"
  (cl:format cl:nil "int32 response_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BeginSoftwareUpdateSrv-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BeginSoftwareUpdateSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'BeginSoftwareUpdateSrv-response
    (cl:cons ':response_status (response_status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'BeginSoftwareUpdateSrv)))
  'BeginSoftwareUpdateSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'BeginSoftwareUpdateSrv)))
  'BeginSoftwareUpdateSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BeginSoftwareUpdateSrv)))
  "Returns string type for a service object of type '<BeginSoftwareUpdateSrv>"
  "software_update_pkg/BeginSoftwareUpdateSrv")