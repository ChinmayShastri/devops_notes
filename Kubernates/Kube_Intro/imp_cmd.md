# Update Image, Rollout, and Scaling in Kubernetes

Kubernetes provides powerful mechanisms for updating container images, managing rollouts, and scaling applications. These features ensure applications are up-to-date, resilient, and can handle varying loads efficiently.

## Key Points to Remember

### Update Image
- **Updating a Container Image**: To update the container image of a running application, modify the Deployment manifest to specify the new image version.
  ```sh
  kubectl set image deployment/<deployment-name> <container-name>=<new-image>:<tag>
  kubectl set image deployment/nginx-deployment nginx=nginx:1.19.0
  ```
### Rollout

- **Rollout**: The process of deploying new versions of applications.
- **Rollout Status**: Check the status of a rollout.
    ```sh
    kubectl rollout status deployment/<deployment-name>
    ```
- Rollback: Revert to a previous version if there is an issue with the new deployment
    ```
    kubectl rollout undo deployment/<deployment-name>
    ```

### Pause and Resume Rollouts:
- Pause:
    ```
    kubectl rollout pause deployment/<deployment-name>
    ```
- Resume:
    ```
    kubectl rollout resume deployment/<deployment-name>
    ```
### Scaling
- **Scaling Up/Down**: Adjust the number of replicas of a Deployment.
    ```
    kubectl scale deployment/<deployment-name> --replicas=<number>
    kubectl scale deployment/nginx-deployment --replicas=5
    ```

## Key Components in the Example

1. **Deployment**: Manages the deployment of containerized applications.
2. **ReplicaSet**: Ensures a specified number of replicas of a Pod are running at any given time.
3. **Pod**: The smallest deployable units in Kubernetes, which can contain one or more containers.

## Interview Questions and Answers

1. **How do you update the image of a running application in Kubernetes?**
   - You update the image by modifying the Deployment manifest or using the command:
     ```sh
     kubectl set image deployment/<deployment-name> <container-name>=<new-image>:<tag>
     ```
   - For example:
     ```sh
     kubectl set image deployment/nginx-deployment nginx=nginx:1.19.0
     ```

2. **How can you check the status of a rollout in Kubernetes?**
   - You can check the status of a rollout using the command:
     ```sh
     kubectl rollout status deployment/<deployment-name>
     ```

3. **What command do you use to roll back to a previous deployment in Kubernetes?**
   - To roll back to a previous deployment, use the command:
     ```sh
     kubectl rollout undo deployment/<deployment-name>
     ```

4. **How do you pause and resume rollouts in Kubernetes?**
   - To pause a rollout:
     ```sh
     kubectl rollout pause deployment/<deployment-name>
     ```
   - To resume a rollout:
     ```sh
     kubectl rollout resume deployment/<deployment-name>
     ```

5. **What is the purpose of scaling in Kubernetes?**
   - Scaling in Kubernetes adjusts the number of replicas of a Deployment to handle varying loads and ensure application availability.

6. **How do you scale a Deployment in Kubernetes?**
   - You scale a Deployment using the command:
     ```sh
     kubectl scale deployment/<deployment-name> --replicas=<number>
     ```
   - For example, to scale to 5 replicas:
     ```sh
     kubectl scale deployment/nginx-deployment --replicas=5
     ```

7. **What are the key components involved in updating images, rollouts, and scaling in Kubernetes?**
   - **Deployment**: Manages the deployment of containerized applications.
   - **ReplicaSet**: Ensures a specified number of replicas of a Pod are running at any given time.
   - **Pod**: The smallest deployable units in Kubernetes, which can contain one or more containers.
