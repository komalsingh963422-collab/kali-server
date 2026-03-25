#!/bin/bash
vncserver :1 -geometry 1280x720 -depth 24
websockify --web=/usr/share/novnc/ 8080 localhost:5901