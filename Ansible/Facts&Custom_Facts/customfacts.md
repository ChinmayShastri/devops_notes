# Create Custom Facts

## Overview

Custom facts in Ansible allow users to define and collect additional information beyond the default set of facts. These facts can be specific to applications, environment variables, or any custom data relevant to automation tasks. Custom facts are stored in JSON or INI format files and are retrieved using the setup module during playbook execution.

## Key Points to Remember

- **Format**: Custom facts are typically stored in JSON or INI format files within the `host_vars` or `group_vars` directories.
- **Declaration**: Define custom facts in files named after hosts (`hostname.json` or `hostname.ini`).
- **Usage**: Access custom facts like any other Ansible fact, using `ansible_facts['custom_fact_name']`.
- **Scope**: Custom facts provide flexibility in extending Ansible's capabilities tailored to specific requirements.

## Example of Creating Custom Facts

```json
# host_vars/web1.example.com.json
{
  "app_version": "1.2.3",
  "environment": "production"
}
```
In this example, `web1.example.com.json` defines custom facts `app_version` and `environment` for the host web1.example.com.