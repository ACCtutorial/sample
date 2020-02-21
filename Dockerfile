FROM ubuntu:latest

MAINTAINER Balaji Dhakshinamoorthy <balajid@dal.ca>

#install deps for python
RUN apt-get -yqq update
RUN apt-get -yqq install python3-pip python3-dev

# set a directory for the app
WORKDIR /usr/src/app

COPY requirements.txt .

# install dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

# tell the port number the container should expose
EXPOSE 5000

# run the command
CMD ["python3", "./app.py"]
