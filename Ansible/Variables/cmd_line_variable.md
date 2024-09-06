# Passing Variable to Ansible Playbook Through Command Line

## Overview
Ansible allows passing variables directly from the command line during playbook execution. This method is useful for dynamically altering playbook behavior without modifying the playbook itself.

### Key Points to Remember
- **--extra-vars:** Command-line option used to pass variables to Ansible playbooks.
- **Format:** Variables are specified as key-value pairs, separated by spaces.
- **Usage:** Enables flexibility in playbook execution by injecting runtime values from the command line.

### Example of Passing Variables Through Command Line
An example playbook demonstrating how to pass variables using `--extra-vars`:

```yaml
---
- name: Example Playbook with Command-line Variables
  hosts: localhost
  gather_facts: false

  tasks:
    - name: Display passed variable
      debug:
        msg: "Passed variable 'my_var' has value {{ my_var }}"
```
### Command-line Execution
- Execute the playbook `example_playbook.yaml` with a variable named `my_var`:
```
ansible-playbook example_playbook.yaml --extra-vars "my_var=value"
```
