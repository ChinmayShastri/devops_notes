# Kubernetes kubectl Commands

### `kubectl get`

- **Explanation**: Lists resources or objects in the cluster.
- **Example**:
  ```sh
  kubectl get pods
  ```
### `kubectl describe`
- **Explanation**: Provides detailed information about a resource or object.
- **Example**:
    ```sh
    kubectl describe pod <pod-name>
    ```
### `kubectl create`
- **Explanation**: Creates a resource or object from a file or inline configuration.
- **Example**:
    ```sh
    kubectl create -f <file.yaml>
    ```
### `kubectl apply`
- **Explanation**: Applies changes to a resource or object from a file or inline configuration.
- **Example**:
    ```sh
    kubectl apply -f <file.yaml>
    ```
### `kubectl delete`
- **Explanation**: Deletes a resource or object from the cluster.
- **Example**:
    ```sh
    kubectl delete pod <pod-name>
    ```
### `kubectl exec`
- **Explanation**: Executes a command inside a container of a pod.
- **Example**:
    ```sh
    kubectl exec -it <pod-name> -- /bin/bash
    kubectl exec pods nginx-test-pod -c nginx -- cat /etc/nginx/nginx.conf
    ```