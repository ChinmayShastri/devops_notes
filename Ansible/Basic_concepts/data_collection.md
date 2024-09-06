# Data Collection in Ansible

## Overview
Data collection in Ansible refers to the process of gathering information from managed nodes during playbook execution. This information can include system details, configuration states, or custom metrics that aid in decision-making or reporting within automation workflows.

### Key Points to Remember
- **Setup Module:** Ansible uses the `setup` module by default to collect facts about managed nodes, including hardware details, network configurations, and installed software.
- **Custom Data Gathering:** Beyond default facts, Ansible allows for custom data collection using specialized modules or scripts tailored to specific requirements.
- **Integration:** Collected data can be integrated with external systems or used within Ansible playbooks for conditional tasks, dynamic inventory updates, or reporting.
- **Performance:** Efficient data collection ensures accurate and timely information retrieval without impacting overall playbook execution performance.

### Example of Data Collection Using Ansible
An example of using the `setup` module to collect data from managed nodes:

```yaml
---
- name: Example Playbook for Data Collection
  hosts: all
  gather_facts: true  # Ensures facts are gathered before tasks execute

  tasks:
    - name: Display gathered facts
      debug:
        var: ansible_facts
```
## Explanation
- **gather_facts:** When set to `true`, Ansible gathers facts using the `setup` module before executing tasks. Facts are stored in `ansible_facts` and can be accessed for further processing or debugging.
- **debug:** The `debug` module prints `ansible_facts`, which includes a wide range of information about managed nodes gathered by the `setup` module.