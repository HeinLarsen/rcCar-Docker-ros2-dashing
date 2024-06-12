FROM osrf/ros:dashing-desktop

SHELL ["/bin/bash", "-c"]

# Install wget
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
  ros-dashing-gazebo11-* \
  curl \
  ros-dashing-slam-toolbox \
  ros-dashing-robot-localization

# Check dependencies for libgazebo11
RUN apt-get update && \
  apt-cache showpkg libgazebo11

# Install dependencies for libgazebo11
RUN apt-get install -y \
  libignition-common3 \
  libignition-math6 \
  libignition-transport8

# Install Gazebo 11 explicitly
RUN apt-get update && \
  apt-get install -y libgazebo11 \
  gazebo11 \
  libgazebo11-dev \
  gazebo11-plugin-base

# Source the ROS 2 Dashing setup script
RUN source /opt/ros/dashing/setup.bash

RUN mkdir -p ros2_ws/src/
COPY ros2_ws/src /ros2_ws/src
RUN source /opt/ros/dashing/setup.bash && \
  cd ros2_ws/ && \
  apt-get update --fix-missing && \
  rosdep install -i --from-path src --rosdistro dashing -y && \
  colcon build

WORKDIR '/ros2_ws'
RUN echo "source /opt/ros/dashing/setup.bash" >> ~/.bashrc
RUN echo "source /ros2_ws/install/setup.bash" >> ~/.bashrc

# FROM osrf/ros:dashing-desktop

# SHELL ["/bin/bash", "-c"]

# # Update and install dependencies
# RUN apt-get update --fix-missing && \
#   apt-get install -y git \
#   nano \
#   vim \
#   psmisc \
#   python3-pip \
#   ros-dashing-joint-state-publisher-gui \
#   tmux \
#   ros-dashing-gazebo-* 



# # Source the ROS 2 Dashing setup script
# RUN source /opt/ros/dashing/setup.bash


# # dependencies
# RUN apt-get update --fix-missing && \
#   apt-get install -y git \
#   nano \
#   vim \
#   psmisc \
#   python3-pip \
#   libeigen3-dev \
#   tmux \
#   ros-dashing-rviz2 \
#   ros-dashing-navigation2 \
#   ros-dashing-nav2-bringup \
#   ros-dashing-gazebo-* \
#   ros-dashing-rplidar-ros \
#   ros-dashing-joint-state-publisher-gui \
#   # ros-dashing-turtlebot3-gazebo \
#   ros-dashing-twist-mux \
#   ros-dashing-slam-toolbox \
#   iputils-ping
# RUN apt-get -y dist-upgrade
# RUN pip3 install transforms3d