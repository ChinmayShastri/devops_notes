## 1. Execute Service with Helm

### Example:
To execute a service using Helm, you can deploy a Helm chart that defines the service configuration. For example, let's create and deploy a simple NGINX web server service:

```bash
helm create nginx-service
```
This command creates a new Helm chart called `nginx-service` with a predefined structure. Modify the `values.yaml` file to define the NGINX service:
```yaml
# values.yaml
service:
  type: LoadBalancer
  port: 80
```
Now, deploy the service using Helm:
```bash
helm install my-nginx ./nginx-service
```
## Explanation:
In this example, `helm create nginx-service` generates a Helm chart with default files. The `values.yaml` file is modified to specify the service type (`LoadBalancer`) and port (`80`). The `helm install` command then deploys this chart to the Kubernetes cluster, creating an NGINX service.

Helm templates these settings into Kubernetes manifests and executes them. The `install` command results in a new release called `my-nginx`, which provisions the NGINX service according to the configurations in the Helm chart.

---
## 2. Upgrade Service in Helm
### Example:
If you have deployed an NGINX service with Helm, you can upgrade it to a new version or change its configuration. For example, let's change the number of replicas of the NGINX deployment to 3:
``` bash
helm upgrade my-nginx ./nginx-service --set replicaCount=3
```
This command modifies the running `my-nginx` release to scale the number of replicas to 3.

### Explanation:
The helm upgrade command is used to modify an existing Helm release. By using the `--set` flag, we can override specific values, such as `replicaCount`, without needing to edit the `values.yaml` file. This command will scale the NGINX service by updating the Kubernetes Deployment with the new replica count.

Helm intelligently manages the upgrade process by only updating the changed components of the release, ensuring minimal disruption to the running service.

---

## 3. Helm Release Records
### Example:
To see the history of Helm releases, use the following command:
```bash
helm history my-nginx
```
This will display all the revisions for the `my-nginx` release, along with the details of each upgrade, rollback, or uninstall operation.

### Explanation:
Helm keeps a history of every release in the cluster. Each installation, upgrade, or rollback operation is tracked with a unique revision number. The `helm history` command allows you to see all past revisions of a release, including when they were deployed, what changes were made, and their status. This makes it easy to audit and manage the lifecycle of Kubernetes applications.

---

## 4. Provide Custom Value to the Helm Chart
### Example:
When deploying a Helm chart, you can override default values by passing custom values either directly in the command line or via a custom values file. For example:
```bash
helm install my-nginx ./nginx-service --set service.type=NodePort
```
Or, using a custom values file (`custom-values.yaml`):
```yaml
# custom-values.yaml
service:
  type: NodePort
  port: 30001
```
Deploy using the custom values file:
```bash
helm install my-nginx ./nginx-service -f custom-values.yaml
```
### Explanation:
In this example, the default values of the NGINX service chart are overridden using the `--set` flag or a custom values file. This allows for greater flexibility when deploying Helm charts, as users can configure the chart without modifying the original `values.yaml` file. The `-f` option lets you pass a file containing custom values, while `--set` allows you to override individual settings from the command line.

---

## 5. Re-use Deployment Naming
### Example:
To ensure that Helm reuses the same deployment name when performing upgrades, specify the release name during both the install and upgrade steps. For example:
```bash
# Install the Helm chart
helm install my-nginx ./nginx-service
# Upgrade the existing release
helm upgrade my-nginx ./nginx-service --set replicaCount=3
```
### Explanation:
By providing a specific release name (`my-nginx` in this case) during both the `install` and `upgrade` commands, Helm will reuse the same deployment and avoid creating a new one. This ensures that the same Kubernetes resources are updated, rather than replaced or duplicated. Helm uses this release name to track the application's state and perform subsequent actions (such as upgrades or rollbacks) on the same set of resources.