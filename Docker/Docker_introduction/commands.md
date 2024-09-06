# Useful Docker Commands

## Managing Images & Containers

### Listing Images
- **Description**: List all images on the local machine.
- **Command**: `docker images`
- **Example**: 
```
  docker images
```
### Listing Containers
- **Description**: List all running containers.
- **Command**: `docker ps`
- **Example**:
```bash
docker ps
```
- **Description**: List all containers, including stopped ones.
- **Command**: `docker ps -a`
- **Example**:
```bash
docker ps -a
```

### Stopping a Container
- **Description**: Stop a running container.
- **Command**: `docker stop <container_id>`
- **Example**:
```bash
docker stop my_container
```

### Restarting a Container
- **Description**: Restart a stopped container.
- **Command**: `docker restart <container_id>`
- **Example**:
```bash
docker restart my_container
```
### Attaching and Detaching Container
Running a Container in Detached Mode
- **Description**: Run a container in the background.
- **Command**: `docker run -d <image>`
- **Example**:
```bash
docker run -d nginx
```
### Attaching to a Running Container
- **Description**: Attach to an already running container.
- **Command**: `docker attach <container_id>`
- **Example**:
```bash
docker attach my_container
```
### Entering Interactive Mode
Entering a Running Container
- **Description**: Access a running container in interactive mode.
- **Command**: `docker exec -it <container_id> /bin/bash`
- **Example**:
```bash
docker exec -it my_container /bin/
```
### Deleting Images & Containers
Deleting a Container
- **Description**: Remove a stopped container.
- **Command**: `docker rm <container_id>`
- **Example**:
```bash
docker rm my_container
```
### Deleting an Image
- **Description**: Remove an image from the local machine.
- **Command**: `docker rmi <image_id>`
- **Example**:
```bash
docker rmi nginx
```
### Removing Stopped Containers Automatically
Removing All Stopped Containers
- **Description**: Automatically remove all stopped containers.
- **Command**: `docker container prune`
- **Example**:
```bash
docker container prune
```
### Copying Files Into and From Container
Copying a File into a Container
- **Description**: Copy files from the local machine to a container.
- **Command**: `docker cp <local_path> <container_id>:<container_path>`
- **Example**:
```bash
docker cp myfile.txt my_container:/myfile.txt
```
### Copying a File from a Container
- **Description**: Copy files from a container to the local machine.
- **Command**: `docker cp <container_id>:<container_path> <local_path>`
- **Example**:
```bash
docker cp my_container:/myfile.txt myfile.txt
```
### Naming and Tagging Containers and Images
Naming a Container
- **Description**: Assign a name to a container at runtime.
- **Command**: `docker run --name <container_name> <image>`
- **Example**:
```bash
docker run --name my_nginx nginx
```
### Tagging an Image
- **Description**: Assign a tag to an image.
- **Command**: `docker tag <image_id> <repository>:<tag>`
- **Example**:
```bash
docker tag nginx myrepo/nginx:v1
```
### Pushing & Pulling Images to/from Docker Hub
Pushing an Image to Docker Hub
- **Description**: Upload a local image to Docker Hub.
- **Command**: `docker push <repository>:<tag>`
- **Example**:
```bash
docker push myrepo/nginx:v1
```
### Pulling an Image from Docker Hub
- **Description**: Download an image from Docker Hub.
- **Command**: `docker pull <repository>:<tag>`
- **Example**:
```bash
docker pull nginx
```