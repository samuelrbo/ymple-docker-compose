![](https://img.shields.io/github/tag/samuelrbo/ymple-docker-compose.svg) ![](https://img.shields.io/github/release/samuelrbo/ymple-docker-compose.svg) ![](https://img.shields.io/github/issues/samuelrbo/ymple-docker-compose.svg) ![](https://img.shields.io/github/forks/samuelrbo/ymple-docker-compose.svg) ![](https://img.shields.io/github/license/samuelrbo/ymple-docker-compose.svg) ![](https://img.shields.io/badge/docker--compose-v3-green.svg)

This repository contains a docker file to the [YMPLE Ecommerce](https://www.ymple.com/en/doc/) project.

# YMPLE Docker container

Here you can find a Dockerfile to create a container with the latest version of YMPLE Ecommerce project.

This repository contains an extra docker-compose file for run YMPLE container with MongoDB dependence and externals volumes.

This docker image contains local MongoDB inspired in [mvertes image](https://github.com/mvertes/docker-alpine-mongo). Thanks for that! =}

## 1. Requirements

- Docker

## 2. Build and run

### 2.1. Build

Pull any MongoDB image and create the MongoDB container.

Inside the project folder run:

```shell
docker build -t ymple:1.0.0 .
```

This will create the YMPLE image for docker: `ymple:1.0.0`

To check if docker image was created run:

```shell
docker images
```

This command will print somwthing like this:

```shell
REPOSITORY  TAG    IMAGE ID      REATED         SIZE
ymple       1.0.0  3c6a5a0ad071  2 minutes ago  90.2MB
```

### 2.2. Run

Run the YMPLE container using the created image and set host port to be mapped to container

```shell
docker run -d --name ymple -p 1338:1338 ymple:1.0.0
```

Check if container is running:

```shell
docker ps
```

This command maybe will print something like this:

```shell
CONTAINER ID  IMAGE        COMMAND                 CREATED         STATUS        PORTS                   NAMES
db4cbcbcd99e  ymple:1.0.0  "docker-entrypoint.s…"  28 seconds ago  Up 6 seconds  0.0.0.0:1338->1338/tcp  ymple
```

**OBS:**

Remember to run a MongoBD container to use it with ymple container. YMPLE uses MongoDB! =}

```shell
docker ps
```

```shell
CONTAINER ID  IMAGE                        COMMAND                 CREATED        STATUS        PORTS                                NAMES
27f712af99e2  ymple:1.0.0                  "docker-entrypoint.s…"  3 minutes ago  Up 2 minutes  0.0.0.0:1338->1338/tcp               ymple
324cbdec9407  mvertes/alpine-mongo:latest  "/root/run.sh mongod…"  3 minutes ago  Up 3 minutes  0.0.0.0:27017->27017/tcp, 28017/tcp  mongodb
```

## 3. Use docker-compose to build and run

For preference use `docker-compose` to build and run YMPLE. This will create the network and the MongoDB container.

This is the easy way to get the YMPLE running.

### 3.1. Build

```sh
docker-compose build
```

### 3.2. Run

```sh
docker-compose up -d
```

## 4. Access

1. To finish intallation access the URL: `http://localhost:1338/install` in yout machine or in your server the host name and the mapped port
2. Access frontend `http://localhost:1338`
3. Access backend `http://localhost:1338/admin` using the login `admin@admin.com` and password `admin`

__That's all folks !__
