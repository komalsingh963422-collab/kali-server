#!/bin/bash

export USER=root
export HOME=/root
export DISPLAY=:1

mkdir -p /root/.vnc
echo "kali" | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

cat <<EOF > /root/.vnc/xstartup
#!/bin/bash
xrdb \$HOME/.Xresources
startxfce4 &
EOF

chmod +x /root/.vnc/xstartup

vncserver :1 -geometry 1280x720 -depth 24

sleep 5

cd /usr/share/novnc
./utils/novnc_proxy --vnc localhost:5901 --listen 8080