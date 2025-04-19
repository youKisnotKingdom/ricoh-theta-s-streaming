#!/usr/bin/env bash
HOST=$1              # ?: 192.168.86.46
PORT=$2              # ?: 1234

gst-launch-1.0 -e \
  v4l2src device=/dev/video0 !                                      \
  image/jpeg,width=1280,height=720,framerate=2997/200 !  jpegdec !  \
  videoconvert ! video/x-raw,format=I420 !                          \
  x264enc tune=zerolatency speed-preset=veryfast bitrate=3000 key-int-max=30 ! \
  h264parse config-interval=1 !                                     \
  rtph264pay pt=96 !                                                \
  udpsink host=$HOST port=$PORT sync=false
