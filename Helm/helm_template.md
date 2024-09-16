### 1. Helm Template

**Explanation:**
The `helm template` command generates Kubernetes manifest files from a Helm chart without actually deploying them. This allows you to see what Kubernetes resources will be created based on the Helm chart and values provided.

**Example Command:**
```bash
helm template my-release ./my-chart
```
This command renders the Kubernetes YAML files based on the Helm chart located at `./my-chart` with the release name `my-release`. The output is the YAML manifests for the resources defined in the chart.

---

### 2. Actions in Template

**Explanation:**
Actions in Helm templates refer to operations that can be performed within the template files. These include defining and using variables, applying functions, and controlling output based on conditions.

**Example Command:**
```bash
{{- if .Values.enabled }} apiVersion: v1 kind: ConfigMap metadata: name: my-config data: key: value {{- end }}
```

This example uses the `if` action to include the `ConfigMap` resource only if the `enabled` value in `values.yaml` is `true`.

---

### 3. Access Information in Template

**Explanation:**
You can access various pieces of information within Helm templates, such as values from `values.yaml`, chart metadata, and Kubernetes resource information. This allows you to dynamically generate configuration files.

**Example Command:**
```bash
{{ .Values.service.type }}
```

This example accesses the `type` field from the `service` section in the `values.yaml` file.

---

### 4. Pipe Function in Template

**Explanation:**
The pipe function in Helm templates allows you to pass the output of one function to another. It is used for chaining operations on template data.

**Example Command:**
```bash
{{ .Values.name | upper }}
```

This example converts the value of `name` in `values.yaml` to uppercase using the `upper` function.

---

### 5. Functions in Template

**Explanation:**
Helm templates support a variety of built-in functions for manipulating strings, lists, and other data types. Functions can be used to transform and format data.

**Example Command:**
```bash
{{ .Values.replicas | default 3 }}
```

This example uses the `default` function to set a default value of `3` if `replicas` is not defined in `values.yaml`.

---

### 6. Conditional Logic in Template

**Explanation:**
Conditional logic in Helm templates is used to include or exclude parts of the template based on certain conditions. It uses `if`, `else`, and `end` statements.

**Example Command:**
```bash
{{- if .Values.useCustomConfig }} apiVersion: v1 kind: ConfigMap metadata: name: custom-config data: key: custom-value {{- end }}
```
This example conditionally includes the `ConfigMap` resource based on the `useCustomConfig` value.

---

### 7. TypeCast Values to YAML in Template

**Explanation:**
Type casting in Helm templates allows you to convert values to a specific type. For example, you might need to ensure a value is treated as a string or integer.

**Example Command:**
```bash
{{ .Values.replicas | toYaml }}
```

This example converts the `replicas` value to YAML format, useful for generating YAML output directly.

---

### 8. Variables in Template

**Explanation:**
Variables in Helm templates allow you to store and reuse values within the template. They are defined using `define` and `include`.

**Example Command:**
```bash
{{- $name := .Values.name }} apiVersion: v1 kind: Service metadata: name: {{ $name }}
```

This example defines a variable `$name` that is used in the `Service` metadata.

---

### 9. Loops in Template and Validation of Template

**Explanation:**
Loops in Helm templates use the `range` function to iterate over lists or maps. This allows you to create multiple resources based on a list of values.

**Example Command:**
```bash
{{- range $index, $element := .Values.replicas }}
```

name: {{ $element }} replica: {{ $index }} {{- end }}
This example loops over a list of replicas and creates entries for each.

**Validation:**
Validation of Helm templates can be done using `helm lint` to ensure templates are free from syntax errors and best practice violations.

**Example Command:**
```bash
helm lint ./my-chart
```

This command checks the Helm chart located at `./my-chart` for potential issues and provides feedback.
