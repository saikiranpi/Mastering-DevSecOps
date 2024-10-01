# Day 07 GIT Azure Terraform JIRA

![a-3d-scene-with-a-terraform-logo-on-one-side-and-a-UJgTFv-TSs-3jQkKJsSVGQ-TP18QzX3TRGEJlCl2aGlmA](https://github.com/user-attachments/assets/df80ecf8-a04e-45b1-9540-0759a6ea8fa2)


## Overview

This project demonstrates using Git for version control while developing infrastructure with Terraform on Azure. We'll cover setting up Git, Terraform, and pushing infrastructure code to a remote GitHub repository.

## Table of Contents
1. [Git and Remote Repositories](#git-and-remote-repositories)
2. [Setting Up Environment](#setting-up-environment)
3. [Azure Service Principal](#azure-service-principal)
4. [Terraform Project](#terraform-project)
5. [Managing State and GitHub](#managing-state-and-github)
6. [Branching Strategy](#branching-strategy)

## Git and Remote Repositories

Git is a tool that helps track changes in code and push it to a remote repository such as GitHub, GitLab, Bitbucket, or Azure DevOps. In a collaborative environment, all team members work on the same repository to manage changes effectively.

For this project, we are using Terraform to create infrastructure on Azure, and Git to version control the Terraform code.

## Setting Up Environment

### Step 1: Install Git and Terraform
- **Git Installation**:
  - Download Git and check the installation via PowerShell: 
    ```sh
    git --version
    ```

- **Terraform Installation**:
  - Create a folder named `software` in C drive.
  - Download Terraform binary, save it in the folder, extract it, and add its path to the system environment variables:
    ```sh
    sysdm.cpl > Advanced > Environment Variables > Path > Edit > New (paste path)
    ```

### Step 2: Create Project Folder
- Create a folder named `Azure-Tera-Git`.
- Inside, create a file called `Credentials` to store credentials.

## Azure Service Principal

To authenticate between Azure and Terraform:

1. **Azure EntraID** > **App Registration** > **New Registration**.
   - Register an app named `DevSecOps-Saikiran` (Service Principal).
   - Collect `ClientID` and `TenantID`.

2. Go to **Certificates & Secrets** and create a new client secret.

3. Navigate to **Subscriptions**:
   - Create a subscription and copy the `SubscriptionID`.
   - Assign roles:
     - **IAM** > **Role Assignment** > **Privilege Admin Roles** > **Contributor** > **Select Members**.

## Terraform Project

### Resources to Create
- Resource Groups (RG)
- Virtual Network & Subnets
- Network Security Group (NSG) and Rules
- Random Passwords
- Save Passwords in Key Vault
- Deploy Virtual Machine using passwords from the Key Vault

### Code Structure
- **provider.tf**: Configure Azure provider for Terraform.
  ```hcl
  provider "azurerm" {
    features {}
  }
  ```

### Commands
- **Initialize Terraform**:
  ```sh
  terraform init
  ```
  (This downloads the Azure provider.)

- **Deploy Resources**:
  - Create Resource Groups, Virtual Networks, etc., using the keyword `resource`.
  - The `resource` block is used for all resources, including security groups, VPCs, etc.

- **Manage State File**:
  - Keep track of the infrastructure state.
  - Store the state file in an Azure Storage account to maintain consistency:
    - **Storage Accounts** > **Containers** > Create container (`tfstate`).

- **Apply Configuration**:
  ```sh
  terraform init; terraform fmt; terraform validate; terraform plan; terraform apply
  ```

## Managing State and GitHub

### Initialize Git Repository
- Create a GitHub repository as **private**.
- Set up SSH keys for authentication:
  ```sh
  ssh-keygen
  ```
  Copy the `.pub` key and store it in GitHub.

### Version Control Steps
1. **Initialize Git**:
   ```sh
   git init
   ```
2. **Create `.gitignore`** to exclude unnecessary files.
3. **Commit Changes**:
   ```sh
   git add . && git commit -m "terraform Azure Base Code"
   ```
4. **Push to Remote Repository**:
   ```sh
   git branch -m master development
   git push origin development
   ```

### Virtual Network Deployment
- Add code for virtual networks, apply changes, and push the updated code to GitHub.

## Branching Strategy

### Create Branches
- **Production Branch**:
  ```sh
  git branch -b production
  git push origin production
  ```
- **Feature Branch for Updates**:
  - Create new features in separate branches:
    ```sh
    git checkout -b feature/subnet
    ```
  - Develop, test, and then create a Pull Request (PR) for merging changes into the **development** or **production** branch.

### Merging with Pull Request
- Create a PR in GitHub to merge changes from development to production.
- Add comments and request approval from reviewers.
- Once approved, merge the code.

### Create JIRA Branch
- Create a branch based on a JIRA ticket for tracking:
  ```sh
  git checkout -b JIRA-123
  ```
- Implement Azure Storage account code, commit, and push to the JIRA branch.
- Create a PR to merge the feature, add relevant comments, and ensure code review.

