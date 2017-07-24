docker-phalcon
==============

Install
-------
```shell
sudo apt-get install docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
```

下载构建
```shell
git clone https://github.com/dreamsxin/docker-phalcon7.git
cd docker-phalcon7
sudo docker build -t="dreamsxin/phalcon7:v1.0" .
# 查看镜像
sudo docker images dreamsxin/phalcon7
# 运行容器 -d 后台运行 -t 表示返回一个 tty 终端，-i 表示打开容器的标准输入，使用这个命令可以得到一个容器的 shell 终端 -p 端口映射
sudo docker run -dti --name phalcon7 -p 8080:80 dreamsxin/phalcon7:v1.0 -v
# 查看运行的容器
sudo docker ps

# 登录
sudo docker login
# 上传镜像
sudo docker push dreamsxin/phalcon7
```
或者直接从Docker Hub下载镜像
```shell
sudo docker pull dreamsxin/phalcon7
# -P：随机分配端口号
sudo docker run -tiP --name phalcon7 dreamsxin/phalcon7:v1.0
```

# 容器的操作

```shell
# 列出所有容器（包括未运行）
docker ps -a
## 使用后台模式和tty选项
docker run -dit 
# 启动已有容器
docker start [CONTAINER_NAME or CONTAINER_ID]
docker stop [CONTAINER_NAME or CONTAINER_ID]
# 删除
docker rm [CONTAINER_NAME or CONTAINER_ID]
# 重启
docker restart [CONTAINER_NAME or CONTAINER_ID]
# 调出后台容器
docker attach [CONTAINER_NAME or CONTAINER_ID]
```

# 保存容器为新的镜像

```shell
sudo docker ps
docker commit [CONTAINER_NAME or CONTAINER_ID] dreamsxin/phalcon7:v1.1
```