From alpine:latest
MAINTAINER leafney "babycoolzx@163.com"

RUN echo "http://dl-4.alpinelinux.org/alpine/v3.4/main" >> /etc/apk/repositories && \
	echo "http://dl-4.alpinelinux.org/alpine/v3.4/community" >> /etc/apk/repositories

# application folder
ENV APP_DIR /webapp

# update source 
RUN apk upgrade && \
	apk update && \
	apk add python py-pip py-flask py-gunicorn nginx supervisor && \
	mkdir -p /run/nginx && \
	mkdir -p ${APP_DIR}/web && \
	mkdir -p ${APP_DIR}/conf && \
	mkdir -p ${APP_DIR}/log && \
	rm -rf /var/cache/apk/* && \
	echo "files = /webapp/conf/*.ini" >> /etc/supervisord.conf

# copy config files
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./web ${APP_DIR}/web
COPY ./gunicorn.conf ${APP_DIR}/conf/gunicorn.conf
COPY ./supervisor.ini ${APP_DIR}/conf/supervisor.ini

# VOLUME [${APP_DIR}]

EXPOSE 80

CMD ["supervisord", "-c", "/etc/supervisord.conf"]