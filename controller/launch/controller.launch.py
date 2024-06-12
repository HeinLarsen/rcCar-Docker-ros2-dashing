from launch import LaunchDescription
from launch_ros.actions import Node
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
import os
from ament_index_python.packages import get_package_share_directory


def generate_launch_description():

  use_sim_time = LaunchConfiguration('use_sim_time')

  joy_params = os.path.join(get_package_share_directory('controller'),'config','joystick.yaml')
  
  joy_node = Node(
            package='joy',
            node_executable='joy_node',
            parameters=[joy_params, {'use_sim_time': use_sim_time}],
         )


  teleop_node = Node(
            package='teleop_twist_joy',
            node_executable='teleop_node',
            name='teleop_node',
            parameters=[{
            'axis_linear.x': 4,
            'scale_linear.x': 1.0,
            'scale_linear_turbo.x': 1.0,
            'axis_angular.yaw': 0,
            'scale_angular.yaw': 0.5,
            'scale_angular_turbo.yaw': 1.0,
            'enable_button': 5,
            'enable_turbo_button': 4,
            'require_enable_button': True},
            {'use_sim_time': use_sim_time}],
            remappings=[('/cmd_vel','/cmd_vel_joy')]
         )


  return LaunchDescription([
        DeclareLaunchArgument(
            'use_sim_time',
            default_value='false',
            description='Use sim time if true'),
        joy_node,
        teleop_node,
        # twist_stamper       
    ])