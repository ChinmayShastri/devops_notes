# Some Useful commands:
## #docker info
- Check the status of docker and swarm
## #docker swarm init
- Initiate the swarm service 
## #docker swarm join-token <node_name>
- Gives the token of the node.
## #docker swarm join-toke <token_key>
- To join the manager node.
## #docker service create --replicas <no.> <image> <command>
- To create a service with no of replicas.
## #docker service ps <service_name>
- Identify running Container for the Service 
## #docker service ls 
- List all running services in Docker Host docker
## #docker service update <service_name> - -replicas <no.>
- Scale Up the services
## #docker node update - -role manager <node_name>
-  Switch Manager Node in Docker
## #docker stack deploy -c docker-compose.yml visualizer
- Execute Compose file as Stack on Docker Swarm
## #docker stack ls
- List the stacks running.