; Auto-generated. Do not edit!


(cl:in-package software_update_pkg-srv)


;//! \htmlinclude OTGLinkStateSrv-request.msg.html

(cl:defclass <OTGLinkStateSrv-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass OTGLinkStateSrv-request (<OTGLinkStateSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OTGLinkStateSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OTGLinkStateSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<OTGLinkStateSrv-request> is deprecated: use software_update_pkg-srv:OTGLinkStateSrv-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OTGLinkStateSrv-request>) ostream)
  "Serializes a message object of type '<OTGLinkStateSrv-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OTGLinkStateSrv-request>) istream)
  "Deserializes a message object of type '<OTGLinkStateSrv-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OTGLinkStateSrv-request>)))
  "Returns string type for a service object of type '<OTGLinkStateSrv-request>"
  "software_update_pkg/OTGLinkStateSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OTGLinkStateSrv-request)))
  "Returns string type for a service object of type 'OTGLinkStateSrv-request"
  "software_update_pkg/OTGLinkStateSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OTGLinkStateSrv-request>)))
  "Returns md5sum for a message object of type '<OTGLinkStateSrv-request>"
  "ce83a82cad932a54230aee1371ab9c07")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OTGLinkStateSrv-request)))
  "Returns md5sum for a message object of type 'OTGLinkStateSrv-request"
  "ce83a82cad932a54230aee1371ab9c07")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OTGLinkStateSrv-request>)))
  "Returns full string definition for message of type '<OTGLinkStateSrv-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OTGLinkStateSrv-request)))
  "Returns full string definition for message of type 'OTGLinkStateSrv-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OTGLinkStateSrv-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OTGLinkStateSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'OTGLinkStateSrv-request
))
;//! \htmlinclude OTGLinkStateSrv-response.msg.html

(cl:defclass <OTGLinkStateSrv-response> (roslisp-msg-protocol:ros-message)
  ((link_state
    :reader link_state
    :initarg :link_state
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass OTGLinkStateSrv-response (<OTGLinkStateSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OTGLinkStateSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OTGLinkStateSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name software_update_pkg-srv:<OTGLinkStateSrv-response> is deprecated: use software_update_pkg-srv:OTGLinkStateSrv-response instead.")))

(cl:ensure-generic-function 'link_state-val :lambda-list '(m))
(cl:defmethod link_state-val ((m <OTGLinkStateSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader software_update_pkg-srv:link_state-val is deprecated.  Use software_update_pkg-srv:link_state instead.")
  (link_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OTGLinkStateSrv-response>) ostream)
  "Serializes a message object of type '<OTGLinkStateSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'link_state) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OTGLinkStateSrv-response>) istream)
  "Deserializes a message object of type '<OTGLinkStateSrv-response>"
    (cl:setf (cl:slot-value msg 'link_state) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OTGLinkStateSrv-response>)))
  "Returns string type for a service object of type '<OTGLinkStateSrv-response>"
  "software_update_pkg/OTGLinkStateSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OTGLinkStateSrv-response)))
  "Returns string type for a service object of type 'OTGLinkStateSrv-response"
  "software_update_pkg/OTGLinkStateSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OTGLinkStateSrv-response>)))
  "Returns md5sum for a message object of type '<OTGLinkStateSrv-response>"
  "ce83a82cad932a54230aee1371ab9c07")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OTGLinkStateSrv-response)))
  "Returns md5sum for a message object of type 'OTGLinkStateSrv-response"
  "ce83a82cad932a54230aee1371ab9c07")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OTGLinkStateSrv-response>)))
  "Returns full string definition for message of type '<OTGLinkStateSrv-response>"
  (cl:format cl:nil "bool link_state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OTGLinkStateSrv-response)))
  "Returns full string definition for message of type 'OTGLinkStateSrv-response"
  (cl:format cl:nil "bool link_state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OTGLinkStateSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OTGLinkStateSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'OTGLinkStateSrv-response
    (cl:cons ':link_state (link_state msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'OTGLinkStateSrv)))
  'OTGLinkStateSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'OTGLinkStateSrv)))
  'OTGLinkStateSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OTGLinkStateSrv)))
  "Returns string type for a service object of type '<OTGLinkStateSrv>"
  "software_update_pkg/OTGLinkStateSrv")