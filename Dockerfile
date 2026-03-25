FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    kali-desktop-xfce \
    xfce4 xfce4-goodies \
    tightvncserver \
    novnc websockify \
    sudo \
    dbus-x11 \
    x11-xserver-utils

RUN useradd -m kali && echo "kali:kali" | chpasswd && adduser kali sudo

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]