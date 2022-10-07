FROM treasurehighly/python3.10-ubuntu20.04

MAINTAINER Treasure_highly<2229064638@qq.com>

COPY ./somefiles /app/somefiles

WORKDIR /app

RUN apt-get update -y \
    && apt-get install ca-certificates -y \
    && echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse\ndeb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse\ndeb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse\ndeb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse" > /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install --reinstall ca-certificates \
    && apt-get install -y tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apt-get install -y git ttf-wqy-zenhei gnutls-bin \
    && git config --global --add safe.directory '*' \
    && git config --global pull.rebase false \
    && git config --global user.email "Docker@littlepaimon.bot" \
    && git config --global user.name "LittlePaimon" \
    && git config --global http.sslVerify false \
    && git config --global http.postBuffer 1048576000 \
    && pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip3 install --no-cache-dir poetry \
    && git clone https://github.com/CMHopeSunshine/LittlePaimon.git --depth=1 \
    && cd LittlePaimon \
    && mv /app/somefiles/docker-entrypoint.sh ./entrypoint.sh \
    && mv /app/somefiles/admin.sh ./admin.sh \
    && chmod +x /app/LittlePaimon/entrypoint.sh \
    && chmod +x /app/LittlePaimon/admin.sh \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /app/somefiles \
    && rm -rf /var/lib/apt/list/* \
    && rm -rf /tmp/*

WORKDIR /app/LittlePaimon

ENTRYPOINT ["./entrypoint.sh"]
    
