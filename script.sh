#!/bin/bash

# Array of directories and titles with spaces
days=(
    "Day 07 Git-1"
    "Day 08 Git-2"
    "Day 09 Git-3"
    "Day 10 GitHub-Actions-Part-1"
    "Day 11 GitHub-Actions-Part-2"
    "Day 12 AWS-Terraform-Part-1"
    "Day 13 AWS-Terraform-Part-2"
    "Day 14 AWS-Terraform-Part-3"
    "Day 15 AWS-Terraform-Part-4"
    "Day 16 AWS-Terraform-Part-5"
    "Day 17 AWS-Terraform-Part-6 Modules-Part-2"
    "Day 18 AWS-Terraform-Part-8 TerraformCloud"
    "Day 19 AWS-Terraform-Part-9 GitLab-Pipeline"
    "Day 20 AWS-Packer"
    "Day 21 AWS-Ansible-Part-1"
    "Day 22 AWS-Ansible-Part-2"
    "Day 23 AWS-Ansible-Part-3"
    "Day 24 Ansible-Part-4 DynamicInventory_AWX"
    "Day 25 AWS-Ansible-Part-5 Roles-Collections"
    "Day 26 Ansible-Part-6 DynamicInventory"
    "Day 27 HashicorpVault AWSIntegration"
    "Day 28 Docker-Full-Course"
    "Day 29 Maven-JFrog-Sonarqube"
    "Day 30 SAST-AzureDevOps-Part-1"
    "Day 31 AzureDevOps-Part-2"
    "Day 32 AzureDevOps-Part-3"
    "Day 33 AzureDevOps-Part-4"
    "Day 34 AzureDevOps-Part-5"
    "Day 35 AzureDevOps-Part-6"
    "Day 36 Jenkins-Part-1"
    "Day 37 Jenkins-Part-2"
    "Day 38 Jenkins-Part-3"
    "Day 39 Jenkins-Part-4"
)

# Loop through each entry and create directory with README.md file
for day in "${days[@]}"; do
    # Create directory
    mkdir -p "$day"

    # Create README.md file with the title
    echo "# $day" > "$day/README.md"

    echo "Created $day with README.md"
done

echo "All directories and README.md files have been created!"
