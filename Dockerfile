FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    kali-linux-default \
    xfce4 xfce4-goodies \
    tightvncserver \
    novnc websockify \
    sudo

RUN useradd -m kali && echo "kali:kali" | chpasswd && adduser kali sudo

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]