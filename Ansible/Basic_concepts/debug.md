# Logging Debug Statement Using Ansible Playbook

## Overview
In Ansible, you can log debug statements within playbooks to provide visibility into the execution flow, variable values, and other relevant information. Debug messages are useful for troubleshooting, verifying conditions, and ensuring tasks execute as expected.

### Key Points to Remember
- **Debug Module:** Ansible provides the `debug` module specifically for logging debug messages.
- **Message Format:** Debug messages can include variables and expressions using Jinja2 templating.
- **Execution Context:** Debug messages are printed to standard output (`stdout`) during playbook execution.
- **Conditional Debugging:** You can conditionally include debug messages based on task outcomes or variable values.

### Example Playbook with Debug Logging
```yaml
---
- name: Example Playbook with Debug Logging
  hosts: all  # Replace with your target hosts or host group
  gather_facts: true  # Ensures facts are gathered before tasks execute

  tasks:
    - name: Log debug message
      debug:
        msg: "This is a debug message. Hostname: {{ ansible_hostname }}, IP address: {{ ansible_host }}"

    # Add more tasks as needed
```
## Explanation

- **name:** Descriptive name for the playbook or task.
- **hosts:** Specifies the group of managed nodes on which the playbook will run (`all` targets all hosts).
- **gather_facts:** Ensures that Ansible gathers facts about managed nodes before executing tasks, enabling access to `ansible_hostname` and `ansible_host` facts.
- **debug:** Ansible module used to print debug messages during playbook execution.
  - **msg:** Debug message template that includes variables (`ansible_hostname` and `ansible_host`) for dynamic content.