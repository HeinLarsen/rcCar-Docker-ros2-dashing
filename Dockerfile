FROM osrf/ros:dashing-desktop

SHELL ["/bin/bash", "-c"]

# # Install wget
RUN apt-get update && \
  apt-get install -y wget

# Add Gazebo's package repository
RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" > /etc/apt/sources.list.d/gazebo-stable.list' && \
  wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -

# Update and install dependencies
RUN apt-get update --fix-missing && \
  apt-get install -y git \
  nano \
  vim \
  psmisc \
  python3-pip \
  ros-dashing-joint-state-publisher-gui \
  ros-dashing-teleop-* \
  ros-dashing-xacro \
  tmux \
  # ros-dashing-gazebo-* \
  curl

# RUN apt-get update && \
#   apt-get install -y software-properties-common && \
#   add-apt-repository -y ppa:deadsnakes/ppa && \
#   apt-get update && \
#   apt install -y python3.10

# Check dependencies for libgazebo11
RUN apt-get update && \
  apt-cache showpkg libgazebo11

# # Install dependencies for libgazebo11
# RUN apt-get install -y \
#   libignition-common3 \
#   libignition-math6 \
#   libignition-transport8

# # Install Gazebo 11 explicitly
# RUN apt-get update && \
#   apt-get install -y libgazebo11 \
#   gazebo11 \
#   libgazebo11-dev \
#   gazebo11-plugin-base

RUN apt-get install -y \
  libgazebo9 \
  gazebo9-common \
  gazebo9-plugin-base



# Source the ROS 2 Dashing setup script
RUN source /opt/ros/dashing/setup.bash

RUN mkdir -p ros2_ws/src/
# RUN wget https://raw.githubusercontent.com/ros-simulation/gazebo_ros_pkgs/dashing/gazebo_ros_pkgs.repos -O /ros2_ws/gazebo_ros_pkgs.repos
# RUN vcs import /ros2_ws/src < /ros2_ws/gazebo_ros_pkgs.repos
# Verify branch checkouts
# RUN cd /ros2_ws/src && \
#   for repo in $(vcs list); do \
#   cd $repo && \
#   git checkout dashing && \
#   cd -; \
#   done


## RUN vcs custom --args checkout dashing
COPY ros2_ws/src /ros2_ws/src
RUN source /opt/ros/dashing/setup.bash && \
  cd ros2_ws/ && \
  apt-get update --fix-missing && \
  rosdep install -i --from-path src --rosdistro dashing -y && \
  colcon build

WORKDIR '/ros2_ws'
RUN echo "source /opt/ros/dashing/setup.bash" >> ~/.bashrc
RUN echo "source /ros2_ws/install/setup.bash" >> ~/.bashrc

