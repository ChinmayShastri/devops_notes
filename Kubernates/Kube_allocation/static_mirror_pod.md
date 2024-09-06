# Static and Mirror Pods in Kubernetes

## Explanation

### Static Pods

Static pods are managed directly by the kubelet on a specific node without the intervention of the Kubernetes API server. These pods are useful for applications that need to run on specific nodes or for Kubernetes components themselves.

**Key Points to Remember:**
- **Managed by Kubelet**: Static pods are defined by individual kubelet instances on nodes.
- **Pod Manifest**: Static pod manifests are typically stored in a specific directory on each node (e.g., `/etc/kubernetes/manifests`).
- **No API Server Involvement**: Static pods do not go through the Kubernetes API server.
- **Self-Healing**: If a static pod crashes, the kubelet will restart it automatically.

### Mirror Pods

Mirror pods are representations of static pods in the Kubernetes API server, created automatically by the kubelet. They provide visibility into static pods via standard Kubernetes tools.

**Key Points to Remember:**
- **Visibility**: Mirror pods allow static pods to be visible in the Kubernetes API and through commands like `kubectl get pods`.
- **Read-Only**: Mirror pods cannot be managed or controlled via the Kubernetes API; any changes must be made to the static pod manifest.

## Example

### Static Pod Manifest

Create a static pod manifest and save it to the `/etc/kubernetes/manifests` directory on a node:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: static-web
  labels:
    role: myrole
spec:
  containers:
  - name: web
    image: nginx
    ports:
    - containerPort: 80
```

### Verifying the Static Pod and Mirror Pod
- **On the Node**: Check the static pod is running using the kubelet logs or by examining running containers.
- **In the API Server**: Use `kubectl` to see the mirror pod:
```sh
kubectl get pods -A | grep static-web
```

# Interview Questions and Answers

1. **What is a static pod in Kubernetes?**
   - A static pod is a pod that is managed directly by the kubelet on a specific node without the involvement of the Kubernetes API server.

2. **What is a mirror pod in Kubernetes?**
   - A mirror pod is a read-only representation of a static pod in the Kubernetes API server, created automatically by the kubelet to provide visibility into the static pod.

3. **How are static pods managed in Kubernetes?**
   - Static pods are managed by the kubelet, which monitors a specific directory for pod manifests and ensures that the pods defined in those manifests are running on the node.

4. **Where are static pod manifests typically stored on a node?**
   - Static pod manifests are typically stored in the `/etc/kubernetes/manifests` directory on a node.

5. **Can you control a static pod through the Kubernetes API?**
   - No, static pods cannot be controlled through the Kubernetes API. Any changes to static pods must be made to the pod manifest file on the node.

6. **What are the benefits of using static pods in Kubernetes?**
   - Static pods are useful for running essential system components or applications that need to run on specific nodes, providing a simple and direct way to ensure these applications are always running.

7. **How does the kubelet handle static pods that crash?**
   - The kubelet will automatically restart static pods if they crash, ensuring high availability of the applications running as static pods.

8. **Why are mirror pods created in Kubernetes?**
   - Mirror pods are created to provide visibility into static pods via the Kubernetes API, allowing administrators to see static pods using standard Kubernetes tools.
