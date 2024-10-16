#!/bin/bash

# Array of directories to be removed
folders_to_remove=(
    "Day 14 AWS-Terraform-Part-5"
    "Day 15 AWS-Terraform-Part-6 Modules-Part-2"
    "Day 16 AWS-Terraform-Part-8 TerraformCloud"
    "Day 17 AWS-Terraform-Part-9 GitLab-Pipeline"
    "Day 18 AWS-Packer"
    "Day 19 AWS-Ansible-Part-1"
    "Day 20 AWS-Ansible-Part-2"
    "Day 21 AWS-Ansible-Part-3"
    "Day 22 Ansible-Part-4 DynamicInventory_AWX"
    "Day 23 AWS-Ansible-Part-5 Roles-Collections"
    "Day 24 Ansible-Part-6 DynamicInventory"
    "Day 25 HashicorpVault AWSIntegration"
    "Day 26 Docker-Full-Course"
    "Day 27 Maven-JFrog-Sonarqube"
    "Day 28 SAST-AzureDevOps-Part-1"
    "Day 29 AzureDevOps-Part-2"
    "Day 30 AzureDevOps-Part-3"
    "Day 31 AzureDevOps-Part-4"
    "Day 32 AzureDevOps-Part-5"
    "Day 33 AzureDevOps-Part-6"
    "Day 34 Jenkins-Part-1"
    "Day 35 Jenkins-Part-2"
    "Day 36 Jenkins-Part-3"
    "Day 37 Jenkins-Part-4"
    "OP-LP GitHub-Actions-Part-1"
    "OP-LP GitHub-Actions-Part-2"
    "README.md"
)

# Loop through each folder and remove it
for folder in "${folders_to_remove[@]}"
do
    if [ -d "$folder" ]; then
        # If it's a directory, remove it
        rm -rf "$folder"
        echo "Removed directory: $folder"
    elif [ -f "$folder" ]; then
        # If it's a file, remove it
        rm -f "$folder"
        echo "Removed file: $folder"
    else
        echo "No such file or directory: $folder"
    fi
done

echo "Removal process completed."
