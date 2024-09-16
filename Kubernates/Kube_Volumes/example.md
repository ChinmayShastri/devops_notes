# Examples of Volumes in Kubernetes

## 1. emptyDir Volume
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: emptydir-example
spec:
  containers:
    - name: nginx
      image: nginx
      volumeMounts:
        - mountPath: /usr/share/nginx/html
          name: html-volume
  volumes:
    - name: html-volume
      emptyDir: {}
```
### emptyDir Volume
- The `emptyDir` volume is created when the pod starts and exists as long as the pod is running. It provides a temporary storage directory that can be used by the container.
- In this example, the `html-volume` is mounted to `/usr/share/nginx/html`, allowing the container to store files in this directory.

---
## 2. hostPath Volume
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: hostpath-example
spec:
  containers:
    - name: nginx
      image: nginx
      volumeMounts:
        - mountPath: /usr/share/nginx/html
          name: html-volume
  volumes:
    - name: html-volume
      hostPath:
        path: /data/nginx
        type: Directory
```
### hostPath Volume
- The `hostPath` volume mounts a directory from the host node into the pod. This is useful when you need to access files from the host’s filesystem.
- In the example, the `html-volume` is mapped to `/data/nginx` on the host. This means any files in `/data/nginx` on the host machine will be accessible inside the container at `/usr/share/nginx/html`.

---
## 3. persistentVolumeClaim (PVC)
Create a PersistentVolume
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-example
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /mnt/data
```
Create a PersistentVolumeClaim
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-example
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 500Mi
```
Use the PVC in a Pod
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pvc-pod-example
spec:
  containers:
    - name: nginx
      image: nginx
      volumeMounts:
        - mountPath: /usr/share/nginx/html
          name: pvc-volume
  volumes:
    - name: pvc-volume
      persistentVolumeClaim:
        claimName: pvc-example
```
### persistentVolumeClaim (PVC)
- A PersistentVolume (PV) represents a piece of storage in the cluster. The PersistentVolumeClaim (PVC) is a request for storage by a user.
- The `pv-example` defines a storage volume of size 1Gi, and the PVC `pvc-example` requests 500Mi of that storage.
- In the pod definition, the PVC `pvc-example` is used as a volume, which mounts the claimed storage to `/usr/share/nginx/html`.
---
## configMap Volume
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: configmap-example
spec:
  containers:
    - name: myapp
      image: myapp:latest
      volumeMounts:
        - mountPath: /etc/config
          name: config-volume
  volumes:
    - name: config-volume
      configMap:
        name: app-config
```
### configMap Volume
- A `configMap` volume is used to provide configuration data to the application. The data from the ConfigMap is mounted as files in the container.
- In the example, the volume mounts the data from `app-config` into the container at `/etc/config`. The application can then read this configuration data as needed.
