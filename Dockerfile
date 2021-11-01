FROM openjdk:8-alpine

LABEL maintainer="masoudkf"

RUN apk update
RUN apk add git
RUN apk add apache-ant

WORKDIR /jade
RUN git clone https://github.com/masoudkarimif/jade-copy.git . && \
    ant

ENV CP=""
ENV CLASSPATH=${CP}:.:/jade/dist/jade.jar

WORKDIR /app
CMD javac -d . *.java




