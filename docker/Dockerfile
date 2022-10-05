FROM archlinux:latest
MAINTAINER Treasure_highly<2229064638@qq.com>

COPY ./somefiles /app/somefiles

WORKDIR /app

RUN mv /app/somefiles/mirrorlist /etc/pacman.d/mirrorlist \
    && pacman -Syu --noconfirm \
    && pacman -S git python python-pip wqy-microhei chromium --noconfirm \
    && pacman -R chromium --noconfirm \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install poetry \
    && git config --global pull.rebase false \
    && git config --global user.email "docker@LittlePaimon.bot" \
    && git config --global user.name "LittlePaimon" \
    && git clone --depth=1 https://ghproxy.com/https://github.com/CMHopeSunshine/LittlePaimon.git \
    && mv /app/somefiles/docker-entrypoint.sh ./LittlePaimon/entrypoint.sh \
    && chmod +x /app/LittlePaimon/entrypoint.sh \
    && mv /app/somefiles/admin.sh /app/LittlePaimon/admin.sh \
    && chmod +x /app/LittlePaimon/admin.sh \
    && yes | pacman -Scc \
    && rm -rf /var/cache/* \
    && rm -rf /tmp/* 

WORKDIR /app/LittlePaimon

ENTRYPOINT ["./entrypoint.sh"]

