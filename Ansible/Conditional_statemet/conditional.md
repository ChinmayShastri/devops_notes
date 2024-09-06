# Example Playbook with Conditional Statements

## Overview
Conditional statements in Ansible allow you to execute tasks based on specified conditions, providing flexibility and control over playbook execution.

### Key Points to Remember
- **when:** Keyword used to define conditions for task execution in Ansible playbooks.
- **Conditional Expressions:** Support logical operators (`and`, `or`, `not`) and comparison operators (`==`, `!=`, `<`, `>`, etc.) to evaluate conditions.
- **Usage:** Enables playbook tasks to be conditionally executed based on variables, facts, or registered outputs.

### Example Playbook
An example playbook demonstrating conditional statements:

```yaml
---
- name: Example Playbook with Conditional Statements
  hosts: all
  gather_facts: true

  tasks:
    - name: Ensure Apache is installed on Debian
      apt:
        name: apache2
        state: present
      when: ansible_os_family == 'Debian'

    - name: Ensure Nginx is installed on Red Hat
      yum:
        name: nginx
        state: present
      when: ansible_os_family == 'RedHat'

    - name: Display message on CentOS or Ubuntu
      debug:
        msg: "This task runs on CentOS or Ubuntu"
      when: ansible_distribution == 'CentOS' or ansible_distribution == 'Ubuntu'
```
## Explanation

### apt
Installs Apache (`apache2`) only if the managed node's OS family (`ansible_os_family`) is Debian.

### yum
Installs Nginx (`nginx`) only if the managed node's OS family is Red Hat (`RedHat`).

### debug
Displays a message only on CentOS or Ubuntu (`CentOS` or `Ubuntu`).
