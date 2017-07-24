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
sudo docker run -ti -p 8080:80 dreamsxin/phalcon7:v1.0 -v
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
sudo docker run -tiP dreamsxin/phalcon7:v1.0
```
