# Tags in Ansible

Tags in Ansible allow you to run specific tasks or sets of tasks within your playbooks. This is useful for selectively executing parts of your playbooks without running the entire playbook.

## Key Points to Remember

1. **Defining Tags**: Tags can be assigned to tasks or blocks of tasks within a playbook.
2. **Running Tagged Tasks**: Use the `--tags` or `--skip-tags` options with `ansible-playbook` to control which tasks are executed.
3. **Combining Tags**: Multiple tags can be combined to fine-tune task execution.
4. **Default Tags**: Use `always` to mark tasks that should always be executed regardless of tags.

## Key Components in the Example

1. **Basic Tagging**: Assigning tags to tasks.
2. **Running Tagged Tasks**: Executing specific tagged tasks.
3. **Skipping Tagged Tasks**: Skipping tasks with specific tags.
4. **Combining Tags**: Using multiple tags for more control.

## Example

### 1. Basic Tagging

Assigning tags to tasks:

```yaml
---
- hosts: localhost
  tasks:
    - name: Install Git
      apt:
        name: git
        state: present
      tags: 
        - install

    - name: Configure Git
      command: git config --global user.name "John Doe"
      tags:
        - configure

    - name: Install Curl
      apt:
        name: curl
        state: present
      tags:
        - install
```
### 2. Running Tagged Tasks
Running only the tasks tagged with `install`:
```
ansible-playbook playbook.yml --tags install
```
3. Skipping Tagged Tasks
Skipping tasks tagged with `configure`:
```
ansible-playbook playbook.yml --skip-tags configure
```
### 4. Combining Tags
Using multiple tags for more control:
```
ansible-playbook playbook.yml --tags "install,configure"
```
### 5. Default Tags
Using the `always` tag to mark tasks that should always be executed:
```yaml
---
- hosts: localhost
  tasks:
    - name: Install dependencies
      apt:
        name: "{{ item }}"
        state: present
      loop:
        - git
        - curl
      tags:
        - always
```
### 6. Tags with Roles
Assigning tags to roles:
```yaml
---
- hosts: localhost
  roles:
    - role: webserver
      tags: web
    - role: database
      tags: db
```
Running the playbook with the `web` tag:
`ansible-playbook playbook.yml --tags web`

## Conclusion
` Tags in Ansible provide a flexible way to control which tasks are executed in your playbooks. By using tags, you can run specific tasks or skip tasks as needed, making your playbook runs more efficient and tailored to your needs.`