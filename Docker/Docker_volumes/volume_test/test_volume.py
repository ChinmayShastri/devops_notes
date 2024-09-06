# test_volume.py
import os

file_path = '/app/data/test.txt'

# Create directory if it does not exist
os.makedirs(os.path.dirname(file_path), exist_ok=True)

# Write to a file
with open(file_path, 'w') as file:
    file.write('Hello, Docker volumes!')

print(f'File written to {file_path}')