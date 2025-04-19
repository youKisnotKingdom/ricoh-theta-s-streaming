#!/usr/bin/env bash
# gst_theta_h264_stream.sh  ?: ./gst_theta_h264_stream.sh 192.168.86.46 1234

HOST=$1
PORT=$2

gst-launch-1.0 -e \
    v4l2src device=/dev/video0 ! \
    video/x-h264,width=1920,height=960,framerate=30/1 ! \
    h264parse config-interval=1 ! rtph264pay pt=96 ! \
    udpsink host=${HOST} port=${PORT} sync=false
