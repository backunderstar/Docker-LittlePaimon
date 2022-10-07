# Docker-LittlePaimon

## 一、部署流程（可用，具体流程待完善）

#### 1、安装docker

* 通过脚本或者自行百度方法进行安装

* 推荐使用脚本安装docker：

  ```shell
  curl -fsSL get.docker.com -o get-docker.sh
  sudo sh get-docker.sh --mirror Aliyun
  ```

* 配置镜像加速( **荐**：配置个人阿里云镜像加速器请自行百度搜索方法)：

  ```shell
  sudo mkdir -p /etc/docker
  sudo tee /etc/docker/daemon.json <<-'EOF'
  {
    "registry-mirrors": ["https://spu6dmnp.mirror.aliyuncs.com",
      "http://hub-mirror.c.163.com",
      "https://docker.mirrors.ustc.edu.cn",
      "https://cr.console.aliyun.com",
      "https://mirror.ccs.tencentyun.com"]
  }
  EOF
  sudo systemctl daemon-reload
  sudo systemctl restart docker
  ```

#### 2、安装docker-compose

* 国内安装命令：

  ```shell
  sudo curl -L https://get.daocloud.io/docker/compose/releases/download/v2.2.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  ```

* 国外服务器安装命令：

  ```shell
  sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  ```

* 赋予执行权限并查看版本号，确定是否安装成功：

  ```shell
  sudo chmod +x /usr/local/bin/docker-compose
  docker-compose --version
  ```

#### 3、拉取工作目录

* 安装git(百度装，或者脚本)

  * centos

  ​     `sudo yum install git -y`

  * ubuntu

  ​     `sudo apt install git -y`

* 拉取资源工作目录

  * github

    `git clone --depth=1 https://github.com/backunderstar/Docker-LittlePaimon.git`

  * gitee

    `git`

#### 4、启动容器并验证

* 在GenshinUID目录下后台启动容器  **[等待------]**  ：

  ```shell
  docker-compose up -d
  ```

* 上一条执行成功后，查看日志，初次启动安装依赖：

  ```shell
  docker-compose logs -f --tail=100
  ```

* 等到成功启动后，通过网页配置机器人账号密码登录设备验证等（确认防火墙、安全组开放端口），网址：

  ```markdown
  http://你的公网ip地址:端口号/go-cqhttp/
  ```
* 配置管理员，根据指引输入（暂用，待完善体验）：

  ```shell
  docker exec -it LittlePaimon ./admin.sh
  ```

#### 5、指令（需在Docker-LittlePaimon目录下）

* 停止

  ```shell
  docker-compose stop
  ```

* 后台启动

  ```shell
  docker-compose up -d
  ```

* 重启

  ```shell
  docker-compose restart
  ```

* 查看最近100条日志

  ```shell
  docker-compose logs -f --tail=100
  ```

* 停止并删除容器

  ```shell
  docker-compose down
  ```

#### 6、说明

* 本人小白，如有错漏欢迎指正。
* bot项目戳这里[CMHopeSunshine/LittlePaimon](https://github.com/KimigaiiWuyi/GenshinUID)
* 现版本地图功能对内存要求较大，防止死机建议对docker-compose.yaml中的内存限制部分应用，达到上限会自动重启容器。
* 小派蒙容器内存占用在600多，不知道为啥这么大，可能本体加chromium加一起就这么大。
* 为减小镜像体积，故大部分依赖安装放在了首次启动容器中。
* 利用poetry run nb plugin加载插件可以在Dockerfile里加命令重新构建你自己的镜像，也可以直接进入运行的容器进行安装。
* 学业紧张，不一定有时间，能跑就行。











## 其他

#### swap等设置脚本（没大用）：

```shell
wget -O box.sh https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/box.sh && chmod +x box.sh && clear && ./box.sh
```

