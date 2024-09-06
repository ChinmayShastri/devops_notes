# Ansible Modules

## Overview
Ansible modules are standalone scripts that Ansible uses to automate tasks on managed nodes. They can be executed directly by playbooks or ad-hoc commands to perform specific actions like managing files, installing packages, or configuring services.

### Key Points to Remember
- **Purpose:** Modules are the building blocks of Ansible automation, executing tasks on managed nodes.
- **Types:** Include core modules (bundled with Ansible) and custom modules (created by users or community).
- **Parameters:** Modules accept parameters to define actions, such as file paths, package names, or service states.
- **Execution:** Modules run on managed nodes and communicate results back to the Ansible control node.

### Example of Using Modules
```yaml
- name: Install nginx package
  hosts: web_servers
  tasks:
    - name: Ensure nginx is installed
      package:
        name: nginx
        state: present
```
This example uses the `package` module to ensure the `nginx` package is installed on hosts in the `web_servers` group.