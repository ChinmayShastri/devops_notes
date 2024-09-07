### 1. File Module – Create or Remove a File
```yml
- name: Create a new file
  file:
    path: /tmp/sample.txt
    state: touch
```
### 2. User Module – Manage User Accounts
```yml
- name: Create a new user
  user:
    name: john
    state: present
```
### 3. Package Module and service Module
```yaml
- name: Install nginx
  package:
    name: nginx
    state: present
- name: Start nginx
  service:
    name: nginx
    state: started
```
### 4. Git Module – Clone a Git Repository
```yml
- name: Clone a git repository
  git:
    repo: 'https://github.com/user/repo.git'
    dest: /var/www/html/repo
```
### 5. S3 Module – Manage S3 Buckets
```yml
---
- name: Ansible S3 module example
  hosts: localhost
  tasks:

    - name: Upload a file to S3 bucket
      s3:
        bucket: my-s3-bucket
        object: backup/latest-backup.tar.gz
        src: /local/path/to/latest-backup.tar.gz
        mode: put
        region: us-east-1
      aws_access_key: "{{ aws_access_key }}"
      aws_secret_key: "{{ aws_secret_key }}"
      s3_url: "https://s3.amazonaws.com"

    - name: Download a file from S3 bucket
      s3:
        bucket: my-s3-bucket
        object: backup/latest-backup.tar.gz
        dest: /local/path/to/downloaded-backup.tar.gz
        mode: get
        region: us-east-1
      aws_access_key: "{{ aws_access_key }}"
      aws_secret_key: "{{ aws_secret_key }}"
      s3_url: "https://s3.amazonaws.com"

```

### Explanation:
1. Upload a File:
  - `bucket`: Specifies the S3 bucket name (my-s3-bucket).
  - `object`: Path in the S3 bucket where the file will be uploaded (backup/latest-backup.tar.gz).
  - `src`: Local path of the file to upload (/local/path/to/latest-backup.tar.gz).
  - `mode`: Set to put to upload the file to S3.
  - `aws_access_key` and `aws_secret_key`: AWS credentials for accessing S3.
  - `s3_url`: The S3 service URL.
2. Download a File:
  - Similar to the upload, but with mode set to `get`, which downloads the specified file from S3 to a local path (`/local/path/to/downloaded-backup.tar.gz`).

This example shows how to automate file backup to and retrieval from AWS S3 using Ansible.