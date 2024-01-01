# docker-compose Cheat Sheet

A collection of useful docker-compose commands for managing containers.

| Command                                | Description |
|----------------------------------------|-|
| `docker-compose build`                 | Builds or rebuilds services. |
| `docker-compose down`                  | Stops and removes containers, networks, volumes, and images created by up. |
| `docker-compose down --remove-orphans` | Stops and removes containers for services not defined in the docker-compose.yml file. |
| `docker-compose down --volumes`        | Stops and removes volumes associated with services. |
| `docker-compose logs`                  | Displays log output from services. |
| `docker-compose pause`                 | Pauses services. |
| `docker-compose ps`                    | Lists containers. |
| `docker-compose restart`               | Restarts services. |
| `docker-compose start`                 | Starts existing containers for a service. |
| `docker-compose stop`                  | Stops running containers without removing them. |
| `docker-compose unpause`               | Unpauses services. |
| `docker-compose up`                    | Builds, creates, starts, and attaches to containers for a service. |
| `docker-compose up -f /home/user/myapp/docker-compose.yml`| Builds, creates, starts, and attaches to containers for a service. |
