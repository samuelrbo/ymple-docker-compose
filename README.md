![](https://img.shields.io/github/tag/samuelrbo/ymple-docker-compose.svg) ![](https://img.shields.io/github/release/samuelrbo/ymple-docker-compose.svg) ![](https://img.shields.io/github/issues/samuelrbo/ymple-docker-compose.svg) ![](https://img.shields.io/github/forks/samuelrbo/ymple-docker-compose.svg) ![](https://img.shields.io/github/license/samuelrbo/ymple-docker-compose.svg) ![](https://img.shields.io/badge/docker--compose-v3-green.svg)

This repository contains a docker file to the [YMPLE Ecommerce](https://www.ymple.com/en/doc/) project.

# YMPLE Docker container

Here you can find a Dockerfile to create a container with the latest version of YMPLE Ecommerce project.

This repository contains an extra docker-compose file for run YMPLE container with MongoDB dependence and externals volumes

## 1. Requirements

- Docker

## 2. Build and run

### 2.1 - Build

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
REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
ymple                1.0.0               3c6a5a0ad071        2 minutes ago       90.2MB
```

### 2.2 - Run

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
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
db4cbcbcd99e        ymple:1.0.0         "docker-entrypoint.s…"   28 seconds ago      Up 6 seconds        0.0.0.0:1338->1338/tcp   ymple
```

**OBS:**

Remember to run a MongoBD container to use it with ymple container. YMPLE uses MongoDB! =}

```shell
docker ps
```

```shell
CONTAINER ID        IMAGE              COMMAND                  CREATED             STATUS              PORTS                      NAMES
db4cbcbcd99e        ymple:1.0.0        "docker-entrypoint.s…"   6 minutes ago       Up 5 minutes        0.0.0.0:1338->1338/tcp     ymple
2c730d4a1ce5        mongo              "docker-entrypoint.s…"   9 minutes ago       Up 4 seconds        0.0.0.0:27017->27017/tcp   mongodb
```

## 3. Use docker-compose to build and run

...

**TODO** finish readme file
