# Kubernetes Overview

Kubernetes, often abbreviated as K8s, is an open-source platform designed to automate the deployment, scaling, and operation of application containers. Originally developed by Google, Kubernetes is now maintained by the Cloud Native Computing Foundation (CNCF).

## Key Points to Remember

1. **Container Orchestration**: Kubernetes manages containerized applications across a cluster of machines, automating the deployment and scaling of containerized applications.
2. **Architecture**:
   - **Master Node**: Controls the Kubernetes cluster and is responsible for managing the cluster, API, and scheduling.
   - **Worker Nodes**: Run the containerized applications and are managed by the master node.
3. **Components**:
   - **ETCD**: A key-value store used for configuration and service discovery.
   - **Kube-API Server**: The front-end for the Kubernetes control plane.
   - **Kube-Scheduler**: Assigns tasks to worker nodes based on resource availability.
   - **Kube-Controller-Manager**: Handles controller processes.
   - **Kubelet**: Runs on nodes and ensures containers are running in a Pod.
   - **Kube-Proxy**: Maintains network rules and allows communication to Pods.
   - **Container Runtime**: Software that runs the containers, such as Docker or containerd.
4. **Key Concepts**:
   - **Pods**: The smallest deployable units in Kubernetes, which can contain one or more containers.
   - **Services**: Define a logical set of Pods and a policy by which to access them.
   - **Deployments**: Provide declarative updates to applications.
   - **ConfigMaps** and **Secrets**: Store configuration data and sensitive information, respectively.
   - **Namespaces**: Provide a mechanism to divide cluster resources between multiple users.
   - **Volumes**: Abstract storage in a Pod.
   - **Ingress**: Manages external access to services, typically HTTP.
5. **Key Features**:
   - **Automated Rollouts and Rollbacks**: Automate the deployment of new versions and rollback if something goes wrong.
   - **Horizontal Scaling**: Scale applications up or down with a simple command.
   - **Service Discovery and Load Balancing**: Automatically exposes a container using the DNS name or an IP address.
   - **Storage Orchestration**: Automatically mount the storage system of your choice.
   - **Self-Healing**: Restarts containers that fail, replaces and reschedules them when nodes die.

## Interview Questions and Answers

1. **What is Kubernetes and why is it used?**
   - Kubernetes is an open-source platform designed to automate deploying, scaling, and operating application containers. It is used to manage containerized applications across a cluster of machines, ensuring efficient use of resources and simplifying deployment processes.

2. **Explain the architecture of Kubernetes.**
   - Kubernetes has a master-worker architecture. The master node controls the cluster and manages API, scheduling, and state of the cluster using various components like the Kube-API Server, ETCD, Kube-Scheduler, and Kube-Controller-Manager. Worker nodes run the containerized applications and have components like Kubelet, Kube-Proxy, and the container runtime.

3. **What are Pods in Kubernetes?**
   - Pods are the smallest deployable units in Kubernetes, which can contain one or more containers. Pods share the same network namespace and can share storage volumes.

4. **What is the role of the Kube-API Server?**
   - The Kube-API Server is the front-end for the Kubernetes control plane. It exposes the Kubernetes API and processes API requests, validating and executing them.

5. **How does Kubernetes handle storage?**
   - Kubernetes handles storage through Volumes, which provide a way for containers in a Pod to access storage. Volumes can be backed by various storage systems, such as local disks, NFS, cloud storage, and more.

6. **What is a Namespace in Kubernetes and why is it useful?**
   - Namespaces are a way to divide cluster resources between multiple users. They provide a scope for names, allowing for the separation of resources and enabling resource quota management and access control.

7. **How does Kubernetes perform service discovery?**
   - Kubernetes performs service discovery using Services, which define a logical set of Pods and a policy to access them. Services are assigned a stable IP address and DNS name, enabling other Pods to discover and communicate with them.

8. **What is a Deployment in Kubernetes?**
   - A Deployment provides declarative updates to applications. It allows users to describe an application's desired state and the Deployment controller manages the process of achieving that state, including updates and rollbacks.

9. **How do ConfigMaps and Secrets differ in Kubernetes?**
   - ConfigMaps are used to store non-sensitive configuration data, while Secrets are used to store sensitive information like passwords and API keys. Both can be injected into Pods as environment variables or mounted as files.

10. **What are some common use cases for Kubernetes?**
    - Kubernetes is commonly used for microservices architecture, continuous integration and continuous deployment (CI/CD) pipelines, automated rollouts and rollbacks, and managing containerized applications at scale.

11. **How does Kubernetes ensure high availability of applications?**
    - Kubernetes ensures high availability through features like automated restarts of failed containers, replication of Pods, and rescheduling of containers on healthy nodes if a node fails.

12. **Explain the concept of Ingress in Kubernetes.**
    - Ingress manages external access to services, typically HTTP. It provides load balancing, SSL termination, and name-based virtual hosting, enabling external users to access internal services.

13. **What is the function of the Kubelet?**
    - The Kubelet runs on each worker node and ensures that containers are running in a Pod. It communicates with the Kube-API Server to receive instructions and reports the status of Pods back to the control plane.

14. **How does Kubernetes handle automated rollouts and rollbacks?**
    - Kubernetes handles automated rollouts and rollbacks through Deployments. Users define the desired state, and the Deployment controller manages the process of updating Pods incrementally. If a problem is detected, Kubernetes can automatically roll back to the previous stable state.

15. **What are the differences between Deployments, StatefulSets, and DaemonSets?**
    - **Deployments**: Manage stateless applications, providing updates and rollbacks.
    - **StatefulSets**: Manage stateful applications, ensuring ordered deployment and scaling, and maintaining stable network identities.
    - **DaemonSets**: Ensure that a copy of a Pod runs on all (or some) nodes in the cluster, commonly used for logging and monitoring agents.