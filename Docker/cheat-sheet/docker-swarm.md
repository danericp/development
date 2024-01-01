# Docker Swarm Cheat Sheet

A collection of useful docker-compose commands for managing containers.

| Command                                | Description |
|----------------------------------------|-|
| `docker service create --replicas <number_of_replicas> --name <service_name> <image_name>` | Create a Service |
| `docker service inspect <service_name>` | Inspect Service |
| `docker service ls` | List Services |
| `docker service rm <service_name>` | Remove a Service |
| `docker service scale <service_name>=<number_of_replicas>` | Scale a Service |
| `docker service update --image <new_image_name> <service_name>` | Update a Service |
| `docker node ls` | Listing Nodes |
| `docker swarm init` | Initialize a Swarm |
| `docker swarm join --token <worker-token> <manager-ip>:<manager-port>` | Join as a Worker |
| `docker swarm join-token manager` | Join as a Manager |
| `docker swarm leave` | Remove a Node from Swarm |
