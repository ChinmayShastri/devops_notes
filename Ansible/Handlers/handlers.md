# Handlers in Ansible

## Overview
Handlers in Ansible are tasks that are only executed when notified by other tasks. They are typically used to restart services or perform actions that should only occur when a change has been made.

### Key Points to Remember
- **Triggered Execution:** Handlers are triggered by notify directives in tasks, ensuring they only run when changes have been made.
- **Service Management:** Commonly used to restart services after configuration changes.
- **Order of Execution:** Handlers execute at the end of each play, after all tasks have run.

### Example of Using Handlers
An example playbook demonstrating the use of handlers:

```yaml
---
- name: Example Playbook with Handlers
  hosts: web_servers
  become: yes
  tasks:
    - name: Ensure Apache is installed and service is started
      yum:
        name: httpd
        state: present
      notify: 
        - restart apache

  handlers:
    - name: restart apache
      service:
        name: httpd
        state: restarted
```
