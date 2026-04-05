#!/bin/bash
set -e

# 更新软件源
apt update

# 安装常用工具
apt install -y python3-rosdep python3-catkin-tools git

# 初始化 rosdep
rosdep init || true
rosdep update

# 创建工作空间
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
catkin_make

# 写入环境变量
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
