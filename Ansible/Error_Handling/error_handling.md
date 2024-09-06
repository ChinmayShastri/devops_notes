# Error Handling in Ansible

Error handling in Ansible is crucial for managing failures and ensuring that your automation workflows are robust and reliable. Ansible provides several mechanisms to handle errors and control the flow of tasks.

## Key Points to Remember

1. **Ignore Errors**: Use the `ignore_errors` directive to continue execution even if a task fails.
2. **Failed When**: Customize failure conditions using the `failed_when` directive.
3. **Retries and Delays**: Use the `retries` and `delay` directives to retry a task upon failure.
4. **Handlers**: Trigger handlers based on task results.
5. **Block, Rescue, and Always**: Use `block`, `rescue`, and `always` for structured error handling.

## Key Components in the Example

1. **Ignoring Errors**: Using the `ignore_errors` directive.
2. **Custom Failure Conditions**: Using the `failed_when` directive.
3. **Retries and Delays**: Retrying tasks with `retries` and `delay`.
4. **Using Handlers**: Triggering actions based on task results.
5. **Block, Rescue, and Always**: Structured error handling using `block`, `rescue`, and `always`.

## Example

### 1. Ignoring Errors

Continuing execution even if a task fails:

```yaml
---
- hosts: localhost
  tasks:
    - name: Attempt to install a package
      apt:
        name: non_existent_package
        state: present
      ignore_errors: yes

    - name: This task will run even if the previous task fails
      debug:
        msg: "The previous task was ignored."
```
### 2. Custom Failure Conditions
Using `failed_when` to customize failure conditions:
```yaml
---
- hosts: localhost
  tasks:
    - name: Check the status of a service
      command: systemctl status myservice
      register: service_status
      failed_when: "'inactive' in service_status.stdout"
```
### 3. Retries and Delays
Retrying a task upon failure:
```yaml
---
- hosts: localhost
  tasks:
    - name: Retry task with delay
      command: /bin/false
      register: result
      retries: 5
      delay: 10
      until: result.rc == 0
```
### 4. Using Handlers
Triggering handlers based on task results:
```yaml
---
- hosts: localhost
  tasks:
    - name: Make a change that requires a service restart
      copy:
        src: /source/file
        dest: /etc/myconfig.conf
      notify: Restart myservice

  handlers:
    - name: Restart myservice
      service:
        name: myservice
        state: restarted
```
### 5. Block, Rescue, and Always
Structured error handling using `block`, `rescue`, and `always`:
```yaml
---
- hosts: localhost
  tasks:
    - name: Structured error handling
      block:
        - name: Task that might fail
          command: /bin/false
      rescue:
        - name: Handle the failure
          debug:
            msg: "The task failed and we are handling it."
      always:
        - name: This will always run
          debug:
            msg: "This task runs regardless of the previous tasks' success or failure."
```
## Conclusion
Error handling in Ansible ensures that your automation workflows are robust and can gracefully handle failures. By using directives like `ignore_errors`, `failed_when`, and `structured error` handling with `block`, `rescue`, and `always`, you can control the flow of tasks and manage errors effectively.