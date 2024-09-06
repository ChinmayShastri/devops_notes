# Secrets
## Key Components in the Example
- **Creation**: Creating a Secret from literal values or from a file.
- **Usage**: Using a Secret as environment variables or as a volume in a pod.

## Example

### Creating a Secret
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: example-secret
type: Opaque
data:
  username: dXNlcm5hbWU=  # base64 encoded value
  password: cGFzc3dvcmQ=  # base64 encoded value
```

### Using Secret as Environment Variables
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: secret-env-example
spec:
  containers:
    - name: test-container
      image: busybox
      env:
        - name: USERNAME
          valueFrom:
            secretKeyRef:
              name: example-secret
              key: username
        - name: PASSWORD
          valueFrom:
            secretKeyRef:
              name: example-secret
              key: password
  restartPolicy: Never
```

### Using Secret as a Volume
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: secret-volume-example
spec:
  containers:
    - name: test-container
      image: busybox
      volumeMounts:
        - name: secret-volume
          mountPath: /etc/secret
  volumes:
    - name: secret-volume
      secret:
        secretName: example-secret
  restartPolicy: Never
```
