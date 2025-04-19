#!/usr/bin/env bash
# USAGE: ./gst_theta_mjpeg_stream.sh <HOST_IP> <PORT>

HOST=$1              # ?: 192.168.86.46
PORT=$2              # ?: 1234

# libv4l2 ???? MJPEG ????????????????????
export GST_V4L2_USE_LIBV4L2=1

gst-launch-1.0 -e \
    v4l2src device=/dev/video0 ! \
    image/jpeg,width=1280,height=720,framerate=2997/200 ! \
    rtpjpegpay pt=96 ! \
    udpsink host=${HOST} port=${PORT} sync=false
