# Docker Swarm
### What is Docker Swarm?
- The cluster management and orchestration tool for Docker Engine.
- Orchestrtion is management of Containers.
- Swarm takes multiple Docker Engines running on different hosts and lets you use them together.

### Docker Swarm architecture:
- It has Two Type of Nodes Master(Manager) and Worker.
- Every cluster has one manager node designated as the leader.
- It uses Raft algorithm for high availibility.
- Algorithm is designed to achieve fault tolerance in distributed systems.

### How Raft algorithm works?
- It consists of multiple nodes with three roles: leader, follower, or candidate.
- There is one leader at a time, and followers replicate the leader's actions.
- Leader Election: Algorithm starts with all nodes in the follower state.
    - If a follower doesn't receive communication from a leader for a certain period (election timeout), it transitions to the candidate state and requests votes from other nodes to become the leader.
    - If a candidate receives votes from the majority of the nodes, it becomes the leader.
- Handling Failures: 
    - If a leader fails, a new leader is elected through the election process.
    - Nodes can detect inconsistencies and missing entries in their logs and update them by replicating the logs from the leader.

### Benefits:
- Task Scheduling  
- Load Balancing  
- Rolling Updates   
- Security.

### Terminologies in Swarm:
- A swarm consists of multiple Docker hosts which run in swarm mode and act as managers (to manage membership and delegation) and workers (which run swarm services).  
- Host : Docker host can be a manager, a worker, or perform both roles.  
- Service : A service is a defination of its optimal state (number of replicas, network and storage resources available to it, ports the service exposes to the outside world, and more).  
- Docker Swarm :Docker Swarm maintains the Service Desired State. For instance, if a worker node becomes unavailable, Docker schedules that node’s tasks on other nodes.  
- Task : Task is a running container which is part of a swarm service and managed by a swarm manager.  
- Nodes : A node is an instance of the Docker engine participating in the swarm.  
    - Docker nodes can be single machine or distributed across multiple physical and cloud machines.

### How Swarm works?
- To deploy an application to a swarm, you submit a service definition to a manager node. The manager node dispatches units of work called tasks to worker nodes.  
- Manager nodes: Maintains the desired state of the swarm. Manager nodes elect a single leader to conduct orchestration tasks.  
- Worker nodes: Receive and execute tasks dispatched from manager nodes.  
- Service : A service is the definition of the tasks to execute on the manager or worker nodes.  
- Task : A task carries a Docker container and the commands to run inside the container.  
    - Once a task is assigned to a node, it cannot move to another node. It can only run on the assigned node or fail.  
- Load Balancing : It uses ingress load balancing to expose the services you want to make available externally to the swarm.  
- External components, such as cloud load balancers, can access the service on the Published Port of any node in the cluster whether or not the node is currently running the task for the service.  
- All nodes in the swarm route ingress connections to a running task instance.  
