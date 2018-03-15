From alpine:3.7
MAINTAINER leafney "babycoolzx@126.com"

# In China used
# RUN echo "http://dl-4.alpinelinux.org/alpine/v3.7/main" >> /etc/apk/repositories && \
# 	echo "http://dl-4.alpinelinux.org/alpine/v3.7/community" >> /etc/apk/repositories

# application folder
ENV APP_DIR /app

# update source
RUN apk update && \
	apk add python python3 python3-dev supervisor && \
	pip3 install --upgrade pip && \
	pip3 install flask gunicorn && \
	mkdir -p ${APP_DIR}/web && \
	mkdir -p ${APP_DIR}/conf && \
	mkdir -p ${APP_DIR}/logs && \
	rm -rf /var/cache/apk/* && \
	echo "files = ${APP_DIR}/conf/*.ini" >> /etc/supervisord.conf

# copy config files
COPY ./app ${APP_DIR}

VOLUME ["${APP_DIR}"]

EXPOSE 5000

CMD ["supervisord", "-c", "/etc/supervisord.conf"]