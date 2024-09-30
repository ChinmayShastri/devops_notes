# Amazon EKS (Elastic Kubernetes Service) Detailed Notes

---

## Overview

**Amazon EKS (Elastic Kubernetes Service)** is a fully managed Kubernetes service by AWS that allows you to run Kubernetes applications on AWS infrastructure. It simplifies the process of running Kubernetes by handling the setup, maintenance, and scaling of Kubernetes control planes and worker nodes. EKS integrates seamlessly with other AWS services like IAM, VPC, and CloudWatch, allowing secure, scalable, and efficient Kubernetes deployments.

---

## Key Components of EKS

1. **EKS Control Plane**: A fully managed Kubernetes control plane, consisting of three Kubernetes master nodes spread across multiple Availability Zones (AZs).
2. **Worker Nodes**: Managed EC2 instances or Fargate instances that run the Kubernetes workloads.
3. **Kubernetes API**: The Kubernetes control interface to manage the cluster (deployments, services, config maps, etc.).
4. **Kubernetes Pods**: The smallest unit in Kubernetes, encapsulating containers and running workloads.
5. **Managed Node Groups**: Managed groups of EC2 instances for scaling and running pods.
6. **Fargate Profiles**: Serverless, fully managed compute service to run Kubernetes pods without managing EC2 instances.

---

## Key Features of EKS

- **Fully Managed Kubernetes**: AWS manages the control plane, providing automatic patching and updates for Kubernetes.
- **High Availability**: EKS control planes are distributed across multiple AZs for fault tolerance.
- **Security**: Deep integration with IAM for secure access to Kubernetes resources.
- **Networking**: VPC networking is used to provide secure, private connectivity to EKS clusters.
- **EKS Anywhere**: Run Kubernetes clusters on-premises or in hybrid environments using EKS Anywhere.
- **Autoscaling**: Automatic scaling for both EC2 worker nodes and Kubernetes pods.
- **Multi-Region Support**: Deploy EKS clusters across multiple regions for increased availability.

---

## Best Practices for EKS

### 1. **Cluster Setup and Security**

- **Use IAM Roles for Service Accounts**: Assign IAM roles to Kubernetes service accounts to securely manage permissions.
- **VPC Isolation**: Deploy your EKS cluster into private subnets for better isolation and security.
- **Encrypt Data**: Use EKS with AWS KMS (Key Management Service) to encrypt Kubernetes secrets.
- **RBAC (Role-Based Access Control)**: Use Kubernetes RBAC to control access to Kubernetes resources based on roles and permissions.
- **IAM Authentication**: Use IAM authentication to secure access to your EKS cluster, with fine-grained permissions for users and services.

### 2. **Networking Best Practices**

- **VPC and Subnet Configuration**: Ensure EKS worker nodes and control planes are deployed into properly configured VPCs with private subnets.
- **Security Groups**: Apply strict security groups to worker nodes, limiting inbound and outbound traffic.
- **Service Discovery**: Use AWS Cloud Map or external-dns to integrate service discovery with Route 53.
- **Network Policies**: Use Kubernetes Network Policies to enforce fine-grained access between pods.

### 3. **Scaling and Performance**

- **Cluster Autoscaler**: Use the Cluster Autoscaler to dynamically scale worker nodes based on pod requirements.
- **Horizontal Pod Autoscaler (HPA)**: Scale your Kubernetes workloads automatically based on metrics like CPU, memory, or custom metrics.
- **Use Spot Instances**: Run non-critical workloads on EC2 Spot instances to save on costs.
- **Optimize for Fargate**: Use Fargate profiles for serverless pods where infrastructure management is not required.

### 4. **Monitoring and Logging**

- **CloudWatch for Logs**: Stream logs from Kubernetes components (API server, kubelet, etc.) to Amazon CloudWatch for centralized logging.
- **Prometheus and Grafana**: Use Prometheus and Grafana for real-time monitoring of Kubernetes clusters and workloads.
- **Container Insights**: Enable Container Insights in CloudWatch to monitor pod and container performance metrics.

### 5. **Lifecycle and Deployment Management**

- **Blue-Green Deployments**: Use tools like Argo CD, AWS CodeDeploy, or Kubernetes-native deployment strategies for blue-green or canary deployments.
- **Manage Application Configuration**: Use ConfigMaps and Secrets to externalize configurations and credentials from containers.
- **Rolling Updates**: Use Kubernetes native rolling updates to deploy new versions of applications with zero downtime.
- **EKS Add-ons**: Install and manage Kubernetes add-ons like CoreDNS, VPC CNI, and kube-proxy using EKS add-ons.

---

## Steps to Set Up EKS

### Step 1: **Create an EKS Cluster**

1. **Navigate to EKS Console**: Go to the EKS dashboard in the AWS Management Console.
2. **Create Cluster**:
   - Specify the cluster name.
   - Select the Kubernetes version.
   - Choose VPC and subnet configurations.
   - Click **Create Cluster** and wait for the control plane to be provisioned.

### Step 2: **Create Worker Nodes**

1. **Choose EC2 or Fargate**:
   - For EC2 worker nodes, create a managed node group.
   - For Fargate, create a Fargate profile to run serverless Kubernetes pods.
2. **Node Group Configuration**:
   - Specify instance types (for EC2), node group size, and scaling policies.
   - Attach appropriate IAM roles and security groups to worker nodes.

### Step 3: **Configure kubectl**

1. **Install kubectl**: Ensure `kubectl` is installed locally for interacting with the Kubernetes API.
2. **Authenticate with AWS IAM**:
   - Use `aws eks --region <region> update-kubeconfig --name <cluster_name>` to configure `kubectl` access to your EKS cluster.
3. **Test Access**: Run `kubectl get nodes` to verify the worker nodes are connected to the cluster.

### Step 4: **Deploy Applications to EKS**

1. **Create Kubernetes Deployments**:
   - Define Kubernetes `Deployment` and `Service` manifests.
   - Apply the manifests using `kubectl apply -f <manifest.yaml>`.
2. **Expose Application**:
   - Use `LoadBalancer` services or AWS Application Load Balancers (ALB) to expose applications externally.
   - Use `Ingress` controllers to manage and route traffic.

### Step 5: **Monitor and Scale EKS Cluster**

1. **Enable Autoscaling**:
   - Install the Cluster Autoscaler to manage EC2 node scaling.
   - Set up Horizontal Pod Autoscaling (HPA) for automatic workload scaling.
2. **Monitor with CloudWatch**:
   - Enable Container Insights and CloudWatch Logs for detailed monitoring and alerting.
3. **Scaling Policies**: Define auto-scaling policies based on metrics like CPU and memory usage.

---

## EKS Backup Plan

### 1. **Backup Kubernetes Resources**

- **ETCD Backup**: Back up the etcd datastore (although this is managed by AWS in EKS).
- **Kubernetes Manifests**: Store deployment manifests, ConfigMaps, and secrets in version control (e.g., Git, CodeCommit).
- **Velero**: Use Velero to back up Kubernetes cluster resources like PersistentVolumes, namespaces, and secrets.

### 2. **Backup Application Data**

- **EBS Volumes**: For stateful workloads, back up EBS volumes attached to worker nodes using EBS snapshots.
- **EFS or S3**:
   - Use Amazon EFS (Elastic File System) for backing up stateful applications.
   - For stateless workloads, back up data to Amazon S3 buckets.
- **Automate Backups**: Use AWS Backup to automate backups for EC2 worker nodes, RDS, or EFS.

---

## Summary

- **Fully Managed Kubernetes**: EKS simplifies Kubernetes management by handling the control plane while you focus on deploying and managing workloads.
- **Highly Available and Secure**: EKS provides a highly available control plane distributed across multiple AZs, integrated with IAM and VPC for security.
- **Scaling Flexibility**: Utilize EC2 or Fargate for worker nodes and leverage auto-scaling for both nodes and pods.
- **Monitoring**: Monitor cluster health and workloads using CloudWatch, Prometheus, and Grafana.
- **Backup Strategy**: Use Velero for backing up Kubernetes resources and automate backups for persistent data with EBS, EFS, and S3.

---

## Additional Resources

- **[Amazon EKS Documentation](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)**
- **[Kubernetes Documentation](https://kubernetes.io/docs/home/)**
- **[Velero for Backup and Restore](https://velero.io/)**
