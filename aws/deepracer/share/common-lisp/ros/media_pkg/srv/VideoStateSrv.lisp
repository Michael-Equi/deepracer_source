; Auto-generated. Do not edit!


(cl:in-package media_pkg-srv)


;//! \htmlinclude VideoStateSrv-request.msg.html

(cl:defclass <VideoStateSrv-request> (roslisp-msg-protocol:ros-message)
  ((activateVideo
    :reader activateVideo
    :initarg :activateVideo
    :type cl:fixnum
    :initform 0))
)

(cl:defclass VideoStateSrv-request (<VideoStateSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VideoStateSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VideoStateSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name media_pkg-srv:<VideoStateSrv-request> is deprecated: use media_pkg-srv:VideoStateSrv-request instead.")))

(cl:ensure-generic-function 'activateVideo-val :lambda-list '(m))
(cl:defmethod activateVideo-val ((m <VideoStateSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader media_pkg-srv:activateVideo-val is deprecated.  Use media_pkg-srv:activateVideo instead.")
  (activateVideo m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VideoStateSrv-request>) ostream)
  "Serializes a message object of type '<VideoStateSrv-request>"
  (cl:let* ((signed (cl:slot-value msg 'activateVideo)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VideoStateSrv-request>) istream)
  "Deserializes a message object of type '<VideoStateSrv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'activateVideo) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VideoStateSrv-request>)))
  "Returns string type for a service object of type '<VideoStateSrv-request>"
  "media_pkg/VideoStateSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VideoStateSrv-request)))
  "Returns string type for a service object of type 'VideoStateSrv-request"
  "media_pkg/VideoStateSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VideoStateSrv-request>)))
  "Returns md5sum for a message object of type '<VideoStateSrv-request>"
  "4416021135ac788256017c226f5dd174")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VideoStateSrv-request)))
  "Returns md5sum for a message object of type 'VideoStateSrv-request"
  "4416021135ac788256017c226f5dd174")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VideoStateSrv-request>)))
  "Returns full string definition for message of type '<VideoStateSrv-request>"
  (cl:format cl:nil "int8 activateVideo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VideoStateSrv-request)))
  "Returns full string definition for message of type 'VideoStateSrv-request"
  (cl:format cl:nil "int8 activateVideo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VideoStateSrv-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VideoStateSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'VideoStateSrv-request
    (cl:cons ':activateVideo (activateVideo msg))
))
;//! \htmlinclude VideoStateSrv-response.msg.html

(cl:defclass <VideoStateSrv-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:integer
    :initform 0))
)

(cl:defclass VideoStateSrv-response (<VideoStateSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VideoStateSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VideoStateSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name media_pkg-srv:<VideoStateSrv-response> is deprecated: use media_pkg-srv:VideoStateSrv-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <VideoStateSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader media_pkg-srv:error-val is deprecated.  Use media_pkg-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VideoStateSrv-response>) ostream)
  "Serializes a message object of type '<VideoStateSrv-response>"
  (cl:let* ((signed (cl:slot-value msg 'error)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VideoStateSrv-response>) istream)
  "Deserializes a message object of type '<VideoStateSrv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VideoStateSrv-response>)))
  "Returns string type for a service object of type '<VideoStateSrv-response>"
  "media_pkg/VideoStateSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VideoStateSrv-response)))
  "Returns string type for a service object of type 'VideoStateSrv-response"
  "media_pkg/VideoStateSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VideoStateSrv-response>)))
  "Returns md5sum for a message object of type '<VideoStateSrv-response>"
  "4416021135ac788256017c226f5dd174")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VideoStateSrv-response)))
  "Returns md5sum for a message object of type 'VideoStateSrv-response"
  "4416021135ac788256017c226f5dd174")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VideoStateSrv-response>)))
  "Returns full string definition for message of type '<VideoStateSrv-response>"
  (cl:format cl:nil "int32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VideoStateSrv-response)))
  "Returns full string definition for message of type 'VideoStateSrv-response"
  (cl:format cl:nil "int32 error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VideoStateSrv-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VideoStateSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'VideoStateSrv-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'VideoStateSrv)))
  'VideoStateSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'VideoStateSrv)))
  'VideoStateSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VideoStateSrv)))
  "Returns string type for a service object of type '<VideoStateSrv>"
  "media_pkg/VideoStateSrv")