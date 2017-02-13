#### docker-flask

* [GitHub](https://github.com/Leafney/docker-flask)  
* [Docker Hub](https://hub.docker.com/r/leafney/docker-flask/)

Alpine + Docker + Flask + Gunicorn + Supervisor

The image by Gunicorn deployment Flask under alpine system application, and through the Supervisor management example of a background process.

Base image is `alpine:3.5`

#### Get image from Docker Hub

```
$ docker pull leafney/docker-flask
```

#### Start a default background running container

```
$ docker run -it --name flask -d -p 5000:5000 leafney/docker-flask
```

you can see it in browser by `http://yourhostip:5000` .

***

##### Start a background container and mount the directory to the container

Mounted under the host directory `/home/tiger/flaskweb` into the container `/web`:

```
$ docker run --name flask -v /home/tiger/flaskweb:/app -d -p 5000:5000 leafney/docker-flask
```

The current directory under the `/app` folder to mount the directory `flaskweb`:

```
- flaskweb
	- conf
		- supervisor_flask.ini
	- logs
	- web
		- app.py
```

File `supervisor_flask.ini` is used to set the supervisor boot parameters and Gunicorn settings.

Put your project files in the `web` directory,`app.py` is the startup file for your Flask project. And need to set up in the `app.py` monitoring open IP.

```
if __name__ == '__main__':
    app.run(host='0.0.0.0')
```

And then through the command `$ docker restart flask` to restart container.

***

#### Installing additional flask packages

The base dependency package is only installed in the Flask container. In the actual project, you also need to install other dependencies. You can install dependencies in the running Flask container by following commands:

```
$ docker exec CONTAINER_ID/NAME /bin/sh -c "pip install package-name"
```

For example, the project uses the mongodb database, you can install the following commands:

```
$ docker exec flask /bin/sh -c "pip install Flask-PyMongo"
```

After the installation is completed through the command `$ docker restart flask` to restart container.
