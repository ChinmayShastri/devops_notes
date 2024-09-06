# Docker ARG and ENV Variables

### ARG Variables
- **Description**: ARG variables are used to define build-time variables in a Dockerfile. These variables can be passed to the Docker build process and are not available in the resulting container.
- **Usage**: ARG variables are defined using the `ARG` instruction in a Dockerfile and can be set using the `--build-arg` flag with `docker build`.

### ENV Variables
- **Description**: ENV variables are used to define environment variables that are available at runtime for the application running inside the Docker container.
- **Usage**: ENV variables are defined using the `ENV` instruction in a Dockerfile, can be set using the `-e` flag with `docker run`, or defined in a `.env` file with Docker Compose.

### Differences between ARG and ENV Variables
- **Scope**:
  - **ARG**: Only available during the build process.
  - **ENV**: Available during the runtime of the container.
- **Usage**:
  - **ARG**: Typically used for passing build-time variables such as versions of software.
  - **ENV**: Used for configuration settings that the application inside the container needs at runtime.

## Interview Questions and Answers

1. **What is the purpose of ARG variables in Docker?**
   - ARG variables are used to define build-time variables that are available only during the Docker image build process. They are not accessible in the running container.

2. **How do you define and use an ARG variable in a Dockerfile?**
   - Use the `ARG` instruction to define an ARG variable in a Dockerfile.
   - Example:
     ```Dockerfile
     ARG VERSION=1.0
     FROM alpine:$VERSION
     ```

3. **How do you pass build-time variables to the Docker build process?**
   - Use the `--build-arg` flag with the `docker build` command.
   - Example:
     ```bash
     docker build --build-arg VERSION=2.0 -t my_image .
     ```

4. **What is the purpose of ENV variables in Docker?**
   - ENV variables are used to define environment variables that are available to the application running inside the container at runtime.

5. **How do you define and use an ENV variable in a Dockerfile?**
   - Use the `ENV` instruction to define an ENV variable in a Dockerfile.
   - Example:
     ```Dockerfile
     ENV MY_VAR=my_value
     ```

6. **How can you pass runtime environment variables to a Docker container?**
   - Use the `-e` flag with the `docker run` command.
   - Example:
     ```bash
     docker run -e MY_VAR=my_value my_image
     ```

7. **Can you use ARG and ENV together in a Dockerfile? If so, how?**
   - Yes, you can use ARG to define a build-time variable and then use ENV to set a runtime environment variable using the ARG value.
   - Example:
     ```Dockerfile
     ARG VERSION=1.0
     ENV APP_VERSION=$VERSION
     FROM alpine:$VERSION
     ```

## Summary
- ARG: Build-time only, not available in the running container.
- ENV: Runtime environment, available to the application inside the container.