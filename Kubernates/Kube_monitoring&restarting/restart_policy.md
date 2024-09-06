# Pod Restart Policies in Kubernetes

Kubernetes provides different restart policies to control the behavior of pods when containers within them fail. The restart policy is defined at the pod level and applies to all containers within the pod.

## Types of Restart Policies

1. **Always**: The container will be restarted regardless of the reason it was terminated. This is the default restart policy.
2. **OnFailure**: The container will be restarted only if it exits with a non-zero exit status (i.e., it fails).
3. **Never**: The container will not be restarted regardless of its exit status.

### Key Points to Remember

- **Restart Policies**: Determine how Kubernetes should handle container failures.
- **Always**: Default policy; restarts containers regardless of exit status.
- **OnFailure**: Restarts containers only if they fail.
- **Never**: Does not restart containers after they exit.

### Use Cases

- **Always**: Suitable for long-running services.
- **OnFailure**: Suitable for batch jobs where you want to retry only on failure.
- **Never**: Suitable for tasks that should not be retried once completed, regardless of success or failure.

# Example: Configuring Pod Restart Policies

## Pod Manifest with Different Restart Policies

### Always Restart Policy

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: always-restart-pod
spec:
  containers:
  - name: always-restart-container
    image: busybox
    command: ["sh", "-c", "echo Hello Kubernetes! && sleep 3600"]
  restartPolicy: Always
```

### OnFailure Restart Policy

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: onfailure-restart-pod
spec:
  containers:
  - name: onfailure-restart-container
    image: busybox
    command: ["sh", "-c", "exit 1"]
  restartPolicy: OnFailure
```

### Never Restart Policy
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: never-restart-pod
spec:
  containers:
  - name: never-restart-container
    image: busybox
    command: ["sh", "-c", "echo Hello Kubernetes! && exit 0"]
  restartPolicy: Never
```
### Applying the Configuration
To apply the configurations, save each manifest to a file (e.g., `always-restart-pod.yaml`, `onfailure-restart-pod.yaml`, `never-restart-pod.yaml`) and run:
```sh
kubectl apply -f always-restart-pod.yaml
kubectl apply -f onfailure-restart-pod.yaml
kubectl apply -f never-restart-pod.yaml
```
### Explanation
- **Always Restart Policy**: The container will be restarted regardless of its exit status.
- **OnFailure Restart Policy**: The container will be restarted only if it exits with a non-zero exit status.
- **Never Restart Policy**: The container will not be restarted regardless of its exit status.


# Interview Questions and Answers

1. ### What are the different types of restart policies in Kubernetes?

- The different types of restart policies in Kubernetes are Always, OnFailure, and Never.

2. ### Which restart policy is the default in Kubernetes?

- The default restart policy in Kubernetes is Always.

3. ### When would you use the OnFailure restart policy?

- The OnFailure restart policy is used for batch jobs where you want to retry the container execution only if it fails.

4. ### How do you specify a restart policy in a pod's manifest?

- You specify a restart policy in a pod's manifest under the `restartPolicy` field, like this:

```yaml
restartPolicy: OnFailure
```
5. ### What happens if a pod with the Never restart policy has a container that fails?
- If a pod with the Never restart policy has a container that fails, the container will not be restarted.

6. ### Can you configure different restart policies for individual containers within a single pod?
- No, restart policies are defined at the pod level and apply to all containers within the pod.

7. ### Why might you choose the Always restart policy for a long-running service?
- The Always restart policy ensures that the service remains available by restarting the container whenever it terminates, regardless of the exit status.

8. ### What is a suitable use case for the Never restart policy?
- The Never restart policy is suitable for tasks that should not be retried once completed, regardless of whether they succeeded or failed.