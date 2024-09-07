### Create a file named `/etc/ansible/facts.d/custom.fact` on the managed node with the following content:
```
[general]
environment=production
region=us-east
app_version=1.2.3
```