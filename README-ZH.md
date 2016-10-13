* [GitHub](https://github.com/Leafney/docker-flask)  
* [Docker Hub](https://hub.docker.com/r/leafney/docker-flask/)

#### docker-flask

Alpine + Docker + Flask + Gunicorn + Supervisor + Nginx

该镜像为通过Gunicorn和Nginx在alpine系统下部署Flask应用，并通过Supervisor管理后台进程的示例。

基础镜像为 `alpine:latest (v3.4)`

#### 创建镜像

```
$ docker build -t="leafney/docker-flask" .
```

#### 运行容器

##### 启动一个后台运行的默认容器

```
$ docker run -it --name flask -d -p 5000:80 leafney/docker-flask
```

该容器会运行在目录 `web/app.py` 下的默认Flask 站点文件.

###### 开启新命令窗口进入该后台运行的容器

```
$ docekr exec -it flask /bin/sh
```

###### 退出该命令窗口

```
$ Ctrl-p + Ctrl-q
```

##### 启动一个后台运行容器并挂载目录到容器内

挂载主机下站点目录 `/home/tiger/flaskweb` 到容器中 `/webapp/web` 下;
挂载主机下日志目录 `/home/tiger/flasklogs` 到容器中 `/webapp/log` 下;

```
$ docker run -it --name flask -d -p 5000:80 -v /home/tiger/flaskweb:/webapp/web -v /home/tiger/flasklogs:/webapp/log leafney/docker-flask
```

使用 `-v` 挂载后，新挂载的目录将隐藏容器中原来的目录。

我们可以编辑主机目录下 `/home/tiger/flaskweb` 的 Flask 站点文件，然后通过命令 `$ docker restart flask` 重启容器查看更改后的效果。
