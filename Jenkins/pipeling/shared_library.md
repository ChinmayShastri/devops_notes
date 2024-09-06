# Using Shared Libraries in Jenkins Pipelines

## What is a Jenkins Shared Library?
A Jenkins Shared Library is a mechanism for reusing and sharing code across multiple Jenkins pipelines. It allows teams to define common pipeline logic and functions that can be used across different Jenkinsfiles, promoting DRY (Don't Repeat Yourself) principles and centralizing pipeline code management.

### Benefits of Using Shared Libraries:
- **Code Reusability**: Common functions and stages can be reused across different pipelines.
- **Maintainability**: Centralized code management makes it easier to update and maintain pipeline logic.
- **Consistency**: Ensures consistent pipeline processes and practices across projects.

### Structure of a Shared Library:
A shared library typically consists of:
- **`vars/` Directory**: Contains global variables and simple functions that can be used in Jenkinsfiles.
- **`src/` Directory**: Contains Groovy classes and more complex functions.
- **`resources/` Directory**: Contains files and templates that can be used in the library.

## Interview Questions and Answers:

### 1. What are Jenkins Shared Libraries and why are they used?
**Answer**: Jenkins Shared Libraries are a way to encapsulate and reuse common pipeline code across multiple Jenkins pipelines. They help in reducing duplication, improving maintainability, and ensuring consistency in pipeline processes.

### 2. How do you create a Jenkins Shared Library?
**Answer**: To create a Jenkins Shared Library, you need to create a repository with the following structure:
- `vars/` directory for global variables and functions
- `src/` directory for Groovy classes and complex logic
- `resources/` directory for additional files and templates

You then configure the library in Jenkins by adding it under "Manage Jenkins" → "Configure System" in the "Global Pipeline Libraries" section.

### 3. How do you use a Shared Library in a Jenkins Pipeline?
**Answer**: To use a Shared Library, you need to include it in your Jenkinsfile using the `@Library` annotation or the `library` step. This allows you to call functions and use global variables defined in the shared library.

### 4. What is the purpose of the `vars/` directory in a Jenkins Shared Library?
**Answer**: The `vars/` directory is used to define global variables and simple functions that can be used directly in Jenkinsfiles. It helps in exposing reusable code to be easily accessible across different pipelines.

### 5. How can you ensure that your Jenkins Shared Library is version-controlled?
**Answer**: The shared library should be stored in a separate Git repository, which can be version-controlled. Jenkins can be configured to use specific branches or tags of the shared library to ensure that the correct version is used.

---
## Example of Using Shared Libraries in Jenkins Pipelines

### Shared Library Structure:
- **Repository Name**: `my-shared-library`
- **Directory Structure**:
  - `vars/`
    - `greeting.groovy`
  - `src/com/example/`
    - `Utils.groovy`

### `vars/greeting.groovy`
```groovy
def call(String name) {
    echo "Hello, ${name}!"
}
```
package com.example
```groovy
class Utils {
    static String getCurrentDate() {
        return new Date().format('yyyy-MM-dd')
    }
}
```
### jenkinsfile
```groovy
@Library('my-shared-library') _

pipeline {
    agent any

    stages {
        stage('Greeting') {
            steps {
                greeting('World')
            }
        }

        stage('Date') {
            steps {
                script {
                    def currentDate = com.example.Utils.getCurrentDate()
                    echo "Current Date: ${currentDate}"
                }
            }
        }
    }
}
```
---
## Explanation of the Shared Library Example

## Shared Library Structure

### 1. `vars/greeting.groovy`
This file defines a global variable and function named `greeting`. When called with a name, it prints a greeting message. The function is defined in a way that allows it to be used directly in Jenkinsfiles.

### 2. `src/com/example/Utils.groovy`
This file defines a Groovy class `Utils` with a static method `getCurrentDate`. This method returns the current date formatted as 'yyyy-MM-dd'. The `src/` directory is used for more complex Groovy code that is organized into classes.

## Jenkinsfile Explanation

### 1. `@Library('my-shared-library') _`
The `@Library` annotation imports the shared library named `my-shared-library` into the Jenkinsfile. This allows access to the global variables and functions defined in the shared library.

### 2. `stage('Greeting')`
In this stage, the `greeting` function from the `vars/greeting.groovy` file is called with the argument 'World'. It prints "Hello, World!" to the console.

### 3. `stage('Date')`
In this stage, the `getCurrentDate` method from the `com.example.Utils` class is called. It retrieves and prints the current date.

## Summary
The example demonstrates how to define and use functions and classes within a Jenkins Shared Library. The `vars` directory is used for simple functions, while the `src` directory is used for more complex code. The Jenkinsfile shows how to call these functions and classes to achieve reusable and maintainable pipeline code.

