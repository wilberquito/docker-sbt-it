# Docker sbt

This repository contains an image for interacting with Scala using the `sbt`
tool. This image relies on the sbt image provided by the sbt community, which
you can find [here](https://github.com/sbt/docker-sbt/tree/master), and the
Gilter8 templates generator.

## Build the Image

```sh
sudo docker build --build-arg HOST_UID=$(id -u) --tag wilberquito/docker-sbt-it .  --no-cache
```

## Run a Container Using the Built Image

```sh
sudo docker run -it wilberquito/docker-sbt-it
```

## Track Progress Inside the Projects Folder

```sh
sudo docker run -v ./projects:/home/nonroot/scala/projects -it wilberquito/docker-sbt-it
```

## A Simple Build Tool

If you want to interact with sbt and explore its full set of instructions, just
call it in the terminal.

```sh
sbt
```

## Scala Interactive Console

```sh
sbt console
```

## Create a dummy sbt project using g8 template scala generator

```sh
cd projects/
sbt new scala/scala-seed.g8 --name=hello-world
```

## Build the Hello World sbt Project

This process may take some time because the project's dependencies will be
downloaded and the project will be compiled.

```sh
cd hello-world/
sbt run
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
