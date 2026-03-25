#!/bin/bash

mkdir -p /root/.vnc
echo "kali" | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

vncserver :1 -geometry 1280x720 -depth 24

websockify --web=/usr/share/novnc/ 8080 localhost:5901