# Coursier launcher container

**coursier-launcher** is an easy to use [coursier][cs] docker container with
artifacts cache easily sharable between applications by using docker volumes.

The typical usage of this container is to start application or web services
by only relying on maven repositories to download just the required files,
it makes it possible to achieve kilobytes deployments size, it accelerates
CI/CD pipelines as we don't have anymore to create dedicated container images,...

## The docker containers

Containers are available on [dockerhub][hub] and automatically updated in
sync with [this github repo][repo]. Dedicated branches are used for the different
jvm release used : `openjdk-8`, `openjdk-11`, `openjdk-15`, `openjdk-16`.
The `master` branch is linked to the `latest` docker tag and will always use
the most recent supported jvm.

## Usage examples
```shell
docker volume create artifacts

CS="docker run -it --rm -v artifacts:/coursier-cache dacr/coursier-launcher"
$CS --version
$CS launch fr.janalyse::code-examples-manager:1.0.9 
$CS launch --fork com.lihaoyi:::ammonite:2.3.8 -M ammonite.Main
$CS launch --fork com.lihaoyi:::ammonite:2.3.8 -M ammonite.Main -- -c 'println("Hello world")'

CSW="docker run -it --rm -p 8080:8080 -v artifacts:/coursier-cache dacr/coursier-launcher"
$CSW launch fr.janalyse::lorem-ipsum-server-akkahttp:1.0.8
$CSW launch fr.janalyse::web-echo:1.1.9
$CSW launch fr.janalyse::spy:1.0.2

CSWP="docker run -it --rm -p 8080:8080 -e PRIMES_MAX_COUNT=42 -v artifacts:/coursier-cache dacr/coursier-launcher"
$CSWP launch fr.janalyse::primes-server-akkahttp:1.0.3
```


[cs]: https://get-coursier.io/
[hub]: https://hub.docker.com/repository/docker/dacr/coursier-launcher/general
[repo]: https://github.com/dacr/coursier-launcher