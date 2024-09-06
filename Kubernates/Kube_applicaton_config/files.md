# ConfigMaps and Secrets Using Files in Kubernetes

## ConfigMaps

### Explanation

ConfigMaps can be created from files to manage configuration data separately from application code.

### Creating a ConfigMap from a File

You can create a ConfigMap from a file using the `kubectl create configmap` command.

#### Example: Creating a ConfigMap from a File

Assume you have a configuration file `config.properties`:

    ```sh
    kubectl create configmap my-config --from-file=config.properties
    ```
## Using a ConfigMap in a Pod

You can use a ConfigMap in a pod by mounting it as a volume or using it to set environment variables.

### Example: Pod Using ConfigMap Mounted as a Volume
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: configmap-volume-pod
spec:
  containers:
  - name: my-container
    image: busybox
    volumeMounts:
    - name: config-volume
      mountPath: /etc/config
  volumes:
  - name: config-volume
    configMap:
      name: my-config
  restartPolicy: Never
```
## Secrets
### Explanation
Secrets can be created from files to securely store sensitive information such as passwords, OAuth tokens, and SSH keys.

### Creating a Secret from a File
You can create a Secret from a file using the kubectl create secret command.

### Example: Creating a Secret from a File

Assume you have a secret file `secret.txt`:
```sh
kubectl create secret generic my-secret --from-file=secret.txt
```
### Using a Secret in a Pod
You can use a Secret in a pod by mounting it as a volume or using it to set environment variables.

### Example: Pod Using Secret Mounted as a Volume
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: secret-volume-pod
spec:
  containers:
  - name: my-container
    image: busybox
    volumeMounts:
    - name: secret-volume
      mountPath: /etc/secret
  volumes:
  - name: secret-volume
    secret:
      secretName: my-secret
  restartPolicy: Never
```
## Key Points to Remember

- **ConfigMaps**: Store non-confidential data in key-value pairs.
- **Secrets**: Store sensitive data securely.
- **Creating ConfigMaps and Secrets**: Can be created from files using `kubectl create configmap` and `kubectl create secret` commands.
- **Using ConfigMaps and Secrets**: Can be used in pods by mounting them as volumes or setting environment variables.

## Interview Questions and Answers

1. ### How can you use a ConfigMap in a pod?

- You can use a ConfigMap in a pod by mounting it as a volume or using it to set environment variables.

2. ### How can you use a Secret in a pod?

- You can use a Secret in a pod by mounting it as a volume or using it to set environment variables.

3. ### What are the key differences between ConfigMaps and Secrets in Kubernetes?

- ConfigMaps are used to store non-confidential data in key-value pairs, while Secrets are used to store sensitive data securely.

4. ### How do you create a ConfigMap from a file in Kubernetes?

- You can create a ConfigMap from a file using the following command:
``` sh
kubectl create configmap my-config --from-file=config.properties
```
5. ### How do you create a Secret from a file in Kubernetes?

- You can create a Secret from a file using the following command:
```sh 
kubectl create secret generic my-secret --from-file=secret.txt
```
