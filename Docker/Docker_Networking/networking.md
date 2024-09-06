# Docker Networking

### Container to Local Host Communication

- **Description**: This allows Docker containers to communicate with services running on the host machine.
- **Host Alias**: In Docker for Windows and Docker for Mac, `host.docker.internal` can be used to access the host from within a container.

### Container to Container Communication

- **Description**: Docker containers can communicate with each other using Docker networks.
- **Default Bridge Network**: Containers on the same bridge network can communicate using container names as hostnames.
- **User-Defined Bridge Network**: Provides better isolation and control over container communication.

## Interview Questions and Answers

1. **How can a Docker container communicate with the local host?**
   - On Docker for Windows and Docker for Mac, use `host.docker.internal` to access the host machine from within a container.

2. **What is the default bridge network in Docker?**
   - The default bridge network is a network that Docker creates automatically. Containers on this network can communicate using IP addresses but not by container names.

3. **How do you enable container-to-container communication in Docker?**
   - By using Docker networks. Containers on the same user-defined bridge network can communicate using their names as hostnames.

4. **What are the advantages of a user-defined bridge network over the default bridge network?**
   - Containers can communicate using names as hostnames, better isolation, and more control over network configurations.

## For Sample dockerfile, follow bleow steps:

### Build and Run the Docker Image

- docker build -t local-communication .
- docker run local-communication


### Container to Container Communication
- Create a Docker Network
```
docker network create my_network
```
- Run Two Containers on the Same Network
```
docker run -d --name container1 --network my_network ubuntu
docker run -d --name container2 --network my_network ubuntu
docker exec -it container1 ping container2
```