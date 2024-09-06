# Docker Environment Variables and Security

### Environment Variables in Docker
- **Description**: Environment variables are used to pass configuration information to Docker containers at runtime. They provide a flexible way to configure application behavior without modifying the container image.

### .env File
- **Description**: A `.env` file contains key-value pairs of environment variables. It is used to define environment variables outside of the Dockerfile or command line, making it easier to manage and share configurations.
- **Usage**: Docker Compose automatically loads variables from a `.env` file and makes them available to services defined in the `docker-compose.yml` file.

### Security Best Practices for Docker
- **Least Privilege**: Run containers with the least amount of privileges necessary.
- **Read-Only File Systems**: Use read-only file systems to prevent unauthorized writes.
- **Secrets Management**: Use Docker secrets to manage sensitive information.
- **Regular Updates**: Regularly update Docker and its components to the latest version.
- **Network Segmentation**: Use Docker networks to segment different parts of your application for improved security.

## Interview Questions and Answers

1. **What is the purpose of environment variables in Docker?**
   - Environment variables are used to configure the behavior of applications running inside Docker containers. They allow dynamic configuration without modifying the container image.

2. **How do you pass environment variables to a Docker container?**
   - Environment variables can be passed to a Docker container using the `-e` flag or by using an `.env` file with Docker Compose.
   - Example:
     ```bash
     docker run -e MY_VAR=my_value my_image
     ```

3. **What is a .env file, and how is it used in Docker?**
   - A `.env` file is a text file containing key-value pairs of environment variables. Docker Compose uses the `.env` file to define environment variables for services defined in the `docker-compose.yml` file.
   - Example `.env` file:
     ```
     MY_VAR=my_value
     ANOTHER_VAR=another_value
     ```

4. **Explain how Docker secrets are used to manage sensitive information.**
   - Docker secrets are used to securely manage sensitive information such as passwords, API keys, and certificates. Secrets are stored in Docker's encrypted storage and can be accessed by containers at runtime.
   - Example:
     ```bash
     echo "my_secret" | docker secret create my_secret -
     ```

5. **What are some security best practices for Docker?**
   - **Least Privilege**: Run containers with the minimal required privileges.
   - **Read-Only File Systems**: Use read-only file systems to prevent unauthorized modifications.
   - **Secrets Management**: Use Docker secrets to handle sensitive information securely.
   - **Regular Updates**: Keep Docker and its components updated to the latest versions.
   - **Network Segmentation**: Use Docker networks to isolate different parts of your application.

## Basic Commands and Examples

### Using Environment Variables

- **Passing Environment Variables**
  - **Description**: Pass environment variables to a container.
  - **Command**: `docker run -e <VAR_NAME>=<value> <image>`
  - **Example**:
    ```bash
    docker run -e MY_VAR=my_value my_image
    ```

### Using .env File with Docker Compose

- **.env File Example**
  - **Description**: Define environment variables in a `.env` file.
  - **File**:
    ```
    MY_VAR=my_value
    ANOTHER_VAR=another_value
    ```

- **Docker Compose File Example**
  - **File**: `docker-compose.yml`
    ```yaml
    version: '3.8'

    services:
      web:
        image: my_image
        environment:
          - MY_VAR
          - ANOTHER_VAR
    ```

- **Running Docker Compose with .env File**
  - **Command**: `docker-compose up`
  - **Example**:
    ```bash
    docker-compose up
    ```

### Managing Docker Secrets

- **Creating a Secret**
  - **Description**: Create a Docker secret from a file or standard input.
  - **Command**: `echo "<secret_value>" | docker secret create <secret_name> -`
  - **Example**:
    ```bash
    echo "my_secret" | docker secret create my_secret -
    ```

- **Using a Secret in a Docker Service**
  - **File**: `docker-compose.yml`
    ```yaml
    version: '3.8'

    services:
      web:
        image: my_image
        secrets:
          - my_secret

    secrets:
      my_secret:
        external: true
    ```

- **Deploying with Secrets**
  - **Command**: `docker stack deploy -c docker-compose.yml my_stack`
  - **Example**:
    ```bash
    docker stack deploy -c docker-compose.yml my_stack
    ```

### Security Best Practices

- **Run Containers with Least Privilege**
  - **Command**: `docker run --user <user_id> <image>`
  - **Example**:
    ```bash
    docker run --user 1001 my_image
    ```

- **Use Read-Only File Systems**
  - **Command**: `docker run --read-only <image>`
  - **Example**:
    ```bash
    docker run --read-only my_image
    ```

- **Regularly Update Docker**
  - **Command**: Update Docker using the package manager for your OS.
  - **Example**:
    ```bash
    sudo apt-get update && sudo apt-get upgrade docker-ce
    ```

- **Network Segmentation**
  - **Command**: `docker network create <network_name>`
  - **Example**:
    ```bash
    docker network create my_network
    docker run --network my_network my_image
    ```
