# Kubernetes: Application Configuration

## Key Points to Remember

- Kubernetes allows for the configuration of applications via ConfigMaps and Secrets.
- ConfigMaps store configuration data in key-value pairs.
- Secrets are similar to ConfigMaps but are used to store sensitive information such as passwords, OAuth tokens, and SSH keys.
- ConfigMaps and Secrets can be used in pods as environment variables or as volumes.

## ConfigMaps

### Key Components in the Example

- **Creation**: Creating a ConfigMap from literal values or from a file.
- **Usage**: Using a ConfigMap as environment variables or as a volume in a pod.

### Example

#### Creating a ConfigMap

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: example-configmap
data:
  mykey: myvalue
```

### Using ConfigMap as Environment Variables
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: configmap-env-example
spec:
  containers:
    - name: test-container
      image: busybox
      envFrom:
        - configMapRef:
            name: example-configmap
  restartPolicy: Never
```
### Using ConfigMap as a Volume
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: configmap-volume-example
spec:
  containers:
    - name: test-container
      image: busybox
      volumeMounts:
        - name: config-volume
          mountPath: /etc/config
  volumes:
    - name: config-volume
      configMap:
        name: example-configmap
  restartPolicy: Never
```
