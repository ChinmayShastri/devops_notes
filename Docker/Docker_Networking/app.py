## Simple Examples

### Container to Local Host Communication


import requests

response = requests.get('http://host.docker.internal:8000')
print(response.text)
