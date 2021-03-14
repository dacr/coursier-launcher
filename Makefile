
CONTAINER_NAME=coursier-launcher

all:
	docker build --tag ${CONTAINER_NAME} .

clean:
	docker volume rm artifacts

# -----------------------------------------------------------------------------------------------------------------------------

volume:
	docker volume create artifacts

# -----------------------------------------------------------------------------------------------------------------------------

test:
	docker run -it --rm ${CONTAINER_NAME} --version

# -----------------------------------------------------------------------------------------------------------------------------

test-version: volume
	docker run -it --rm -v artifacts:/coursier-cache ${CONTAINER_NAME} --version

test-cem: volume
	docker run -it --rm -v artifacts:/coursier-cache ${CONTAINER_NAME} launch fr.janalyse::code-examples-manager:1.0.9

test-ammonite: volume
	docker run -it --rm -v artifacts:/coursier-cache ${CONTAINER_NAME} launch --fork com.lihaoyi:::ammonite:2.3.8 -M ammonite.Main

test-lorem: volume
	docker run -it --rm -v artifacts:/coursier-cache -p 8080:8080 ${CONTAINER_NAME} launch fr.janalyse::lorem-ipsum-server-akkahttp:1.0.8

test-primes: volume
	docker run -it --rm -v artifacts:/coursier-cache -p 8080:8080 -e PRIMES_MAX_COUNT=42 ${CONTAINER_NAME} launch fr.janalyse::primes-server-akkahttp:1.0.3

test-webecho: volume
	docker run -it --rm -v artifacts:/coursier-cache -p 8080:8080 ${CONTAINER_NAME} launch fr.janalyse::web-echo:1.1.9

test-spy: volume
	docker run -it --rm -v artifacts:/coursier-cache -p 8080:8080 ${CONTAINER_NAME} launch fr.janalyse::spy:1.0.2
