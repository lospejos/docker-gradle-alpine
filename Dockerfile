FROM openjdk:latest
MAINTAINER Takeshi Takizawa <takitake.create@gmail.com>

RUN mkdir /usr/lib/gradle /app

ENV GRADLE_VERSION 3.5
ENV GRADLE_HOME /usr/lib/gradle/gradle-${GRADLE_VERSION}
ENV PATH ${PATH}:${GRADLE_HOME}/bin

WORKDIR /usr/lib/gradle
RUN set -x \
  && apk add --no-cache wget \
  && wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
  && unzip gradle-${GRADLE_VERSION}-bin.zip \
  && rm gradle-${GRADLE_VERSION}-bin.zip \
  && apk del wget

RUN apk update && apk add bash libstdc++ && rm -rf /var/cache/apk/*
