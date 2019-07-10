; Auto-generated. Do not edit!


(cl:in-package servo_pkg-srv)


;//! \htmlinclude GetCalSrv-request.msg.html

(cl:defclass <GetCalSrv-request> (roslisp-msg-protocol:ros-message)
  ((calType
    :reader calType
    :initarg :calType
    :type cl:integer
    :initform 0))
)

(cl:defclass GetCalSrv-request (<GetCalSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetCalSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetCalSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_pkg-srv:<GetCalSrv-request> is deprecated: use servo_pkg-srv:GetCalSrv-request instead.")))

(cl:ensure-generic-function 'calType-val :lambda-list '(m))
(cl:defmethod calType-val ((m <GetCalSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:calType-val is deprecated.  Use servo_pkg-srv:calType instead.")
  (calType m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetCalSrv-request>) ostream)
  "Serializes a message object of type '<GetCalSrv-request>"
  (cl:let* ((signed (cl:slot-value msg 'calType)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetCalSrv-request>) istream)
  "Deserializes a message object of type '<GetCalSrv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'calType) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetCalSrv-request>)))
  "Returns string type for a service object of type '<GetCalSrv-request>"
  "servo_pkg/GetCalSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetCalSrv-request)))
  "Returns string type for a service object of type 'GetCalSrv-request"
  "servo_pkg/GetCalSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetCalSrv-request>)))
  "Returns md5sum for a message object of type '<GetCalSrv-request>"
  "6b1cfc4aeba5f476d0600a3aa0cb37e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetCalSrv-request)))
  "Returns md5sum for a message object of type 'GetCalSrv-request"
  "6b1cfc4aeba5f476d0600a3aa0cb37e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetCalSrv-request>)))
  "Returns full string definition for message of type '<GetCalSrv-request>"
  (cl:format cl:nil "int32 calType~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetCalSrv-request)))
  "Returns full string definition for message of type 'GetCalSrv-request"
  (cl:format cl:nil "int32 calType~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetCalSrv-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetCalSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetCalSrv-request
    (cl:cons ':calType (calType msg))
))
;//! \htmlinclude GetCalSrv-response.msg.html

(cl:defclass <GetCalSrv-response> (roslisp-msg-protocol:ros-message)
  ((max
    :reader max
    :initarg :max
    :type cl:integer
    :initform 0)
   (mid
    :reader mid
    :initarg :mid
    :type cl:integer
    :initform 0)
   (min
    :reader min
    :initarg :min
    :type cl:integer
    :initform 0)
   (polarity
    :reader polarity
    :initarg :polarity
    :type cl:integer
    :initform 0)
   (error
    :reader error
    :initarg :error
    :type cl:integer
    :initform 0))
)

(cl:defclass GetCalSrv-response (<GetCalSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetCalSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetCalSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_pkg-srv:<GetCalSrv-response> is deprecated: use servo_pkg-srv:GetCalSrv-response instead.")))

(cl:ensure-generic-function 'max-val :lambda-list '(m))
(cl:defmethod max-val ((m <GetCalSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:max-val is deprecated.  Use servo_pkg-srv:max instead.")
  (max m))

(cl:ensure-generic-function 'mid-val :lambda-list '(m))
(cl:defmethod mid-val ((m <GetCalSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:mid-val is deprecated.  Use servo_pkg-srv:mid instead.")
  (mid m))

(cl:ensure-generic-function 'min-val :lambda-list '(m))
(cl:defmethod min-val ((m <GetCalSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:min-val is deprecated.  Use servo_pkg-srv:min instead.")
  (min m))

(cl:ensure-generic-function 'polarity-val :lambda-list '(m))
(cl:defmethod polarity-val ((m <GetCalSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:polarity-val is deprecated.  Use servo_pkg-srv:polarity instead.")
  (polarity m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <GetCalSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_pkg-srv:error-val is deprecated.  Use servo_pkg-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetCalSrv-response>) ostream)
  "Serializes a message object of type '<GetCalSrv-response>"
  (cl:let* ((signed (cl:slot-value msg 'max)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'mid)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'min)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'polarity)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'error)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetCalSrv-response>) istream)
  "Deserializes a message object of type '<GetCalSrv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'max) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mid) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'min) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'polarity) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetCalSrv-response>)))
  "Returns string type for a service object of type '<GetCalSrv-response>"
  "servo_pkg/GetCalSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetCalSrv-response)))
  "Returns string type for a service object of type 'GetCalSrv-response"
  "servo_pkg/GetCalSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetCalSrv-response>)))
  "Returns md5sum for a message object of type '<GetCalSrv-response>"
  "6b1cfc4aeba5f476d0600a3aa0cb37e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetCalSrv-response)))
  "Returns md5sum for a message object of type 'GetCalSrv-response"
  "6b1cfc4aeba5f476d0600a3aa0cb37e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetCalSrv-response>)))
  "Returns full string definition for message of type '<GetCalSrv-response>"
  (cl:format cl:nil "int32 max~%int32 mid~%int32 min~%int32 polarity~%int32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetCalSrv-response)))
  "Returns full string definition for message of type 'GetCalSrv-response"
  (cl:format cl:nil "int32 max~%int32 mid~%int32 min~%int32 polarity~%int32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetCalSrv-response>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetCalSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetCalSrv-response
    (cl:cons ':max (max msg))
    (cl:cons ':mid (mid msg))
    (cl:cons ':min (min msg))
    (cl:cons ':polarity (polarity msg))
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetCalSrv)))
  'GetCalSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetCalSrv)))
  'GetCalSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetCalSrv)))
  "Returns string type for a service object of type '<GetCalSrv>"
  "servo_pkg/GetCalSrv")