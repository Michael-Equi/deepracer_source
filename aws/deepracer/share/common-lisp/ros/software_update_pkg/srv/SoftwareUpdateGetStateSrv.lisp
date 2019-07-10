; Auto-generated. Do not edit!


(cl:in-package software_update_pkg-srv)


;//! \htmlinclude SoftwareUpdateGetStateSrv-request.msg.html

(cl:defclass <SoftwareUpdateGetStateSrv-request> (roslisp-msg-protocol:ros-message)
  ((forceUpdateCheck
    :reader forceUpdateCheck
    :initarg :forceUpdateCheck
    :type cl:integer
    :initform 0))
)

(cl:defclass SoftwareUpdateGetStateSrv-request (<SoftwareUpdateGetStateSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SoftwareUpdateGetStateSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SoftwareUpdateGetStateSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<SoftwareUpdateGetStateSrv-request> is deprecated: use software_update_pkg-srv:SoftwareUpdateGetStateSrv-request instead.")))

(cl:ensure-generic-function 'forceUpdateCheck-val :lambda-list '(m))
(cl:defmethod forceUpdateCheck-val ((m <SoftwareUpdateGetStateSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:forceUpdateCheck-val is deprecated.  Use software_update_pkg-srv:forceUpdateCheck instead.")
  (forceUpdateCheck m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SoftwareUpdateGetStateSrv-request>) ostream)
  "Serializes a message object of type '<SoftwareUpdateGetStateSrv-request>"
  (cl:let* ((signed (cl:slot-value msg 'forceUpdateCheck)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SoftwareUpdateGetStateSrv-request>) istream)
  "Deserializes a message object of type '<SoftwareUpdateGetStateSrv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'forceUpdateCheck) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SoftwareUpdateGetStateSrv-request>)))
  "Returns string type for a service object of type '<SoftwareUpdateGetStateSrv-request>"
  "software_update_pkg/SoftwareUpdateGetStateSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SoftwareUpdateGetStateSrv-request)))
  "Returns string type for a service object of type 'SoftwareUpdateGetStateSrv-request"
  "software_update_pkg/SoftwareUpdateGetStateSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SoftwareUpdateGetStateSrv-request>)))
  "Returns md5sum for a message object of type '<SoftwareUpdateGetStateSrv-request>"
  "38ceedc74510c56025a61b74f60c273e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SoftwareUpdateGetStateSrv-request)))
  "Returns md5sum for a message object of type 'SoftwareUpdateGetStateSrv-request"
  "38ceedc74510c56025a61b74f60c273e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SoftwareUpdateGetStateSrv-request>)))
  "Returns full string definition for message of type '<SoftwareUpdateGetStateSrv-request>"
  (cl:format cl:nil "int32 forceUpdateCheck~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SoftwareUpdateGetStateSrv-request)))
  "Returns full string definition for message of type 'SoftwareUpdateGetStateSrv-request"
  (cl:format cl:nil "int32 forceUpdateCheck~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SoftwareUpdateGetStateSrv-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SoftwareUpdateGetStateSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SoftwareUpdateGetStateSrv-request
    (cl:cons ':forceUpdateCheck (forceUpdateCheck msg))
))
;//! \htmlinclude SoftwareUpdateGetStateSrv-response.msg.html

(cl:defclass <SoftwareUpdateGetStateSrv-response> (roslisp-msg-protocol:ros-message)
  ((softwareUpdateState
    :reader softwareUpdateState
    :initarg :softwareUpdateState
    :type cl:integer
    :initform 0))
)

(cl:defclass SoftwareUpdateGetStateSrv-response (<SoftwareUpdateGetStateSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SoftwareUpdateGetStateSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SoftwareUpdateGetStateSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<SoftwareUpdateGetStateSrv-response> is deprecated: use software_update_pkg-srv:SoftwareUpdateGetStateSrv-response instead.")))

(cl:ensure-generic-function 'softwareUpdateState-val :lambda-list '(m))
(cl:defmethod softwareUpdateState-val ((m <SoftwareUpdateGetStateSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:softwareUpdateState-val is deprecated.  Use software_update_pkg-srv:softwareUpdateState instead.")
  (softwareUpdateState m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SoftwareUpdateGetStateSrv-response>) ostream)
  "Serializes a message object of type '<SoftwareUpdateGetStateSrv-response>"
  (cl:let* ((signed (cl:slot-value msg 'softwareUpdateState)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SoftwareUpdateGetStateSrv-response>) istream)
  "Deserializes a message object of type '<SoftwareUpdateGetStateSrv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'softwareUpdateState) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SoftwareUpdateGetStateSrv-response>)))
  "Returns string type for a service object of type '<SoftwareUpdateGetStateSrv-response>"
  "software_update_pkg/SoftwareUpdateGetStateSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SoftwareUpdateGetStateSrv-response)))
  "Returns string type for a service object of type 'SoftwareUpdateGetStateSrv-response"
  "software_update_pkg/SoftwareUpdateGetStateSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SoftwareUpdateGetStateSrv-response>)))
  "Returns md5sum for a message object of type '<SoftwareUpdateGetStateSrv-response>"
  "38ceedc74510c56025a61b74f60c273e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SoftwareUpdateGetStateSrv-response)))
  "Returns md5sum for a message object of type 'SoftwareUpdateGetStateSrv-response"
  "38ceedc74510c56025a61b74f60c273e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SoftwareUpdateGetStateSrv-response>)))
  "Returns full string definition for message of type '<SoftwareUpdateGetStateSrv-response>"
  (cl:format cl:nil "int32 softwareUpdateState~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SoftwareUpdateGetStateSrv-response)))
  "Returns full string definition for message of type 'SoftwareUpdateGetStateSrv-response"
  (cl:format cl:nil "int32 softwareUpdateState~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SoftwareUpdateGetStateSrv-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SoftwareUpdateGetStateSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SoftwareUpdateGetStateSrv-response
    (cl:cons ':softwareUpdateState (softwareUpdateState msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SoftwareUpdateGetStateSrv)))
  'SoftwareUpdateGetStateSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SoftwareUpdateGetStateSrv)))
  'SoftwareUpdateGetStateSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SoftwareUpdateGetStateSrv)))
  "Returns string type for a service object of type '<SoftwareUpdateGetStateSrv>"
  "software_update_pkg/SoftwareUpdateGetStateSrv")