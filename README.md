# coursier-launcher container

**coursier-launcher** is an easy to use [coursier][cs] docker container with
artifacts cache easily sharable between application by using docker volumes.

The typical usage of this container is to start application or web services
by only relying on maven repositories to download only the required files,
it makes it possible to achieve kilobytes deployments size, it accelerates
CI/CD pipelines has we don't have to create dedicated container images, ...

Typical usage examples :
```shell
$ docker volume create artifacts
$ CS="docker run -it --rm -v artifacts:/coursier-cache dacr/coursier-launcher"
$ $CS --version
$ $CS launch fr.janalyse::lorem-ipsum-server-akkahttp:1.0.8
$ $CS launch fr.janalyse::code-examples-manager:1.0.9 
$ $CS launch com.lihaoyi:ammonite_2.13.3:2.3.8 -M ammonite.Main
```


[cs]: https://get-coursier.io/
