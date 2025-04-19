#!/usr/bin/env bash
# gst_theta_mjpeg_stream.sh
# USAGE: ./gst_theta_mjpeg_stream.sh <HOST_IP> <PORT>
# ?: ./gst_theta_mjpeg_stream.sh 192.168.86.46 1234

HOST=$1              # ??? IP (??)
PORT=$2              # ??? UDP ??? (??)

gst-launch-1.0 -e \
    v4l2src device=/dev/video0 ! \
    image/jpeg,width=1280,height=720,framerate=30/1 ! \
    rtpjpegpay pt=96 ! \
    udpsink host=${HOST} port=${PORT} sync=false
