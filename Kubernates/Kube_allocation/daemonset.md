# DaemonSet in Kubernetes

## Explanation

A DaemonSet ensures that all (or some) nodes run a copy of a pod. As nodes are added to the cluster, pods are added to them. As nodes are removed from the cluster, those pods are garbage collected. Deleting a DaemonSet will clean up the pods it created.

### Key Points to Remember

- **Purpose**: Ensures all or specific nodes run a copy of a pod.
- **Lifecycle**: Pods are automatically added to new nodes and removed from deleted nodes.
- **Use Cases**: Commonly used for running system-level services, such as logging and monitoring agents.

## Example

Here is an example of a DaemonSet configuration to run a logging agent on all nodes:

### DaemonSet Manifest

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: fluentd
  namespace: kube-system
  labels:
    k8s-app: fluentd-logging
spec:
  selector:
    matchLabels:
      name: fluentd
  template:
    metadata:
      labels:
        name: fluentd
    spec:
      containers:
      - name: fluentd
        image: fluent/fluentd
        resources:
          limits:
            memory: 200Mi
            cpu: 100m
```
### Applying the Configuration
Save the manifest to a file (e.g., `fluentd-daemonset.yaml`) and run:
```sh
kubectl apply -f fluentd-daemonset.yaml
```

# Interview Questions and Answers

1. ### What is a DaemonSet in Kubernetes?

- A DaemonSet ensures that all (or some) nodes run a copy of a pod. It is used to run a pod on every node or a subset of nodes in a Kubernetes cluster.

2. ### What are common use cases for DaemonSets?

- DaemonSets are commonly used for running system-level services such as logging agents, monitoring agents, and other infrastructure-related tasks that need to run on every node.

3. ### How does a DaemonSet differ from a Deployment?

- A DaemonSet ensures that a copy of a pod runs on all (or some) nodes, while a Deployment ensures that a specified number of replicas of a pod are running. Deployments are used for scalable applications, whereas DaemonSets are used for node-specific tasks.

4. ### How does Kubernetes handle a DaemonSet when a new node is added to the cluster?

- When a new node is added to the cluster, Kubernetes automatically schedules the DaemonSet pod on the new node to ensure the pod runs on all nodes.

5. ### What happens to DaemonSet pods when a node is removed from the cluster?

- When a node is removed from the cluster, the DaemonSet pods scheduled on that node are automatically garbage collected.

6. ### Can you run a DaemonSet on specific nodes only?

- Yes, you can run a DaemonSet on specific nodes by using node selectors, node affinity, or taints and tolerations to control the scheduling of DaemonSet pods.

7. ### How do you delete a DaemonSet in Kubernetes?

- You can delete a DaemonSet using the `kubectl delete` command:

    ```sh
    kubectl delete daemonset <daemonset-name>
    ```

8. ### What happens to the pods created by a DaemonSet when the DaemonSet is deleted?
- When a DaemonSet is deleted, all the pods created by the DaemonSet are also deleted.