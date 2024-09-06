# Monitoring Container Resources in Kubernetes: Probes

Kubernetes provides mechanisms to monitor the health and status of containers through probes. The main types of probes are:

1. **Liveness Probe**: Determines if a container is running. If the liveness probe fails, Kubernetes kills the container and restarts it.
2. **Readiness Probe**: Indicates if a container is ready to accept traffic. If the readiness probe fails, the endpoints controller removes the pod’s IP address from the endpoints of all services that match the pod.
3. **Startup Probe**: Used to check if the application within the container has started. If the startup probe fails, Kubernetes kills the container and restarts it. This probe is designed for applications with long startup times.

## Key Points to Remember

- **Liveness Probe**: Ensures the container is still running.
- **Readiness Probe**: Ensures the container is ready to accept requests.
- **Startup Probe**: Ensures the container has started successfully.
- **Probe Methods**: HTTP request, TCP socket, or executing a command.
- **Probe Configuration**: Set initial delay, period, timeout, success threshold, and failure threshold.

### How Probes Work

- **HTTP Probes**: Kubernetes sends an HTTP GET request to the specified endpoint.
- **TCP Probes**: Kubernetes attempts to open a TCP connection to the specified port.
- **Exec Probes**: Kubernetes executes a specified command in the container.

# Example: Configuring Probes in a Pod

## Pod Manifest with Liveness, Readiness, and Startup Probes

Below is an example of a pod manifest file that includes configurations for liveness, readiness, and startup probes.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: probe-demo
spec:
  containers:
  - name: probe-container
    image: busybox
    args:
    - /bin/sh
    - -c
    - "while true; do echo Hello Kubernetes!; sleep 10; done"
    livenessProbe:
      httpGet:
        path: /healthz
        port: 8080
      initialDelaySeconds: 5
      periodSeconds: 5
    readinessProbe:
      httpGet:
        path: /ready
        port: 8080
      initialDelaySeconds: 5
      periodSeconds: 5
    startupProbe:
      httpGet:
        path: /start
        port: 8080
      initialDelaySeconds: 5
      periodSeconds: 5
```
### Applying the Configuration
To apply the configuration, save the above manifest to a file (e.g., `probe-demo.yaml`) and run:
```sh
kubectl apply -f probe-demo.yaml
```

### Explanation
- **livenessProbe**: Checks the /healthz endpoint on port 8080 every 5 seconds after an initial delay of 5 seconds.
- **readinessProbe**: Checks the /ready endpoint on port 8080 every 5 seconds after an initial delay of 5 seconds.
- **startupProbe**: Checks the /start endpoint on port 8080 every 5 seconds after an initial delay of 5 seconds.


# Interview Questions and Answers

1. ### What is a liveness probe in Kubernetes?

- A liveness probe checks if a container is running. If the liveness probe fails, Kubernetes restarts the container.

2. ### What is a readiness probe in Kubernetes?

- A readiness probe checks if a container is ready to accept traffic. If the readiness probe fails, the container is removed from the service endpoints.

3. ### What is a startup probe in Kubernetes?

- A startup probe checks if the application within the container has started. It is useful for applications with long startup times.

4. ### What methods can be used for configuring probes in Kubernetes?

- Probes can be configured using HTTP requests, TCP sockets, or executing a command.

5. ### How do you configure a liveness probe in a pod manifest?

- Example configuration for a liveness probe:

```yaml
livenessProbe:
  httpGet:
    path: /healthz
    port: 8080
  initialDelaySeconds: 5
  periodSeconds: 5
```

6. ### Why would you use a startup probe instead of a liveness probe?
- A startup probe is used for applications with long startup times to ensure they have started correctly before checking their liveness.

7. ### Can you configure multiple probes for a single container?
- Yes, you can configure liveness, readiness, and startup probes for a single container to monitor its health and status comprehensively.

8. ### What happens if a readiness probe fails?
- If a readiness probe fails, the container is removed from the service endpoints, meaning it will not receive any traffic until it passes the readiness check again.