# Container Placement : Service Constraints
### How Docker Swarm place containers?
- Docker Swarm automatically try and place your containers to provide maximum resiliency within the service.
- Place the Container on Specific node, for monitoring for application functionality reason.
- One way to Manage Container Placement is `Service Constraints.
- Service constraints are used to control the nodes a service can be assigned to.

### What is service constraints?
- Service Constraints can be added to creation time, or add/ remove at update time.
- By Creation of Hard Coded requirement, container placement fails if not matched.
- Multiple Constraints can be assigned to a single service.
- It supports key or key=value pair

### IMP Commands:
- Create Service on Manager Node Only
    - `#docker service create --constraints node.role==manager <image_name>`
- Add Label on any Node and define Constraints
    - `#docker node update --label-add=region=east-1-d <node_value>`
    - `#docker Service create --constraint=node.labels.region=east-1-d <image_name>`
- Remove Constrains and add new constrains on running service:
    - `#docker service update --constraint-rm <Constraint added on service> --constraint-add <new constraint> <service_name>`