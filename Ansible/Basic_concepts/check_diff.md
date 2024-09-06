# Ansible Dry Run, Check, and Diff

## Overview
In Ansible, performing a dry run, check mode, or diff mode helps you simulate playbook execution, verify changes, and preview potential modifications without making actual changes to managed nodes.

### Key Points to Remember
- **Dry Run (`--check`):** Executes a playbook in check mode to simulate changes without actually applying them.
- **Diff (`--diff`):** Shows differences between expected and current states of managed nodes when making changes.
- **Usage:** Ensures playbook safety by previewing changes and verifying intended outcomes before execution.
- **Safety Measure:** Prevents unintended configuration changes or disruptions in production environments.

### Example of Using Check and Diff Modes
An example playbook demonstrating the use of `--check` and `--diff`:

```yaml
---
- name: Example Playbook with Check and Diff
  hosts: all
  gather_facts: false

  tasks:
    - name: Ensure a file exists
      file:
        path: /path/to/example_file.txt
        state: touch
        mode: '0644'
        owner: ansible
        group: ansible

    - name: Display playbook changes (check mode)
      debug:
        msg: "Changes to be applied: {{ ansible_check_mode }}"

    - name: Display differences (diff mode)
      debug:
        msg: "Differences: {{ ansible_diff }}"
      register: diff_output
      changed_when: false
      when: diff_output.stdout_lines | length > 0
```

- Command to use `--diff` and `--check`
```
ansible-playbook example.yml --diff --check
```