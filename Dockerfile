# syntax=docker/dockerfile:1
FROM python:3
MAINTAINER kubousky

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apt-get update -y
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y musl-dev
RUN apt install zlib1g
RUN apt install zlib1g-dev
# RUN apt-get add --no-cache --virtual .tmp-build-deps gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev
RUN pip install -r /requirements.txt
#RUN apt-get del .tmp-build-deps 

# RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser user
RUN chown -R user:user /vol/
RUN chmod -R 755 /vol/web
USER user