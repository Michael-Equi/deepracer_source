; Auto-generated. Do not edit!


(cl:in-package software_update_pkg-srv)


;//! \htmlinclude VerifyModelReadySrv-request.msg.html

(cl:defclass <VerifyModelReadySrv-request> (roslisp-msg-protocol:ros-message)
  ((modelName
    :reader modelName
    :initarg :modelName
    :type cl:string
    :initform ""))
)

(cl:defclass VerifyModelReadySrv-request (<VerifyModelReadySrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VerifyModelReadySrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VerifyModelReadySrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<VerifyModelReadySrv-request> is deprecated: use software_update_pkg-srv:VerifyModelReadySrv-request instead.")))

(cl:ensure-generic-function 'modelName-val :lambda-list '(m))
(cl:defmethod modelName-val ((m <VerifyModelReadySrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:modelName-val is deprecated.  Use software_update_pkg-srv:modelName instead.")
  (modelName m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VerifyModelReadySrv-request>) ostream)
  "Serializes a message object of type '<VerifyModelReadySrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'modelName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'modelName))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VerifyModelReadySrv-request>) istream)
  "Deserializes a message object of type '<VerifyModelReadySrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'modelName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'modelName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VerifyModelReadySrv-request>)))
  "Returns string type for a service object of type '<VerifyModelReadySrv-request>"
  "software_update_pkg/VerifyModelReadySrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VerifyModelReadySrv-request)))
  "Returns string type for a service object of type 'VerifyModelReadySrv-request"
  "software_update_pkg/VerifyModelReadySrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VerifyModelReadySrv-request>)))
  "Returns md5sum for a message object of type '<VerifyModelReadySrv-request>"
  "8f8f9b97fa5ac9c24924e52aea4bca80")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VerifyModelReadySrv-request)))
  "Returns md5sum for a message object of type 'VerifyModelReadySrv-request"
  "8f8f9b97fa5ac9c24924e52aea4bca80")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VerifyModelReadySrv-request>)))
  "Returns full string definition for message of type '<VerifyModelReadySrv-request>"
  (cl:format cl:nil "string modelName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VerifyModelReadySrv-request)))
  "Returns full string definition for message of type 'VerifyModelReadySrv-request"
  (cl:format cl:nil "string modelName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VerifyModelReadySrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'modelName))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VerifyModelReadySrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'VerifyModelReadySrv-request
    (cl:cons ':modelName (modelName msg))
))
;//! \htmlinclude VerifyModelReadySrv-response.msg.html

(cl:defclass <VerifyModelReadySrv-response> (roslisp-msg-protocol:ros-message)
  ((response_status
    :reader response_status
    :initarg :response_status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass VerifyModelReadySrv-response (<VerifyModelReadySrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VerifyModelReadySrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VerifyModelReadySrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<VerifyModelReadySrv-response> is deprecated: use software_update_pkg-srv:VerifyModelReadySrv-response instead.")))

(cl:ensure-generic-function 'response_status-val :lambda-list '(m))
(cl:defmethod response_status-val ((m <VerifyModelReadySrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:response_status-val is deprecated.  Use software_update_pkg-srv:response_status instead.")
  (response_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VerifyModelReadySrv-response>) ostream)
  "Serializes a message object of type '<VerifyModelReadySrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'response_status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VerifyModelReadySrv-response>) istream)
  "Deserializes a message object of type '<VerifyModelReadySrv-response>"
    (cl:setf (cl:slot-value msg 'response_status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VerifyModelReadySrv-response>)))
  "Returns string type for a service object of type '<VerifyModelReadySrv-response>"
  "software_update_pkg/VerifyModelReadySrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VerifyModelReadySrv-response)))
  "Returns string type for a service object of type 'VerifyModelReadySrv-response"
  "software_update_pkg/VerifyModelReadySrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VerifyModelReadySrv-response>)))
  "Returns md5sum for a message object of type '<VerifyModelReadySrv-response>"
  "8f8f9b97fa5ac9c24924e52aea4bca80")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VerifyModelReadySrv-response)))
  "Returns md5sum for a message object of type 'VerifyModelReadySrv-response"
  "8f8f9b97fa5ac9c24924e52aea4bca80")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VerifyModelReadySrv-response>)))
  "Returns full string definition for message of type '<VerifyModelReadySrv-response>"
  (cl:format cl:nil "bool response_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VerifyModelReadySrv-response)))
  "Returns full string definition for message of type 'VerifyModelReadySrv-response"
  (cl:format cl:nil "bool response_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VerifyModelReadySrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VerifyModelReadySrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'VerifyModelReadySrv-response
    (cl:cons ':response_status (response_status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'VerifyModelReadySrv)))
  'VerifyModelReadySrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'VerifyModelReadySrv)))
  'VerifyModelReadySrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VerifyModelReadySrv)))
  "Returns string type for a service object of type '<VerifyModelReadySrv>"
  "software_update_pkg/VerifyModelReadySrv")