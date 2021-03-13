FROM openjdk:15-jdk-alpine
MAINTAINER David Crosson <crosson.david@gmail.com>

ADD https://git.io/coursier-cli /usr/bin/cs
RUN chmod a+rx /usr/bin/cs

ENV COURSIER_USER app
ENV COURSIER_USER_HOME /app
ENV COURSIER_CACHE /coursier-cache

RUN adduser -S -h ${COURSIER_USER_HOME} ${COURSIER_USER}

RUN mkdir -p ${COURSIER_CACHE}

RUN chown -R ${COURSIER_USER}:users ${COURSIER_USER_HOME} ${COURSIER_CACHE}

WORKDIR ${COURSIER_USER_HOME}
USER ${COURSIER_USER}

ENTRYPOINT ["/usr/bin/cs"]
