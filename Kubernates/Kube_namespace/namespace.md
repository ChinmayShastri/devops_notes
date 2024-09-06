# Namespace in Kubernetes

Namespaces in Kubernetes provide a way to divide cluster resources between multiple users. They are intended for use in environments with many users spread across multiple teams, or projects.

## Key Points to Remember

1. **Namespace Basics**:
   - Namespaces are virtual clusters within a physical Kubernetes cluster.
   - They allow for resource isolation and management.
   - Default namespaces: `default`, `kube-system`, and `kube-public`.

2. **Creating a Namespace**:
   - Command to create a namespace:
     ```sh
     kubectl create namespace <namespace-name>
     ```
   - Example:
     ```sh
     kubectl create namespace dev
     ```

3. **Viewing Namespaces**:
   - Command to list all namespaces:
     ```sh
     kubectl get namespaces
     ```
   - Example output:
     ```
     NAME              STATUS   AGE
     default           Active   10d
     kube-system       Active   10d
     kube-public       Active   10d
     dev               Active   5d
     ```

4. **Using Namespaces**:
   - Specify a namespace in a configuration file:
     ```yaml
     apiVersion: v1
     kind: Pod
     metadata:
       name: nginx
       namespace: dev
     spec:
       containers:
       - name: nginx
         image: nginx
     ```
   - Command to specify a namespace for a command:
     ```sh
     kubectl get pods --namespace=<namespace-name>
     ```
   - Example:
     ```sh
     kubectl get pods --namespace=dev
     ```

5. **Setting a Default Namespace**:
   - Configure kubectl to use a specific namespace by default:
     ```sh
     kubectl config set-context --current --namespace=<namespace-name>
     ```
   - Example:
     ```sh
     kubectl config set-context --current --namespace=dev
     ```

6. **Deleting a Namespace**:
   - Command to delete a namespace:
     ```sh
     kubectl delete namespace <namespace-name>
     ```
   - Example:
     ```sh
     kubectl delete namespace dev
     ```

## Key Components in the Example

1. **Namespace**: Virtual clusters within a physical Kubernetes cluster for resource isolation.
2. **kubectl**: Command-line tool to interact with Kubernetes clusters.
3. **Configuration File**: YAML file specifying the desired state of resources, including the namespace.

## Interview Questions and Answers

1. **What is a namespace in Kubernetes?**
   - A namespace is a virtual cluster within a physical Kubernetes cluster that allows for resource isolation and management.

2. **Why are namespaces used in Kubernetes?**
   - Namespaces are used to divide cluster resources between multiple users and teams, providing isolation and management of resources.

3. **What are the default namespaces in Kubernetes?**
   - The default namespaces are `default`, `kube-system`, and `kube-public`.

4. **How do you create a namespace in Kubernetes?**
   - You create a namespace using the command:
     ```sh
     kubectl create namespace <namespace-name>
     ```
   - Example:
     ```sh
     kubectl create namespace dev
     ```

5. **How can you list all namespaces in a Kubernetes cluster?**
   - You can list all namespaces using the command:
     ```sh
     kubectl get namespaces
     ```

6. **How do you specify a namespace for a command in kubectl?**
   - You specify a namespace for a command using the `--namespace` flag:
     ```sh
     kubectl get pods --namespace=<namespace-name>
     ```
   - Example:
     ```sh
     kubectl get pods --namespace=dev
     ```

7. **How can you set a default namespace for kubectl commands?**
   - You can set a default namespace using the command:
     ```sh
     kubectl config set-context --current --namespace=<namespace-name>
     ```
   - Example:
     ```sh
     kubectl config set-context --current --namespace=dev
     ```

8. **How do you delete a namespace in Kubernetes?**
   - You delete a namespace using the command:
     ```sh
     kubectl delete namespace <namespace-name>
     ```
   - Example:
     ```sh
     kubectl delete namespace dev
     ```

9. **Can you specify a namespace in a Kubernetes configuration file?**
   - Yes, you can specify a namespace in the metadata section of a configuration file:
     ```yaml
     apiVersion: v1
     kind: Pod
     metadata:
       name: nginx
       namespace: dev
     spec:
       containers:
       - name: nginx
         image: nginx
     ```
