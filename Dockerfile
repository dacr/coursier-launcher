FROM openjdk:15-jdk-slim
MAINTAINER David Crosson <crosson.david@gmail.com>

ADD https://git.io/coursier-cli /usr/bin/cs
RUN chmod a+rx /usr/bin/cs

ENV COURSIER_USER app
ENV COURSIER_USER_HOME /app
ENV COURSIER_CACHE /coursier-cache

# We use a fixed the user id, it helps to manage user rights on COURSIER_CACHE when volume are used
RUN useradd -m -u 1000 -d ${COURSIER_USER_HOME} ${COURSIER_USER}

RUN mkdir -p ${COURSIER_CACHE}

RUN chown -R ${COURSIER_USER}:${COURSIER_USER} ${COURSIER_USER_HOME} ${COURSIER_CACHE}

WORKDIR ${COURSIER_USER_HOME}
USER ${COURSIER_USER}

ENTRYPOINT ["/usr/bin/cs"]
