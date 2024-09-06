# AWS IAM (Identity and Access Management)

## Overview
- **Definition:** AWS IAM is a web service that helps you securely control access to AWS resources for your users.
- **Purpose:** To manage access to AWS services and resources securely by creating and managing AWS users and groups, and assigning permissions.

## Key Features
- **Users:** Individual accounts that represent a person or service that interacts with AWS resources.
- **Groups:** Collections of IAM users that you can manage as a unit.
- **Roles:** Allows you to delegate access to users or services without sharing long-term credentials.
- **Policies:** Documents that define permissions and can be attached to users, groups, or roles.
- **Multi-Factor Authentication (MFA):** Adds an extra layer of protection for user credentials.
- **Access Keys:** Used for programmatic access to AWS services via the AWS CLI, SDKs, or APIs.

## Common Use Cases
- **Granular Access Control:** Define precise permissions to AWS resources for different users or services.
- **Temporary Credentials:** Use roles to provide temporary access to AWS resources.
- **Secure Cross-Account Access:** Allow users from one AWS account to access resources in another account securely.
- **Least Privilege Principle:** Grant only the permissions required to perform a task, minimizing security risks.

## Best Practices
- **Enable MFA:** Add MFA for extra security on critical accounts, especially the root account.
- **Use Roles:** Prefer IAM roles over sharing long-term credentials.
- **Principle of Least Privilege:** Assign the minimum necessary permissions to users, groups, and roles.
- **Regular Audits:** Regularly review and audit IAM policies, roles, and permissions.
- **Password Policies:** Enforce strong password policies for IAM users.

## Key Points to Remember
- **IAM is essential for managing access:** Control who can access AWS resources and what actions they can perform.
- **Supports various security best practices:** Including MFA, temporary credentials, and the principle of least privilege.
- **Policies are flexible:** Use JSON policy documents to define permissions with precision.
- **Integration with other AWS services:** IAM seamlessly integrates with other AWS services for secure and efficient access management.