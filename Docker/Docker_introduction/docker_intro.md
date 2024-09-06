# Basics of Docker Container

### What is Docker?
- Docker is an open-source platform designed to automate the deployment, scaling, and operation of applications using containerization.

### Key Components
- **Docker Engine**: The core of Docker, consisting of:
  - **Docker Daemon**: Runs on the host machine and manages Docker objects.
  - **Docker Client**: The command-line interface that users interact with.
  - **REST API**: Interface for communication between Docker Daemon and Docker Client.
- **Docker Images**: Read-only templates used to create containers. Images are built from a Dockerfile.
- **Docker Containers**: Executable units of software in which application code is packaged along with its dependencies.
- **Dockerfile**: A text document containing instructions to build a Docker image.
- **Docker Hub**: A public registry to store and share Docker images.

### Basic Docker Commands
- `docker --version`: Check Docker version.
- `docker pull <image>`: Download an image from Docker Hub.
- `docker run <image>`: Run a container from an image.
- `docker ps`: List running containers.
- `docker ps -a`: List all the conatiners (running and stopped).
- `docker stop <container>`: Stop a running container.
- `docker rm <container>`: Remove a container.
- `docker rmi <image>`: Remove an image.

## Impotrant Questions and Answers:

1. **What is Docker, and why is it useful?**
   - Docker is an open-source platform that enables developers to automate the deployment, scaling, and operation of applications through containerization. It is useful because it provides a consistent environment for application development, testing, and deployment, making it easier to manage dependencies and version control.

2. **Explain the architecture of Docker.**
   - The architecture of Docker includes:
     - **Docker Engine**: Composed of the Docker Daemon, Docker Client, and REST API.
     - **Docker Daemon**: Runs on the host machine, managing Docker containers, images, networks, and volumes.
     - **Docker Client**: A command-line interface that allows users to interact with Docker Daemon.
     - **REST API**: Allows the Docker Daemon and Docker Client to communicate.
     - **Docker Images**: Templates for creating containers.
     - **Docker Containers**: Instances of Docker images that run applications.

3. **What are Docker images and Docker containers? How do they differ?**
   - **Docker Images**: Read-only templates used to create containers. They include the application code and dependencies.
   - **Docker Containers**: Instances of Docker images that run as isolated processes on the host machine. Containers are lightweight and portable, ensuring consistency across different environments.
   - **Difference**: Images are static, read-only files, while containers are running instances of these images.

4. **What is a Dockerfile, and how is it used?**
   - A Dockerfile is a text document that contains a set of instructions to build a Docker image. It specifies the base image, application code, dependencies, and commands to run the application. Dockerfile is used to automate the image creation process.

5. **Describe the process of creating a Docker container.**
   - The process involves:
     1. Writing a Dockerfile with the necessary instructions.
     2. Building the Docker image using the `docker build` command.
     3. Running the Docker container from the image using the `docker run` command.

6. **How do you list all running containers in Docker?**
   - Use the command `docker ps` to list all running containers.

7. **What command is used to stop a running container?**
   - Use the command `docker stop <container_id>` to stop a running container.

8. **How can you remove a Docker image from your system?**
   - Use the command `docker rmi <image_id>` to remove a Docker image from your system.

9. **What is Docker Hub, and how is it used?**
   - Docker Hub is a public registry where Docker images are stored and shared. Users can download (pull) images from Docker Hub and upload (push) their own images to share with others.

10. **Explain the role of Docker Daemon and Docker Client.**
    - **Docker Daemon**: Runs on the host machine and is responsible for building, running, and managing Docker containers and images.
    - **Docker Client**: A command-line interface that users interact with to execute Docker commands, which are then sent to the Docker Daemon for processing.

