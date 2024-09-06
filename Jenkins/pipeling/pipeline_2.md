# Jenkins Pipeline with Environment Variables, Input, and Agent

## Explanation
This Jenkins Pipeline example demonstrates the use of environment variables, input for manual approval, and specifying an agent. It simulates a real-life CI/CD pipeline that builds, tests, and deploys an application while interacting with user input and managing environment configurations.

### Components:
1. **Environment Variables**: Used to define variables that can be referenced throughout the pipeline.
2. **Input**: Provides a way to pause the pipeline and wait for manual approval before proceeding.
3. **Agent**: Defines where the pipeline or a stage should run.

---

## Interview Questions and Answers:

### 1. What are environment variables in Jenkins Pipelines, and why are they used?
**Answer**: Environment variables in Jenkins Pipelines are used to store configuration values that can be accessed throughout the pipeline. They are useful for defining values such as credentials, file paths, or other configuration settings that should not be hardcoded in the pipeline script.

### 2. How does the `input` step work in a Jenkins Pipeline?
**Answer**: The `input` step pauses the pipeline execution and waits for human input before proceeding. It is often used for manual approval steps or to gather additional information from users.

### 3. What is the purpose of the `agent` directive in a Jenkins Pipeline?
**Answer**: The `agent` directive specifies where the pipeline or specific stages should run. It can be set to `any` to run on any available agent or defined to use a specific label or Docker image for execution.

### 4. How can environment variables be used to manage credentials in Jenkins Pipelines?
**Answer**: Environment variables can be used to manage credentials by storing them in Jenkins credentials store and referencing them in the pipeline using environment variable names. This avoids hardcoding sensitive information directly into the pipeline script.

### 5. Why is it important to use the `input` step in a production pipeline?
**Answer**: The `input` step is important in a production pipeline for scenarios that require manual intervention or approval before proceeding, such as deploying to a production environment. It ensures that critical steps are reviewed and approved by a user.

---
## Jenkins Pipeline Example with Environment Variables, Input, and Agent

```groovy
pipeline {
    agent any

    environment {
        // Define environment variables
        APP_NAME = 'my-application'
        DEPLOY_ENV = 'staging'
    }

    stages {
        stage('Build') {
            steps {
                echo "Building ${env.APP_NAME}..."
                // Simulate build process
                sh 'echo Building...'
            }
        }
        
        stage('Test') {
            steps {
                echo "Testing ${env.APP_NAME}..."
                // Simulate test process
                sh 'echo Testing...'
            }
        }
        
        stage('Approval') {
            steps {
                // Input step for manual approval
                input message: 'Approve deployment to production?', ok: 'Deploy'
            }
        }
        
        stage('Deploy') {
            when {
                expression { env.DEPLOY_ENV == 'staging' }
            }
            steps {
                echo "Deploying ${env.APP_NAME} to ${env.DEPLOY_ENV}..."
                // Simulate deploy process
                sh 'echo Deploying...'
            }
        }
    }
}
```

## Explanation of the Pipeline Example

### 1. `agent any`
The `agent any` directive indicates that the pipeline can run on any available Jenkins agent. It ensures that the pipeline has flexibility in where it executes.

### 2. `environment { ... }`
The `environment` block defines environment variables that are available throughout the pipeline. Here, `APP_NAME` and `DEPLOY_ENV` are set for use in subsequent stages.

### 3. `stage('Build') { ... }`
This stage handles the build process of the application. It uses the `echo` command to print the build status and simulates the build process with a shell command.

### 4. `stage('Test') { ... }`
This stage is responsible for testing the application. It similarly uses the `echo` command and a shell command to simulate the test process.

### 5. `stage('Approval') { ... }`
The `Approval` stage includes an `input` step that pauses the pipeline and waits for manual approval before proceeding. The message prompts the user to approve deployment to production.

### 6. `stage('Deploy') { ... }`
This stage handles the deployment of the application. The `when` condition ensures that the deployment only occurs if `DEPLOY_ENV` is set to 'staging'. It prints a message and simulates deployment with a shell command.

### Conclusion
This pipeline example demonstrates the use of environment variables to manage configuration, the `input` step to pause for manual approval, and the `agent` directive to specify where the pipeline runs. It simulates a complete CI/CD workflow with build, test, approval, and deploy stages.

