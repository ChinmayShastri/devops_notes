# Resource Requests in Kubernetes

Resource requests in Kubernetes specify the minimum amount of CPU and memory that a container needs. These requests help the Kubernetes scheduler decide which node is suitable for the pod. 

## Key Points to Remember

- **Resource Requests**: Minimum resources required by a container.
- **Resource Limits**: Maximum resources a container is allowed to use.
- **CPU Requests**: Measured in CPU units (millicores).
- **Memory Requests**: Measured in bytes (e.g., MiB, GiB).
- **Guaranteed QoS**: Pods with requests equal to limits have guaranteed quality of service.
- **Burstable QoS**: Pods with requests less than limits.
- **Best Effort QoS**: Pods with no requests.

## How It Works

1. **Scheduler Consideration**: The Kubernetes scheduler uses resource requests to decide on which node to place the pod.
2. **Resource Allocation**: Nodes allocate at least the requested amount of resources to the pod.
3. **Quality of Service**: Resource requests and limits help in defining the QoS class of a pod.

### Example Configuration

Resource requests and limits can be defined in the pod's manifest file under the `resources` field for each container.

```yaml
resources:
  requests:
    memory: "64Mi"
    cpu: "250m"
  limits:
    memory: "128Mi"
    cpu: "500m"
```

### Example
### Resource Requests Example

### Pod Manifest with Resource Requests and Limits

Below is an example of a pod manifest file that includes resource requests and limits for a container.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: resource-demo
spec:
  containers:
  - name: resource-container
    image: busybox
    command: ["sh", "-c", "echo Hello Kubernetes! && sleep 3600"]
    resources:
      requests:
        memory: "64Mi"
        cpu: "250m"
      limits:
        memory: "128Mi"
        cpu: "500m"
```
### Explanation
- **requests.cpu**: The container requests 250 millicores (0.25 cores) of CPU.
- **requests.memory**: The container requests 64 MiB of memory.
- **limits.memory**: The container is limited to 128 MiB of memory.
- **limits.cpu**: The container is limited to 500 millicores (0.5 cores) of CPU.

## Applying the Configuration
To apply the configuration, save the above manifest to a file (e.g., resource-demo.yaml) and run:
```sh
kubectl apply -f resource-demo.yaml
```

## Interview Questions and Answers

1. ### What are resource requests in Kubernetes?

- Resource requests specify the minimum amount of CPU and memory that a container needs, helping the Kubernetes scheduler to decide the most appropriate node for the pod.

2. ### How do resource limits differ from resource requests?

- Resource limits define the maximum amount of CPU and memory a container can use, while resource requests specify the minimum amount of resources required by the container.

3. ### How are CPU requests measured in Kubernetes?

- CPU requests are measured in CPU units or millicores. For example, `250m` refers to 250 millicores or 0.25 CPU cores.

4. ### How are memory requests specified in Kubernetes?

- Memory requests are specified in bytes, with common units including MiB (Mebibytes) and GiB (Gibibytes). For example, `64Mi` refers to 64 Mebibytes of memory.

5. ### What is the purpose of specifying resource requests for a container?

- Specifying resource requests helps ensure that a container has the necessary resources to operate effectively, preventing resource contention and improving overall cluster stability.

6. ### How do resource requests and limits affect Quality of Service (QoS) in Kubernetes?

- **Guaranteed QoS**: Pods with requests equal to their limits have guaranteed QoS.
- **Burstable QoS**: Pods with requests less than their limits.
- **Best Effort QoS**: Pods with no resource requests.

7. ### Can you provide an example of a pod configuration with resource requests and limits?

```yaml
resources:
  requests:
    memory: "64Mi"
    cpu: "250m"
  limits:
    memory: "128Mi"
    cpu: "500m"
```