```
docker build -t dashing -f Dockerfile .

rocker --oyr-run-arg " --privileged --network host"  --nvidia --x11 --volume rc_car:/ros2_ws/src/rc_car  -- dashing

source install/setup.bash

colcon build --symlink-install

source install/setup.bash

ros2 launch rc_car rsp.launch.py
```
