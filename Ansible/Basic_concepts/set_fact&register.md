# Uses of set_fact and register in Ansible

## Overview
In Ansible, `set_fact` and `register` are mechanisms used to store and manipulate data during playbook execution. They enable capturing command output, evaluating conditions, and storing variables for later use within playbooks.

### Key Points to Remember

- **set_fact:**
  - **Purpose:** Used to set a variable directly within a playbook.
  - **Scope:** Variables defined with `set_fact` are available only within the current playbook and are not stored persistently.
  - **Example:**
    ```yaml
    - name: Set a fact dynamically
      set_fact:
        my_variable: "value"
    ```
  
- **register:**
  - **Purpose:** Captures the output of a task or command into a variable.
  - **Scope:** Variables registered with `register` can be used across plays and can store complex data structures like lists or dictionaries.
  - **Example:**
    ```yaml
    - name: Execute a command and register output
      shell: echo "Hello, world!"
      register: command_output

    - name: Print registered output
      debug:
        var: command_output.stdout
    ```

### Example Playbook Using set_fact and register
An example playbook demonstrating the use of both `set_fact` and `register`:

```yaml
---
- name: This is the example for set_facts and register
  host: all
  remote_user: ec2-user
  become: yes
  become_user: root

  task:
    - name: Retrive installed shell version
      shell: "bash --version"
      register: shell_version

    - set_facts:
        bash_version: {{ bash_ver.stdout_lines[0].split()[3] }}
        my_value: Bash version

    -debug:
      var: bash_version

```
