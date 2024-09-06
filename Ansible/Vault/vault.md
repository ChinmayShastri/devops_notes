# Ansible Vault

Ansible Vault is a feature within Ansible that allows you to keep sensitive data such as passwords or keys in encrypted files, rather than plaintext in your playbooks or roles. This is crucial for maintaining security, especially when your playbooks are stored in a version control system.

## Key Points to Remember

1. **Encryption and Decryption**: Ansible Vault can encrypt any YAML file or variable file used by Ansible. It can also decrypt these files during the runtime of your playbooks.
2. **Password Management**: You can specify the vault password directly or use a password file to manage it more securely.
3. **Integration with Playbooks**: Encrypted files can be seamlessly integrated into your playbooks, roles, and tasks.
4. **Vault IDs**: Ansible Vault supports multiple vault IDs, allowing for different encryption keys for different parts of your playbook.

## Key Components in the Example

1. **Creating a Vault File**: Encrypt a file to protect sensitive data.
2. **Editing a Vault File**: Modify the encrypted file.
3. **Decrypting a Vault File**: View the contents of an encrypted file.
4. **Using Vault in Playbooks**: Incorporate the encrypted file into your playbook.

## Example

### 1. Creating a Vault File

To create an encrypted file, use the following command:

```
ansible-vault create secret.yml
```
You'll be prompted to enter a password. After entering the password, a text editor will open where you can input your sensitive data. For example:
```
db_password: supersecret
api_key: ABCDEFGHIJKLMNOP
```
### 2. Editing a Vault File
To edit an existing encrypted file, use:
```
ansible-vault edit secret.yml
```
You'll be prompted to enter the password you used to encrypt the file. After entering the password, the file will open in a text editor for you to make changes.

### 3. Decrypting a Vault File
To view the contents of an encrypted file without editing it, use:
```
ansible-vault view secret.yml
```
You'll need to enter the password to view the decrypted content.

### 4. Using Vault in Playbooks
You can include the encrypted file in your playbooks as follows:
```
---
- hosts: localhost
  vars_files:
    - secret.yml
  tasks:
    - name: Print the decrypted variables
      debug:
        msg: "The database password is {{ db_password }} and the API key is {{ api_key }}"
```
- When running the playbook, you need to provide the vault password:
`ansible-playbook playbook.yml --ask-vault-pass`
- Alternatively, you can use a password file:
`ansible-playbook playbook.yml --vault-password-file /path/to/password/file`

### 5. Encrypting an Existing File
If you already have a file you want to encrypt, use:
```
ansible-vault encrypt existing_file.yml
```
### 6. Decrypting an Encrypted File
If you want to decrypt a file, use:
```
ansible-vault decrypt secret.yml
```
### 7. Re-keying a Vault File
To change the password of an encrypted file, use:
```
ansible-vault rekey secret.yml
```
You'll be prompted for the old password and then the new password.

## Conclusion

`Ansible Vault is a powerful tool to enhance the security of your Ansible workflows by encrypting sensitive data. By integrating encrypted files seamlessly into your playbooks, you ensure that sensitive information is protected even when stored in version control systems.`