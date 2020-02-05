#!/usr/bin/env python
import rospy
import tf2_ros
import geometry_msgs.msg


if __name__ == "__main__":
    rospy.init_node('robot_pose_pub')
    tfBuffer = tf2_ros.Buffer()
    listener = tf2_ros.TransformListener(tfBuffer)

    # Make sure you provide the correct frame ids of your robot via the
    # parameter server.
    tf_base_link = rospy.get_param("~tf_base_link", "pickit/robot_base")
    tf_ee_link = rospy.get_param("~tf_ee_link", "pickit/robot_ee")
    publish_rate = rospy.get_param("~publish_rate", 10.0)
    base_to_ee_pub = rospy.Publisher("/pickit/robot_pose",
                                     geometry_msgs.msg.TransformStamped,
                                     queue_size=10)

    rate = rospy.Rate(publish_rate)
    while not rospy.is_shutdown():
        t = rospy.Time(0)
        try:
            trans_stamped = tfBuffer.lookup_transform(tf_base_link,
                                                      tf_ee_link, t)

        except (tf2_ros.LookupException, tf2_ros.ConnectivityException,
                tf2_ros.ExtrapolationException):
            rate.sleep()
            continue

        trans_stamped.header.frame_id = "pickit/robot_base"
        trans_stamped.child_frame_id = "pickit/robot_ee"

        base_to_ee_pub.publish(trans_stamped)
        rate.sleep()
