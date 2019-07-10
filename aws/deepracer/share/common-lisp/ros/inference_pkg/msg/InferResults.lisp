; Auto-generated. Do not edit!


(cl:in-package inference_pkg-msg)


;//! \htmlinclude InferResults.msg.html

(cl:defclass <InferResults> (roslisp-msg-protocol:ros-message)
  ((classLabel
    :reader classLabel
    :initarg :classLabel
    :type cl:integer
    :initform 0)
   (classProb
    :reader classProb
    :initarg :classProb
    :type cl:float
    :initform 0.0)
   (xMin
    :reader xMin
    :initarg :xMin
    :type cl:float
    :initform 0.0)
   (yMin
    :reader yMin
    :initarg :yMin
    :type cl:float
    :initform 0.0)
   (xMax
    :reader xMax
    :initarg :xMax
    :type cl:float
    :initform 0.0)
   (yMax
    :reader yMax
    :initarg :yMax
    :type cl:float
    :initform 0.0))
)

(cl:defclass InferResults (<InferResults>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InferResults>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InferResults)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name inference_pkg-msg:<InferResults> is deprecated: use inference_pkg-msg:InferResults instead.")))

(cl:ensure-generic-function 'classLabel-val :lambda-list '(m))
(cl:defmethod classLabel-val ((m <InferResults>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-msg:classLabel-val is deprecated.  Use inference_pkg-msg:classLabel instead.")
  (classLabel m))

(cl:ensure-generic-function 'classProb-val :lambda-list '(m))
(cl:defmethod classProb-val ((m <InferResults>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-msg:classProb-val is deprecated.  Use inference_pkg-msg:classProb instead.")
  (classProb m))

(cl:ensure-generic-function 'xMin-val :lambda-list '(m))
(cl:defmethod xMin-val ((m <InferResults>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-msg:xMin-val is deprecated.  Use inference_pkg-msg:xMin instead.")
  (xMin m))

(cl:ensure-generic-function 'yMin-val :lambda-list '(m))
(cl:defmethod yMin-val ((m <InferResults>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-msg:yMin-val is deprecated.  Use inference_pkg-msg:yMin instead.")
  (yMin m))

(cl:ensure-generic-function 'xMax-val :lambda-list '(m))
(cl:defmethod xMax-val ((m <InferResults>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-msg:xMax-val is deprecated.  Use inference_pkg-msg:xMax instead.")
  (xMax m))

(cl:ensure-generic-function 'yMax-val :lambda-list '(m))
(cl:defmethod yMax-val ((m <InferResults>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-msg:yMax-val is deprecated.  Use inference_pkg-msg:yMax instead.")
  (yMax m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InferResults>) ostream)
  "Serializes a message object of type '<InferResults>"
  (cl:let* ((signed (cl:slot-value msg 'classLabel)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'classProb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xMin))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yMin))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xMax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yMax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InferResults>) istream)
  "Deserializes a message object of type '<InferResults>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'classLabel) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'classProb) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xMin) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yMin) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xMax) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yMax) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InferResults>)))
  "Returns string type for a message object of type '<InferResults>"
  "inference_pkg/InferResults")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InferResults)))
  "Returns string type for a message object of type 'InferResults"
  "inference_pkg/InferResults")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InferResults>)))
  "Returns md5sum for a message object of type '<InferResults>"
  "1135a834c1577618b60cb2ddd0fff748")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InferResults)))
  "Returns md5sum for a message object of type 'InferResults"
  "1135a834c1577618b60cb2ddd0fff748")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InferResults>)))
  "Returns full string definition for message of type '<InferResults>"
  (cl:format cl:nil "int32 classLabel~%float32 classProb~%float32 xMin~%float32 yMin~%float32 xMax~%float32 yMax~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InferResults)))
  "Returns full string definition for message of type 'InferResults"
  (cl:format cl:nil "int32 classLabel~%float32 classProb~%float32 xMin~%float32 yMin~%float32 xMax~%float32 yMax~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InferResults>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InferResults>))
  "Converts a ROS message object to a list"
  (cl:list 'InferResults
    (cl:cons ':classLabel (classLabel msg))
    (cl:cons ':classProb (classProb msg))
    (cl:cons ':xMin (xMin msg))
    (cl:cons ':yMin (yMin msg))
    (cl:cons ':xMax (xMax msg))
    (cl:cons ':yMax (yMax msg))
))
