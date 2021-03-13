
CONTAINER_NAME=coursier-launcher

all:
	docker build --tag ${CONTAINER_NAME} .

test:
	docker run -it --rm ${CONTAINER_NAME} --version

test-cem:
	docker run -it --rm ${CONTAINER_NAME} launch fr.janalyse::code-examples-manager:1.0.9

test-lorem:
	docker run -it --rm -p 8080:8080 ${CONTAINER_NAME} launch fr.janalyse::lorem-ipsum-server-akkahttp:1.0.8

test-primes:
	docker run -it --rm -p 8080:8080 -e PRIMES_MAX_COUNT=42 ${CONTAINER_NAME} launch fr.janalyse::primes-server-akkahttp:1.0.2

test-webecho:
	docker run -it --rm -p 8080:8080 ${CONTAINER_NAME} launch fr.janalyse::web-echo:1.1.9

test-spy:
	docker run -it --rm -p 8080:8080 ${CONTAINER_NAME} launch fr.janalyse::spy:1.0.2
