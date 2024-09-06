# Example: Multi-stage Dockerfile for a Go Application

### Dockerfile:
```Dockerfile
# Stage 1: Build the application
FROM golang:1.18-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy the Go module files and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application files
COPY . .

# Build the Go application
RUN go build -o myapp

# Stage 2: Create the final runtime image
FROM alpine:latest

# Set the working directory in the final image
WORKDIR /root/

# Copy the compiled application from the builder stage
COPY --from=builder /app/myapp .

# Run the application
CMD ["./myapp"]
```

### `Docker Commands` :-
```
Build the Docker Image:
docker build -t my-go-app:latest .
Run the Container:
docker run -d my-go-app:latest
Check the Running Application:
docker logs <container_id>
Remove Intermediate Containers:
docker system prune -f
```
---
# Explanation of Multi-stage Dockerfile Example

### 1. `FROM golang:1.18-alpine AS builder`
This line specifies the base image for the build stage. The `golang:1.18-alpine` image is a lightweight image with Go installed, suitable for building Go applications. The `AS builder` syntax names this stage "builder," allowing it to be referenced in later stages.

### 2. `WORKDIR /app`
The `WORKDIR` instruction sets the working directory inside the container to `/app`. All subsequent commands will be executed relative to this directory.

### 3. `COPY go.mod go.sum ./`
This command copies the `go.mod` and `go.sum` files into the container. These files are used by Go to manage dependencies. By copying them first, Docker can cache the result of the dependency download step if the dependencies do not change.

### 4. `RUN go mod download`
This command downloads the Go dependencies specified in the `go.mod` and `go.sum` files. Running this step early in the Dockerfile allows Docker to cache the dependencies, speeding up future builds if the dependencies do not change.

### 5. `COPY . .`
This command copies the entire application source code into the container, so the Go application can be built. It assumes the source code is in the same directory as the Dockerfile.

### 6. `RUN go build -o myapp`
This command builds the Go application and outputs an executable file named `myapp` into the `/app` directory. This file will be copied into the final image in the next stage.

### 7. `FROM alpine:latest`
This line starts a new stage using the `alpine:latest` image. Alpine is a minimal Linux distribution that is well-suited for production environments due to its small size.

### 8. `WORKDIR /root/`
This sets the working directory for the final image to `/root/`, where the compiled application will be placed.

### 9. `COPY --from=builder /app/myapp .`
This is a key part of the multi-stage build. It copies the `myapp` executable from the `builder` stage (the previous stage) to the current stage's working directory. This way, only the compiled binary is included in the final image, making it much smaller.

### 10. `CMD ["./myapp"]`
This specifies the default command to run when the container starts. In this case, it runs the `myapp` executable.

## Summary
This example demonstrates a typical use of multi-stage builds in Docker to optimize the size of a Go application image. The first stage builds the application, and the second stage creates a minimal runtime environment using the small Alpine Linux image. This approach reduces the final image size while keeping the build process clean and efficient.