import os

from launch import LaunchDescription
from launch_ros.actions import Node
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from ament_index_python.packages import get_package_share_directory


def generate_launch_description():

  use_sim_time = LaunchConfiguration('use_sim_time')

  urdf = os.path.join(get_package_share_directory('controller'),
                        'launch', 'robot.urdf.xml')
  
  joy_node = Node(
            package='joy',
            node_executable='joy_node',
            parameters=[{
                'dev_name': 'Microsoft X-Box One pad (Firmware 2015)',
                'default_trig_val': True,
                'deadzone': 0.05,
                'autorepeat_rate': 20.0
                }, {'use_sim_time': use_sim_time}],
         )


  teleop_node = Node(
            package='teleop_twist_joy',
            node_executable='teleop_node',
            name='teleop_node',
            parameters=[{
            'axis_linear.x': 4,
            'scale_linear.x': 0.5,
            'scale_linear_turbo.x': 1.0,
            'axis_angular.yaw': 0,
            'scale_angular.yaw': 1.0,
            'scale_angular_turbo.yaw': 1.0,
            'enable_button': 5,
            'enable_turbo_button': 4,
            'require_enable_button': True},
            {'use_sim_time': use_sim_time}],
            remappings=[('/cmd_vel','/cmd_vel_joy')]
         )
  
  robot_state_publisher_node = Node(
        package='robot_state_publisher',
        node_executable='robot_state_publisher',
        output='screen',
        parameters=[{'use_sim_time': use_sim_time}],
	    arguments=[urdf]
        )
    
  joint_state_publisher = Node(
        package='joint_state_publisher',
        node_executable='joint_state_publisher',
        output='screen',
        parameters=[{'use_sim_time': use_sim_time}]
    )
  
  robot_localization_node = Node(
        package='robot_localization',
        node_executable='ekf_node',
        output='screen'
  )
  
  slam_toolbox_node = Node(
        package='slam_toolbox',
        node_executable='async_slam_toolbox_node',
        output='screen'
    )


  return LaunchDescription([
        DeclareLaunchArgument(
            'use_sim_time',
            default_value='false',
            description='Use sim time if true'),
        joy_node,
        teleop_node,
        robot_state_publisher_node,
        joint_state_publisher,
        robot_localization_node,
        slam_toolbox_node
        # twist_stamper       
    ])