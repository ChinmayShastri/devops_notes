# Swarm Networking
## What is Swarm Networking?
- An `Overlay network` is a type of network that allows containers running on different Docker Daemon hosts to communicate with each other securely.
- Overlay Network is allow containers to communicate inside the Single Swarm.

## When you initialize a swarm two new networks are created on that Docker host:
- Ingress: Ingress is an Overlay Network, which handles control and data traffic related to swarm services.
    - If Swarm Service is not connected with user defined Overlay Network, it connect to ingress Network. 
- Bridge Network: Bridge network called `docker_gwbridge`, which connects the individual Docker node to the other node participating in the swarm.
- Docker Swarm publish Services on Some Ports and allow Outer word to access these services. This called ingress Routing mesh. 
- The routing mesh enables each node in the swarm to accept connections on published ports for any service running in the swarm, even if there’s no task running on the node. 

## Ports open to traffic to and from each Docker host participating on an overlay network:
- TCP port 2377 for cluster management communications
- TCP and UDP port 7946 for communication among nodes
- UDP port 4789 for overlay network traffic.

### Note: 
`Before create an overlay network, docker Swarm must be initialised on Node or join it to an existing swarm.`

## Useful commands for swarm networking:
- Create an Overlay Network.
    - `#docker network create -d overlay <network_name>`
- Create Service on user Define Overlay Network
    - `#docker service create --name <Service_name> --network <network_name> -e POSTGRES_PASSWORD=mypassword <Image_name>`
- Create web-service to access the DB and same network
    - `#docker service create --name <service_name> --network <network_name> -p 80:80 <image_name>`
- Verify Service Published Port
    - `#docker service inspect --format="{{json .Endpoint.Spec.Ports}}" <Service_Name>`
- To Check which service is running on which node.
    - `#docker service ps $(docker service ls -q) --filter "desired-state=running" --format "table {{.ID}}\t{{.Name}}\t{{.Node}}"`
