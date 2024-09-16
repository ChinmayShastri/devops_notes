# Helm Basic Examples

## 1. Creating a New Helm Chart
```bash
helm create mychart
```
This command generates a new Helm chart in a directory named mychart with a predefined structure.
## 2. Installing a Helm Chart
```bash
helm install my-release bitnami/nginx
```
This command installs the `nginx` chart from the Bitnami repository and names the release `my-release`.
## 3. Inspecting a Chart's Default Values
```bash
helm show values bitnami/nginx
```
This command displays the default configuration values for the `nginx` chart.
## 4. Overriding Default Values During Installation
```bash
helm install my-release bitnami/nginx --set service.type=NodePort
```
This command installs the `nginx` chart while overriding the default `service.type` to `NodePort`.
## 5. Upgrading a Helm Release
```bash
helm upgrade my-release bitnami/nginx --set replicaCount=3
```
This command upgrades the `my-release` with new configuration, changing the number of replicas to 3.
## 6. Uninstalling a Helm Release
```bash
helm uninstall my-release
```
This command removes the `my-release` and all associated Kubernetes resources.

## Steps to install helm:

``` bash
# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

# chmod 777 get_helm.sh

# ./get_helm.sh

# helm --version
```