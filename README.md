# Docker sbt

This repository contains an image for interacting with Scala using the `sbt`
tool. This image relies on the sbt image provided by the sbt community, which
you can find [here](https://github.com/sbt/docker-sbt/tree/master), and the
Gilter8 templates generator.

## Build the Image

```sh
sudo docker build -t <image-name> .
```

## Run a Container Using the Built Image

```sh
sudo docker run -it <image-name>
```

## Scala Interactive Console

```sh
sbt console
```

## Build the Hello World sbt Project

This process may take some time because the project's dependencies will be
downloaded and the project will be compiled.

```sh
cd hello-world/
sbt run
```

## A Simple Build Tool

If you want to interact with sbt and explore its full set of instructions, just
call it in the terminal.

```sh
sbt
```

## If container dies...

If container dies because you closed your laptop
or because you kill it as we computer scientist kill process,
you can start the process again.

First find the dead container and take it's ID.

```sh
docker ps -a
```

Now start the container
and it's status will change.

```sh
docker start <container-id>
docker ps -a
```

Finally attach the container with your shell. If you are running on Linux you
should have bash shell, hence the following will work.

```sh
docker exec -it <container-id> /bin/bash
```
