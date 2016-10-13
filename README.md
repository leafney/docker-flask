[中文说明](/README-ZH.md)
[Docker Hub](https://hub.docker.com/r/leafney/docker-flask/)

#### docker-flask

Alpine + Docker + Flask + Gunicorn + Supervisor + Nginx

The image by Gunicorn and Nginx deployment Flask under alpine system application, and through the Supervisor management example of a background process.

Base image is `alpine:latest (v3.4)`

#### To build image

```
$ docker build -t="leafney/docker-flask" .
```

#### To run 

##### Start a default background running container

```
$ docker run -it --name flask -d -p 5000:80 leafney/docker-flask
```

whitch run the default flask web site file `web/app.py`.

###### Start a new Bash login the background running container

```
$ docekr exec -it flask /bin/sh
```

###### Quit the Bash :

```
$ Ctrl+P+Q
```

##### Start a background container and mount the directory to the container

Mounted under the host site directory `/home/tiger/flaskweb` into the container `/webapp/web`;
Mounted under the host site directory `/home/tiger/flasklogs` into the container `/webapp/log`;

```
$ docker run -it --name flask -d -p 5000:80 -v /home/tiger/flaskweb:/webapp/web -v /home/tiger/flasklogs:/webapp/log leafney/docker-flask
```

After using `-v` mount, new mounted directory will hide the original directory in the container.

We can edit flask web files in the host site directory  `/home/tiger/flaskweb` then run bash `$ docker restart flask` to view the modified effect.
