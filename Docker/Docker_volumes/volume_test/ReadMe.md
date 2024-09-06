# Example for Persistent Volume

## Conditions
- Provide an example by following these conditions:
  - Create a simple Dockerfile to test volumes.
  - Give different examples for anonymous, named, and bind volumes.


## Answer:
### Using Anonymous Volumes
- `docker build -t volume-test`
- `docker run -d -v /app/data volume-test`

### Using Named Volumes
- `docker volume create my_named_volume`
- `docker run -d -v my_named_volume:/app/data volume-test`

### Using Bind Mounts
- `docker run -d -v /path/on/host:/app/data volume-test`

