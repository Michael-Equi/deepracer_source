; Auto-generated. Do not edit!


(cl:in-package inference_pkg-msg)


;//! \htmlinclude InferResultsArray.msg.html

(cl:defclass <InferResultsArray> (roslisp-msg-protocol:ros-message)
  ((results
    :reader results
    :initarg :results
    :type (cl:vector inference_pkg-msg:InferResults)
   :initform (cl:make-array 0 :element-type 'inference_pkg-msg:InferResults :initial-element (cl:make-instance 'inference_pkg-msg:InferResults)))
   (img
    :reader img
    :initarg :img
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass InferResultsArray (<InferResultsArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InferResultsArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InferResultsArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name inference_pkg-msg:<InferResultsArray> is deprecated: use inference_pkg-msg:InferResultsArray instead.")))

(cl:ensure-generic-function 'results-val :lambda-list '(m))
(cl:defmethod results-val ((m <InferResultsArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-msg:results-val is deprecated.  Use inference_pkg-msg:results instead.")
  (results m))

(cl:ensure-generic-function 'img-val :lambda-list '(m))
(cl:defmethod img-val ((m <InferResultsArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inference_pkg-msg:img-val is deprecated.  Use inference_pkg-msg:img instead.")
  (img m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InferResultsArray>) ostream)
  "Serializes a message object of type '<InferResultsArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'results))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'results))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InferResultsArray>) istream)
  "Deserializes a message object of type '<InferResultsArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'results) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'results)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'inference_pkg-msg:InferResults))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InferResultsArray>)))
  "Returns string type for a message object of type '<InferResultsArray>"
  "inference_pkg/InferResultsArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InferResultsArray)))
  "Returns string type for a message object of type 'InferResultsArray"
  "inference_pkg/InferResultsArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InferResultsArray>)))
  "Returns md5sum for a message object of type '<InferResultsArray>"
  "5ad60674567d635f03223247f4d48371")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InferResultsArray)))
  "Returns md5sum for a message object of type 'InferResultsArray"
  "5ad60674567d635f03223247f4d48371")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InferResultsArray>)))
  "Returns full string definition for message of type '<InferResultsArray>"
  (cl:format cl:nil "InferResults[] results~%sensor_msgs/Image img~%================================================================================~%MSG: inference_pkg/InferResults~%int32 classLabel~%float32 classProb~%float32 xMin~%float32 yMin~%float32 xMax~%float32 yMax~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InferResultsArray)))
  "Returns full string definition for message of type 'InferResultsArray"
  (cl:format cl:nil "InferResults[] results~%sensor_msgs/Image img~%================================================================================~%MSG: inference_pkg/InferResults~%int32 classLabel~%float32 classProb~%float32 xMin~%float32 yMin~%float32 xMax~%float32 yMax~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InferResultsArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'results) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InferResultsArray>))
  "Converts a ROS message object to a list"
  (cl:list 'InferResultsArray
    (cl:cons ':results (results msg))
    (cl:cons ':img (img msg))
))
