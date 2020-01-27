# base image 
FROM python:3
# File Author / Maintainer
MAINTAINER Peris

#add project files to the usr/src/app folder
ADD . /PycharmProjects/sacco/
#set directoty where CMD will execute 
WORKDIR /PycharmProjects/sacco/
COPY requirements.txt ./
# Get pip to download and install requirements:
RUN pip install --no-cache-dir -r requirements.txt
# Expose ports
EXPOSE 8000
# default command to execute    
CMD exec gunicorn djangoapp.wsgi:application --bind 0.0.0.0:8000 --workers 3

