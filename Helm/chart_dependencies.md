# Helm Chart Dependencies

## 1. Manage Chart Dependencies

**Explanation:**
Managing chart dependencies allows you to include and manage other Helm charts within your own chart. Dependencies are specified in the `Chart.yaml` file and are managed through the `helm dependency` commands.

**Example Commands:**
### Add a dependency to Chart.yaml
dependencies:
```bash
name: mysql version: "8.0.0" repository: "https://charts.example.com/"
```
### Update dependencies
```bash
helm dependency update ./my-chart
```
In this example, the `Chart.yaml` file is updated to include a dependency on the `mysql` chart. The `helm dependency update` command downloads the dependency charts to the `charts/` directory.

---

## 2. Conditional Chart Dependencies

**Explanation:**
Conditional chart dependencies allow you to include or exclude dependencies based on values or conditions defined in `values.yaml`. This helps manage which dependencies are needed under different scenarios.

**Example Command:**

### 
Define conditional dependency in Chart.yaml
dependencies:
```bash
name: redis version: "6.0.0" repository: "https://charts.example.com/" condition: redis.enabled
```
### In values.yaml
- `redis: enabled: true`

In this example, the `redis` dependency is included only if `redis.enabled` is set to `true` in `values.yaml`.

---

## 3. Pass Values to Dependencies at Runtime

**Explanation:**
Passing values to dependencies at runtime allows you to customize the configuration of the dependent charts from the parent chart. This is done through the `values.yaml` file of the parent chart or command-line arguments.

**Example Command:**
### Define values for a dependency in values.yaml
```bash
mysql: mysqlRootPassword: mypassword mysqlUser: myuser
```
### Pass values via command line
- `helm install my-release ./my-chart --set mysql.mysqlRootPassword=mypassword --set mysql.mysqlUser=myuser`

This example shows how to pass custom values to the `mysql` dependency, either through `values.yaml` or the command line.

---

## 4. Child to Parent Chart Data Exchange

**Explanation:**
Child to parent chart data exchange allows data to be shared from child charts (dependencies) back to the parent chart. This is achieved by using `values` and `outputs` to pass information.

**Example Command:**
### Define outputs in a child chart
- In child chart's templates/deployment.yaml
```bash
{{- if .Values.someOutput }} outputs: - name: some-output value: {{ .Values.someOutput }} {{- end }}
```
### Access child chart outputs in parent chart
- In parent chart's values.yaml
```bash
childChart: someOutput: "data-from-child"
```
### Access the data in parent chart templates
```bash
{{ .Values.childChart.someOutput }}
```
In this example, the child chart defines an output that the parent chart can access and use in its templates.

