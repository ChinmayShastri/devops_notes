# Ansible Operations Overview

## How Ansible Executes Tasks on Clients

Ansible uses a push mechanism to execute tasks on client machines (managed nodes). Here's an overview of how it works:
- **Inventory:** Ansible reads inventory files (typically located in `inventory/` directory) to determine which hosts to manage.
- **SSH:** Ansible connects to managed nodes via SSH (or WinRM for Windows nodes).
- **Modules:** Ansible uses modules (small programs that Ansible invokes from the control machine to run tasks) to perform operations on managed nodes.
- **Execution:** Tasks defined in playbooks or executed ad-hoc are run sequentially on the managed nodes.
- **Idempotency:** Ansible ensures that tasks are idempotent, meaning they only apply changes when necessary.

## Syntax of Ad-Hoc Ansible Commands

Ad-hoc commands in Ansible are used for quick tasks without writing a playbook. Here's the syntax:
```bash
ansible <hosts> -m <module_name> -a "<module_arguments>"
```
## Examples:
- Managing Files/Directories on Ansible Clients

```bash
ansible web_servers -m file -a "path=/path/on/remote/server/new_directory state=directory"
```
- Checking Disk Space
```
ansible database_servers -m command -a "df -h"
```
- Restarting Services
```
ansible all -m service -a "name=httpd state=restarted"
```
- Copying Files
```
ansible web_servers -m copy -a "src=/path/to/local/file dest=/path/on/remote/server"
```
- Installing Packages
```
ansible app_servers -m yum -a "name=nginx state=present"
```
- Managing Users
```
ansible all -m user -a "name=john state=present"
```
- Gathering Facts
```
ansible all -m setup
```