#### docker-flask

* [GitHub](https://github.com/Leafney/docker-flask)  
* [Docker Hub](https://hub.docker.com/r/leafney/docker-flask/)

Alpine + Docker + Flask + Gunicorn + Supervisor

该镜像为通过Gunicorn在alpine系统下部署Flask应用，并通过Supervisor管理后台进程。

基础镜像为 `alpine:3.5`

***

#### 从 Docker Hub 获取该镜像

```
$ docker pull leafney/docker-flask
```

#### 启动一个后台运行的默认容器

```
$ docker run -it --name flask -d -p 5000:5000 leafney/docker-flask
```

可通过 `http://yourhostip:5000` 访问该站点。

***

##### 启动一个后台运行容器并挂载目录到容器内

挂载主机下目录 `/home/tiger/flaskweb` 到容器中 `/app` 下:

```
$ docker run --name flask -v /home/tiger/flaskweb:/app -d -p 5000:5000 leafney/docker-flask
```

将当前目录 `/app` 下的文件夹拷贝到挂载目录 `flaskweb` 下：

```
- flaskweb
	- conf
		- supervisor_flask.ini
	- logs
	- web
		- app.py
```

文件 `supervisor_flask.ini` 用来设置 supervisor启动参数及Gunicorn设置。

将你的项目文件放在 `web` 目录下，文件 `app.py` 是你的Flask项目的启动文件。并且需要在 `app.py` 中设置监听公开的 IP 。

```
if __name__ == '__main__':
    app.run(host='0.0.0.0')
```

然后通过命令 `$ docker restart flask` 重启容器。

***

#### 安装Flask依赖文件

该Flask容器中仅安装了基础依赖包。而在实际项目中，还需要安装其他的依赖包。可通过如下命令向运行中的Flask容器中安装依赖包：

```
$ docker exec CONTAINER_ID/NAME /bin/sh -c "pip install package-name"
```

例如项目中用到了mongodb数据库，则可以通过如下命令来安装：

```
$ docker exec flask /bin/sh -c "pip install Flask-PyMongo"
```

安装完成后通过命令 `$ docker restart flask` 重启容器即可。
