# Stack in Swarm
### What is Stack?
- Stack: Stack is a group of interrelated services that share dependencies, and can be orchestrated and scaled together.
- A single stack is capable of defining and coordinating the functionality of an entire application.
- Complex Application may have multiple Stacks as well.
- Docker Stack uses Compose's YAML format and complements the Swarm-specific properties for service deployments.
    - File Name could be like docker-stack.yml
- A single container running in this Service is called Task. So Single Service can execute multiple Tasks.

### IMP commands:
- Deploy the Service in Docker Swarm
    - `#docker stack deploy -c docker-compose.yml <stack_name>`
- Verify Service
    - `#docker service ls`
- List Stack name
    - `#docker stack services <stack_name>`
- List of stack:
    - `#docker swarm ls`
- List of Services running in the Stack:
    - `#docker stack ps <stack_name>`
- List of Serices/Replicas running in the in Stack:
    - `#docker service <stack_name>`

