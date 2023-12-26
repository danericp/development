# docker Cheat Sheet

A collection of useful docker commands for managing containers.

## Table of Contents

- [container](#container)
- [image](#image)
- [network](#network)
- [node](#node)
- [service](#service)
- [system](#system)

---

## Container

| Command | Description |
|-|-|
| `docker container create --help` |  |
| `docker container disconnect TAB COMPLETION` |  |
| `docker container exec -it mysql bash` |  |
| `docker container exec -it new_nginx ping my_nginx` |  |

| Command | Description |
|-|-|
| `docker container inspect` | |
| `docker container inspect --format '{{ .NetworkSettings.IPAddress }}' webhost` | |
| `docker container inspect --format='{{range .NetworkSettings.Networks}}{{println .IPAddress}}{{end}}' host-docker-centos7` | |
| `docker container inspect mysql` | |
| `docker container inspect TAB COMPLETION` | |

| Command | Description |
|-|-|
| `docker container logs db` | |
| `docker container logs webhost` | |

| Command | Description |
|-|-|
| `docker container ls` | |
| `docker container ls --format='{{json .Names}}'` | |
| `docker container ls --format='{{json .Image}} {{json .Names}} {{json .Status}}'` | |
| `docker container ls -a` | |

| Command | Description |
|-|-|
| `docker container port webhost` | |
| `docker container prune` | |
| `docker container prune -a` | |

| Command | Description |
|-|-|
| `docker container rm` | |
| `docker container rm -f 63f` | |
| `docker container rm -f TAB COMPLETION` | |
| `docker container rm 63f 690 ode` | |

| Command | Description |
|-|-|
| `docker container run` | |
| `docker container run -d --name my_nginx --network my_app_net nginx` | |
| `docker container run -d --name my_ubuntu -p 22:22 --network macnet ubuntu:14.04 ubuntu` | |
| `docker container run -d --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True -v mysql-db:/var/lib/mysql mysql` | |
| `docker container run -d --name mysql -e MYSQL_RANDOM_ROOT_PASSWORD=true mysql` | |
| `docker container run -d --name new_nginx --network my_app_net nginx` | |
| `docker container run -d --name nginx nginx` | |
| `docker container run -d --name proxy -p 80:80 nginx` | |
| `docker container run -d --name webserver -p 8080:80 httpd` | |
| `docker container run -d --net dude --net-alias search elasticsearch:2` | |
| `docker container run -d -p 3306:3306 --name db -e MYSQL_RANDOM_ROOT_PASSWORD=yes MYSQL_RANDOM_ROOT_PASSWORD` | |
| `docker container run -help` | |
| `docker container run -it alpine bash` | |
| `docker container run -it alpine sh` | |
| `docker container run -it --name proxy nginx bash` | |
| `docker container run -it --name ubuntu ubuntu` | |
| `docker container run -p 80:80 --name webhost -d nginx` | |
| `docker container run --publish 80:80 --detach --name webhost nginx` | |
| `docker container run --publish 80:80 --detach nginx` | |
| `docker container run --publish 80:80 nginx` | |
| `docker container run --rm -it centos:7 bash` | |
| `docker container run --rm -it ubuntu:14.04 bash` | |
| `docker container run --rm --net dude alpine nslookup search` | |
| `docker container run --rm --net dude centos curl -s search:9200` | |

| Command | Description |
|-|-|
| `docker container start --help` | |
| `docker container start -ai ubuntu` | |

| Command | Description |
|-|-|
| `docker container stats` | |
| `docker container stats --help` | |

| Command | Description |
|-|-|
| `docker container stop 690` | |
| `docker container stop TAB COMPLETION` | |

| Command | Description |
|-|-|
| `docker container top` | |
| `docker container top mysql` | |
| `docker container top nginx` | |
| `docker container top webhost` | |

## Image

| Command | Description |
|-|-|
| `docker build -t <Image Name> <Dockerfile Location>` | |
| `docker build -t webserver ./nginx/image/.` | |
| `docker build -t webserver:v2 ./nginx/image/.` | |
| `docker build -t <Image Name> -f <Dockerfile Location> <Reference Point>` | |
| `docker build -t webserver -f ./nginx/image/Dockerfile .` | |

| Command | Description |
|-|-|
| `docker image ls` | |
| `docker image ls -a` | |
| `docker image pull nginx` | |
| `docker image pull nginx:1.11.9` | |
| `docker image pull nginx:latest` | |
| `docker image pull nginx:mainline` | |
| `docker image pull nginx:alpine` | |
| `docker image push daneric/nginx` | |
| `docker image prune` | |

| Command | Description |
|-|-|
| `docker image tag --help` | |
| `docker image tag <image> <property>:<value>` | |
| `docker image tag hello-world 127.0.0.1:5000/hello-world` | |
| `docker image tag nginx 127.0.0.1:5000/nginx` | |
| `docker image tag testnode bretfisher/testing-node` | |

## Network

| Command | Description |
|-|-|
| `docker network --help` | |

| Command | Description |
|-|-|
| `docker network create --driver overlay mydrupal` | |
| `docker network create --driver bridge` | |
| `docker network create --help` | |
| `docker network create -d macvlan --subnet 192.168.1.0/24 --gateway 192.168.1.1 --ip-range 192.168.1.253/32 -o parent=eth0 custommacvlan` | |
| `docker network create dude` | |
| `docker network create my_app_net` | |

| Command | Description |
|-|-|
| `docker network connect my_app` | |
| `docker network connect my_app nginx` | |

| Command | Description |
|-|-|
| `docker network disconnect my_app` | |
| `docker network disconnect my_app nginx` | |

| Command | Description |
|-|-|
| `docker network inspect bridge` | |
| `docker network inspect my_app_net` | |
| `docker network inspect my_app_net --format "{{.Name}}"` | |
| `docker network inspect my_app_net --format "{{(index .IPAM.Config 0).Gateway}}"` | |
| `docker network inspect TAB COMPLETION` | |

| Command | Description |
|-|-|
| `docker network ls` | |
| `docker network ls -a` | |

## Node

| Command | Description |
|-|-|
| `docker node --help` | |
| `docker node ls` | |
| `docker node ps` | |
| `docker node ps node2` | |
| `docker node update --role manager node2` | |

## Service

| Command | Description |
|-|-|
| `docker service --help` | |

| Command | Description |
|-|-|
| `docker service create --name drupal --network mydrupal -p 80:80 drupal` | |
| `docker service create --name psql --netowrk mydrupal -e POSTGRES_PASSWORD=mypass postgres` | |
| `docker service create --replicas 3 alpine ping 8.8.8.8` | |
| `docker service create alpine ping 8.8.8.8` | |

| Command | Description |
|-|-|
| `docker service inspect drupal` | |

| Command | Description |
|-|-|
| `docker service ls` | |
| `docker service ls -a` | |

| Command | Description |
|-|-|
| `docker service ps drupal` | |
| `docker service ps frosty_newton` | |
| `docker service ps psql` | |
| `docker service ps sleepy_brown` | |

| Command | Description |
|-|-|
| `docker service rm frosty_newton` | |

| Command | Description |
|-|-|
| `docker service update --help` | |
| `docker service update TAB COMPLETION --replicas 3` | |

## Swarm

| Command | Description |
|-|-|
| `docker swarm --help` | |
| `docker swarm init` | |
| `docker swarm init --advertise-addr TAB COMPLETION` | |
| `docker swarm join-token manager` | |

## System

| Command | Description |
|-|-|
| `docker system df` | |
| `docker system prune` | |
| `docker system prune -a` | |
