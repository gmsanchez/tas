#! /bin/bash
# Executed on button press, when first round is complete and mode should be switched to second round mode

# Save hector map to file
rosrun map_server map_saver -f "$(rospack find tas)/launch/config/map_server/hectormap"

# kill ROS nodes we don't need anymore
rosnode kill hector_mapping map_to_odom

# ROS-Launch the nodes needed for amcl mode
roslaunch tas odom_amcl.launch &

#ROS-Launch the controller node
roslaunch tas_autonomous_control controller.launch &
