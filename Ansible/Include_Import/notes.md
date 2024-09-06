# `include` and `import` Modules in Ansible

Ansible provides `include` and `import` statements to help organize and reuse your playbooks, tasks, handlers, and variables. Understanding the differences between these modules and knowing when to use each is crucial for efficient playbook design.

## Key Points to Remember

1. **`include_tasks`**: Dynamically includes a list of tasks.
2. **`import_tasks`**: Statically imports a list of tasks at playbook compile time.
3. **`include_role`**: Dynamically includes a role.
4. **`import_role`**: Statically imports a role.
5. **Dynamic vs Static**: The primary difference is that `include` is dynamic and evaluated during runtime, while `import` is static and evaluated during playbook parsing.

## Key Components in the Example

1. **Using `include_tasks`**: Dynamically including tasks.
2. **Using `import_tasks`**: Statically importing tasks.
3. **Using `include_role`**: Dynamically including a role.
4. **Using `import_role`**: Statically importing a role.
5. **Choosing Between `include` and `import`**: Guidance on when to use each.

## Example

### 1. Using `include_tasks`

Dynamically including tasks:

```yaml
---
- hosts: localhost
  tasks:
    - name: Include tasks dynamically
      include_tasks: tasks.yml
      when: condition_is_met
```
2. Using import_tasks
Statically importing tasks:
```yaml
---
- hosts: localhost
  tasks:
    - name: Import tasks statically
      import_tasks: tasks.yml
```
3. Using include_role
Dynamically including a role:
```yaml
---
- hosts: localhost
  tasks:
    - name: Include role dynamically
      include_role:
        name: myrole
      when: condition_is_met
```
4. Using import_role
Statically importing a role:
```yaml
---
- hosts: localhost
  tasks:
    - name: Import role statically
      import_role:
        name: myrole
```
# Choosing Between include and import

### Use `include_tasks` or `include_role`:
- When you need conditional inclusion of tasks or roles.
- When the tasks or roles to be included are determined at runtime.
- Example: Including a set of tasks based on the value of a variable that is only known during play execution.

### Use `import_tasks` or `import_role`:
- When you want static inclusion that occurs at playbook parsing time.
- When the structure of your playbook is known beforehand and does not depend on runtime conditions.
- Example: Structuring your playbook to include a set of tasks that must always be run and should be checked for errors before execution.

## Conclusion
Understanding when to use `include` and `import` statements in Ansible is crucial for organizing and optimizing your playbooks. Use `include` for dynamic inclusion when the conditions or data required are only available at runtime. Use `import` for static inclusion when the tasks or roles are known ahead of time and should be validated during playbook parsing.
