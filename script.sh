#!/bin/bash

# Array of file names
filenames=(
"Introduction-BaseLabCreation"
"Variables-Script-grep-awk-cut"
"Arguments-PassingSpecialparams"
"OutputRedirection-For-While"
"UserAutomation"
"RegEx-Break-Continue-CustomExitCodes"
"Functions"
"Scripts"
"Git-1"
"Git-2"
"Git-3"
"GitHub-Actions-Part-1"
"GitHub-Actions-Part-2"
"AWS-Terraform-Part-1"
"AWS-Terraform-Part-2"
"AWS-Terraform-Part-3"
"AWS-Terraform-Part-4"
"AWS-Terraform-Part-5"
"AWS-Terraform-Part-6[Modules-Part-2]"
"AWS-Terraform-Part-8[TerraformCloud]"
"AWS-Terraform-Part-9[GitLab-Pipeline]"
"AWS-Packer"
"AWS-Ansible-Part-1"
"AWS-Ansible-Part-2"
"AWS-Ansible-Part-3"
"Ansible-Part-4[DynamicInventory_AWX]"
"AWS-Ansible-Part-5[Roles-Collections]"
"Ansible-Part-6[DynamicInventory]"
"HashicorpVault-AWSIntegration"
"Docker-Part-1"
"Docker-Part-2"
"Dockerfile-Part-1"
"Dockerfile-Part-2-Compose"
"DockerSwarm-Part-1"
"DockerSwarm-Part-2-Secrets-Config-Limits"
"Traefik-IngressController"
"Observability_Elastic"
"Observability_Elastic_Part_2"
"Kubernetes_Overview"
"Prometheus-PagerDuty-Slack"
"Maven-JFrog-Sonarqube"
"SAST-AzureDevOps-Part-1"
"AzureDevOps-Part-2"
"AzureDevOps-Part-3"
"AzureDevOps-Part-4"
"AzureDevOps-Part-5"
"AzureDevOps-Part-6"
"Jenkins-Part-1"
"Jenkins-Part-2"
"Jenkins-Part-3"
"Jenkins-Part-4"
)

# Loop to create folders Day 01 ... Day 51 with README.md
for i in {1..51}; do
    # Format day as Day XX
    folder=$(printf "Day %02d %s" $i "${filenames[$i-1]}")
    
    # Create the folder
    mkdir -p "$folder"
    
    # Create the README.md file inside the folder
    echo "# ${filenames[$i-1]}" > "$folder/README.md"
    
    echo "Created $folder with README.md for ${filenames[$i-1]}"
done

echo "All folders and README.md files created successfully!"

