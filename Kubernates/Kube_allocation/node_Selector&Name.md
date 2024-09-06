# Kubernetes Scheduling: Node Selector and Node Name

## Node Selector

Node Selector is a simple way to constrain pods to nodes with specific labels. It ensures that the pods are scheduled only on nodes that match the specified labels.

### Key Points to Remember

- **Node Selector**: Constrains pods to nodes with specific labels.
- **Labels**: Key-value pairs assigned to nodes.
- **Scheduling**: Pods are only scheduled on nodes that match the labels.

## Node Name

Node Name directly schedules a pod to a specific node by specifying the node's name in the pod specification.

### Key Points to Remember

- **Node Name**: Directly schedules a pod to a specific node.
- **Static Scheduling**: Pods are scheduled on a predefined node.

## Configuring Node Selector and Node Name

### Node Selector Example

To schedule a pod on nodes with a specific label, use the `nodeSelector` field:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  containers:
  - name: example-container
    image: nginx
  nodeSelector:
    disktype: ssd
```

### Node Name Example

To schedule a pod on a specific node, use the `nodeName` field:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  containers:
  - name: example-container
    image: nginx
  nodeName: node-1
```

## Use Cases
- **Node Selector**: Useful when you want to deploy pods on nodes with specific characteristics (e.g., SSD storage).
- **Node Name**: Useful for testing or when specific pods need to run on specific nodes.


# Interview Questions and Answers

1. ### What is a Node Selector in Kubernetes?

- A Node Selector is a way to constrain pods to be scheduled only on nodes that match specific labels.

2. ### How do you specify a Node Selector in a pod's manifest?

- You specify a Node Selector in the pod's manifest under the `nodeSelector` field, like this:

```yaml
nodeSelector:
  disktype: ssd
```
3. ### What is the purpose of the Node Name field in Kubernetes?
- The Node Name field is used to directly schedule a pod on a specific node by specifying the node's name in the pod specification.

4. ### How do you specify a Node Name in a pod's manifest?
- You specify a Node Name in the pod's manifest under the nodeName field, like this:

```sh 
nodeName: node-1
```
5. ### When would you use Node Selector over Node Name?
- You would use Node Selector when you want to schedule pods on nodes with specific characteristics (e.g., nodes with SSD storage) without tying the pods to a specific node. Node Name is more static and is used for specific, often testing, purposes.

6. ### Can you use both Node Selector and Node Name in the same pod specification?
- No, typically you use either Node Selector or Node Name. Node Name is a more direct and static scheduling approach, while Node Selector provides more flexibility by allowing pods to be scheduled on any node that matches the specified labels.

7. ### What is a common use case for using Node Name in Kubernetes?
- A common use case for using Node Name is for testing purposes or for ensuring that specific pods run on specific nodes, such as for legacy applications or applications with special hardware requirements.

8. ### How do labels and selectors work together in Kubernetes scheduling?
- Labels are key-value pairs assigned to nodes, and selectors are expressions that match against these labels. Node Selector uses these labels to determine on which nodes a pod should be scheduled.