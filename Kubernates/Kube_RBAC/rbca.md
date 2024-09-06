# RBAC in Kubernetes

## Explanation

Role-Based Access Control (RBAC) is a method for regulating access to computer or network resources based on the roles of individual users within your organization. In Kubernetes, RBAC is used to control access to the Kubernetes API and resources within a cluster.

### Key Concepts

- **Role**: Defines a set of permissions within a namespace. Roles are assigned to users or service accounts to grant access to specific resources.
- **ClusterRole**: Similar to a Role but applies to all namespaces in the cluster.
- **RoleBinding**: Associates a Role with a user or set of users within a namespace.
- **ClusterRoleBinding**: Associates a ClusterRole with a user or set of users across the entire cluster.

### Creating a Role

A Role defines a set of permissions within a specific namespace. Below is an example of a Role that grants read access to pods within a namespace:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
```

### Creating a RoleBinding

A RoleBinding assigns the defined Role to a user or set of users within a namespace. Below is an example of a RoleBinding that grants the `pod-reader` Role to a user named `jane`:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: read-pods
  namespace: default
subjects:
- kind: User
  name: jane
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

### Creating a ClusterRole

A ClusterRole is similar to a Role but applies to all namespaces in the cluster. Below is an example of a ClusterRole that grants read access to pods across all namespaces:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cluster-pod-reader
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
```

### Creating a ClusterRoleBinding
A ClusterRoleBinding assigns the defined ClusterRole to a user or set of users across the entire cluster. Below is an example of a `ClusterRoleBinding` that grants the cluster-pod-reader ClusterRole to a user named `john`:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: read-cluster-pods
subjects:
- kind: User
  name: john
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: cluster-pod-reader
  apiGroup: rbac.authorization.k8s.io
```

## Key Points to Remember
- **Roles and RoleBindings**: Namespace-specific.
- **ClusterRoles and ClusterRoleBindings**: Cluster-wide.
- **Permissions**: Defined using verbs (e.g., get, list, watch, create, update, delete).
- **Subjects**: Users, groups, or service accounts that are granted permissions.

## Interview Questions and Answers

1. ### What is RBAC in Kubernetes?
    - RBAC (Role-Based Access Control) is a method for regulating access to Kubernetes resources based on the roles of individual users within your organization.

2. ### What are the main components of RBAC in Kubernetes?
    - The main components are Roles, RoleBindings, ClusterRoles, and ClusterRoleBindings.

3. ### How does a Role differ from a ClusterRole in Kubernetes?
    - A Role is namespace-specific, whereas a ClusterRole applies to all namespaces in the cluster.

4. ### How would you grant read access to pods in a specific namespace?
    -  You can create a Role with read permissions on pods and bind it to a user with a RoleBinding.

5. ### How do you apply a ClusterRole to a user across the entire cluster?
    - You use a ClusterRoleBinding to associate the ClusterRole with the user.

6. ### What is the purpose of a RoleBinding in Kubernetes?
    - A RoleBinding assigns a Role to a user or set of users within a specific namespace, granting them the defined permissions.
