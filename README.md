```
docker build -t dashing -f Dockerfile .

rocker --oyr-run-arg " --privileged --network host"  --nvidia --x11 --volume rc_car:/ros2_ws/src/rc_car  -- dashing

colcon build --symlink-install

source install/setup.bash

ros2 launch rc_car rsp.launch.py

ros2 run xacro xacro src/rc_car/launch/ego_racecar.xacro > src/rc_car/launch/robot.urdf.xml && colcon build --symlink-install && ros2 launch rc_car rsp.launch.py use_sim_time:=true
```
