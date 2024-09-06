# Introduction to Ansible

## Overview
- **Definition:** Ansible is an open-source automation tool used for configuration management, application deployment, and task automation.
- **Purpose:** To simplify the management of IT infrastructure by automating repetitive tasks and streamlining operations.

## Key Concepts
- **Task:** a call to a specific Ansible module Module – the actual unit of code executed by Ansible on your own host or a remote host. Modules are indexed by category (database, file, network, …) and also referred to as task plugins.

- **Inventory:** An inventory file defines hosts and/or groups of hosts on which Ansible tasks executed upon. The inventory file can be in one of many formats, depending on the inventory plugins you have. The most common formats are INI and YAML.

- **Play:** One or more tasks executed on a given host(s)

- **Playbook:** One or more plays. Each play can be executed on the same or different hosts

- **Role:** Ansible roles allows you to group resources based on certain functionality/service such that they can be easily reused. In a role, you have directories for variables, defaults, files, templates, handlers, tasks, and metadata. You can then use the role by simply specifying it in your playbook.

## Key Features
- **Agentless:** Ansible does not require any agents to be installed on the managed nodes. It uses SSH for communication.
- **Easy to Learn:** Ansible uses a simple, human-readable language (YAML) to describe automation tasks, making it easy to learn and use.
- **Idempotent:** Ansible ensures that changes are only applied when necessary, preventing unintended modifications and maintaining system consistency.
- **Extensible:** Ansible supports a wide range of modules for managing different systems and applications. Custom modules can also be written in any programming language.

## Architecture
- **Control Node:** The machine where Ansible is installed and from which commands are executed.
- **Managed Nodes:** The devices or servers that Ansible manages. These do not require Ansible to be installed.
- **Inventory:** A file that lists the managed nodes and groups them logically.
- **Playbook:** A file containing a series of tasks written in YAML to be executed on the managed nodes.
- **Modules:** Reusable, standalone scripts that Ansible executes on managed nodes to perform specific tasks.

## Common Use Cases
- **Configuration Management:** Automating the setup and maintenance of software configurations.
- **Application Deployment:** Streamlining the deployment process of applications across multiple servers.
- **Provisioning:** Automating the creation of infrastructure resources such as virtual machines, containers, and networks.
- **Continuous Delivery:** Integrating with CI/CD pipelines to automate testing and deployment.

## Best Practices
- **Use Playbooks:** Write playbooks to define and organize automation tasks.
- **Organize Inventory:** Use inventory files to logically group managed nodes.
- **Modularize Code:** Break down complex tasks into smaller, reusable roles and modules.
- **Use Version Control:** Store playbooks, roles, and inventory files in version control systems like Git.
- **Test Changes:** Test playbooks in a staging environment before applying them to production.

## Key Components in the Example
- **name:** Descriptive name for the playbook or task.
- **hosts:** Specifies the group of managed nodes on which the playbook will run.
- **become:** Escalates privileges to perform tasks that require elevated permissions.
- **tasks:** List of tasks to be performed on the managed nodes.
- **apt:** Module used to manage packages on Debian-based systems.
- **service:** Module used to manage services on the managed nodes.

## Key Points to Remember
- **Ansible is an open-source automation tool for configuration management, application deployment, and task automation.**
- **Agentless architecture:** Uses SSH for communication, no agents required on managed nodes.
- **Human-readable YAML syntax:** Easy to learn and write playbooks.
- **Idempotency:** Ensures consistent and repeatable results.
- **Extensible with modules and roles:** Supports a wide range of tasks and custom extensions.