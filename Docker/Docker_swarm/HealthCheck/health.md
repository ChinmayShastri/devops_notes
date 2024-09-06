# Health Check in Swarm:
### What is Health Check in Swarm?
- Health-Check define weather the service is working or not, and Docker has inbuild functionality for this.
- Docker health check can be applied in Docker Run Command, Docker File, Docker Service and Docker Stack.

### HealthCheck instruction format:
- `HEALTHCHECK [option] CMD <command>:` The command that sets the container health check.
- HEALTHCHECK Supports following Options:
- `--interval=<interval>:` The time interval between two
health checks. The default value is 30 seconds.
- `--timeout=<interval>:` The timeout for running the health check command. The health check fails if the timeout is exceeded. The default value is 30 seconds.
- `--retries=<number of times>:` The container status is regarded as unhealthy if the health check fails continuously for a specified number of times. The default value is 3.
- `--start-period=<interval>:` The initialization time of application startup. Failed health check during the startup is not counted. The default value is 0 second.
