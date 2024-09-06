# Secret
### What is secret in Swarm?
- Secrets : A secret is a piece of data, such as a password, SSH private key, SSL certificate, or another piece of data that should not be Transprant or stored unencrypted in a Dockerfile.
- Docker Secrets is only available in the Swarm mode, so standalone containers can not use this feature.

### How Swarm Manage the Secrets:
- When a user adds a new secret to a Swarm cluster, this secret is sent to a manager using a TLS connection.
- TLS is a cryptographic protocol
- When we have multiple Managers, RAFT manage the secrets on all the managers.
- In order to make all managers up to date with a new secret, when one manager node receives the secret, it saves it to a Raft store with a 256-bit key
- Containers work on mounted decrypted secrets, which store at /run/secrets/<secret_name> in containers. 

### IMP Commands:
- Understand the Secret Commands
    - `#docker secret --help`
- Ways to Create Secret
    - By file:
        - `#docker secret create <secret_name> <file_name>`
    - By CLI:
        - `#echo “Secret_String” | docker secret create <secret_name> -`
- Inspect the Secret:
    - `#docker secret inspect <secret_name>`
- Example:
    - Create Postgres Service with secrets:
        - `#docker service create - -name <service_name> - -secret <username_secret> - -secret <pass_secret> -e POSTGRES_PASSWORD_FILE=/run/secrects/ <pass_secret> -e POSTGRES_USER_FILE=run/secrects/ <user_secret> <IMAGE>:TAG`

### Managing secret in Docker Compose File:
```
version: "3.1"
services:
  # Service Name Defined as web
  postgresDB:
    # Pull the Image from Repository.
    image: postgres:latest
    # Command to use secrects in 
    secrets:
      # define Secrets name
      - db_username
      - db_password
    environment:
        # Define environment varaibles
        POSTGRES_PASSWORD_FILE: /run/secrets/db_password
        POSTGRES_USER_FILE: /run/secrets/db_username

  centOS:
    image: centos
    deploy:
      replicas: 1
    entrypoint: /bin/sh
    stdin_open: true
    tty: true
    secrets:
      - source: my-secret
secrets:
  db_username:
    file: ./postgres_user.txt
  db_password:
    file: ./postgres_password.txt
  my-secret:
    external: true