FROM openjdk:11-jdk-slim
#FROM openjdk:11-jdk-alpine
MAINTAINER David Crosson <crosson.david@gmail.com>

#RUN apk add ncurses

#TODO - ammonite issue with coursier > 2.0.8 - https://github.com/coursier/coursier/issues/1941 keeping release 2.0.8
#ADD https://git.io/coursier-cli /usr/bin/cs
ADD https://github.com/coursier/coursier/releases/download/v2.0.8/cs-x86_64-pc-linux /usr/bin/cs
RUN chmod a+rx /usr/bin/cs

ENV COURSIER_USER app
ENV COURSIER_USER_HOME /app
ENV COURSIER_CACHE /coursier-cache

RUN useradd -m -g users -d ${COURSIER_USER_HOME} ${COURSIER_USER}
#RUN adduser -S -g users -h ${COURSIER_USER_HOME} ${COURSIER_USER}

RUN mkdir -p ${COURSIER_CACHE}

RUN chown -R ${COURSIER_USER}:users ${COURSIER_USER_HOME} ${COURSIER_CACHE}

WORKDIR ${COURSIER_USER_HOME}
USER ${COURSIER_USER}

ENTRYPOINT ["/usr/bin/cs"]
