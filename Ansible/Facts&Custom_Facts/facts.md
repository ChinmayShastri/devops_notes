# Ansible Facts

## Overview

Ansible facts are pieces of information fetched from managed nodes during playbook execution. These facts include system details like network interfaces, OS version, or hardware specifics. Facts are stored in variables accessible within playbooks for conditional logic or configuration tasks.

## Key Points to Remember

- **Automatic Collection**: Ansible automatically gathers facts from managed nodes using the setup module.
- **Variables**: Facts are stored in Ansible variables (`ansible_facts`) and can be accessed like `ansible_facts['os_family']`.
- **Customization**: Users can customize fact gathering to collect additional information relevant to their environment.
- **Dynamic Usage**: Facts enable dynamic playbook behavior based on node characteristics.

## Example of Using Facts

```yaml
- name: Print OS details
  hosts: all
  tasks:
    - name: Display OS information
      debug:
        msg: "Operating System is {{ ansible_facts['distribution'] }} {{ ansible_facts['distribution_version'] }}"
```
This example uses the `debug` module to print the `OS distribution` and `version` fetched from all managed nodes.

