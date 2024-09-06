# Variables in Ansible Playbook

## Overview
Variables in Ansible playbooks are used to store and manage data that can be reused across tasks, plays, and even roles. They allow for dynamic and flexible playbook execution based on different conditions and environments.

### Key Points to Remember
- **Declaration:** Variables in Ansible can be defined at different levels: playbook level, role level, or inventory level.
- **Types:** Ansible supports different types of variables, including:
  - **Static Variables:** Defined directly in playbooks or inventory files.
  - **Dynamic Variables:** Fetched from facts gathered during playbook execution.
  - **User-defined Variables:** Created using `vars` or `vars_files` directives.
- **Scope:** Variable scope can be global (available to all plays), play-specific, or limited to specific tasks.
- **Usage:** Variables are accessed using Jinja2 templating (`{{ variable_name }}`) within playbooks, allowing for dynamic content generation.

### Example of Using Variables
```yaml
---
- name: Example Playbook with Variables
  hosts: all
  gather_facts: true

  vars:
    http_port: 80
    app_name: myapp

  tasks:
    - name: Ensure HTTP service is running
      service:
        name: httpd
        state: started

    - name: Deploy application
      git:
        repo: "https://github.com/example/{{ app_name }}.git"
        dest: "/var/www/{{ app_name }}"
        version: "master"

    - name: Open port {{ http_port }} in firewall
      firewalld:
        port: "{{ http_port }}/tcp"
        state: enabled
        permanent: true
        immediate: true
```
Explanation
- **vars:** Defines playbook-level variables (`http_port` and `app_name`) that can be used throughout the playbook.
- **tasks:** Tasks within the playbook access these variables using Jinja2 templating `({{ http_port }}`,`{{ app_name }}`) to ensure dynamic behavior.
- **Usage:** Variables allow for parameterization and customization of tasks based on defined values (`http_port`, `app_name`) and dynamic conditions.