![a-3d-render-of-a-youtube-thumbnail-with-the-text-d-6vFmUIlxRQ2-ERpv-XkPmg-98wY6FuxTTeyHEHWaD8X5w](https://github.com/user-attachments/assets/5ff94fd5-09ee-4fc9-87df-e16f87bab83c)


# Terraform Day 01 Provider Block - Resource Block - S3 backend - Data Source - Remote Data Source Backend 

# Code used in video https://github.com/saikiranpi/Terraformsingleinstance.git

# Infrastructure as Code (IaC) with Terraform and Cloud Native Tools (CNT)

## Overview

In this repository, we explore Infrastructure as Code (IaC) using both Cloud Native Tools (CNT) and Terraform. We'll compare AWS CloudFormation (CFT), Azure Resource Manager (ARM), and GCP Deployment Manager with Terraform. Additionally, we'll cover practical Terraform code examples for AWS, including how to manage infrastructure with modules, data sources, and remote state management.

### Tools Overview:

1. **AWS**: CloudFormation (CFT)
2. **Azure**: Azure Resource Manager (ARM)
3. **GCP**: Deployment Manager

### Key Differences between CNT (CFT, ARM) & Terraform:

| Feature                          | CFT & ARM                           | Terraform                      |
|-----------------------------------|--------------------------------------|---------------------------------|
| Language                          | JSON or YAML (All configs in one file) | HashiCorp Configuration Language (HCL) |
| Complexity                        | Learning JSON/YAML is difficult       | HCL is simpler and modular     |
| Cloud Compatibility               | AWS (CFT), Azure (ARM) only          | Multi-cloud (AWS, Azure, GCP)  |
| Module Support                    | No                                  | Yes, with reusable modules     |
| Workspace Support                 | No                                  | Yes, supports multiple workspaces |
| Dry-Run Capability                | Limited                             | `terraform plan` for effective dry-run |
| Importing Resources               | Complex in AWS, not available in ARM | Simple with `terraform import` |

---

## Terraform and Other HashiCorp Tools:

Terraform is a HashiCorp tool that is cloud-agnostic, which means you can use the same logic to deploy resources across multiple clouds, including AWS, Azure, and GCP. Alongside Terraform, HashiCorp also provides:

- **Packer**: For image automation
- **Consul**: For service discovery and cluster management
- **Vault**: For secure secrets management
- **Nomad**: For workload orchestration (alternative to Kubernetes)

---

## Getting Started with Terraform

### 1. Main Configuration (`main.tf`):
This is the main file where we define which cloud provider we will be deploying resources to, in this case, AWS.

```hcl
provider "aws" {
  region = "us-west-2"
}

# Other resource definitions will follow...
```

You don't need to hard-code your AWS credentials in the code; instead, you can configure them using the `aws configure` command after installing the AWS CLI.

---

### 2. Create Your First VPC (`vpc.tf`):

In Terraform, any service created is referred to as a **resource**.

```hcl
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "My-VPC"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "My-Internet-Gateway"
  }
}
```

### 3. Using Data Sources:

Data sources are used to fetch information from existing resources in your cloud environment. For example, we can fetch an existing VPC using its tag name:

```hcl
data "aws_vpc" "Test-Vpc" {
  filter {
    name   = "tag:Name"
    values = ["Test-Vpc"]
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.Test-Vpc.id
}
```

### 4. Remote State Management:

After deploying your resources, Terraform generates a state file. This state file can be reused to deploy the same infrastructure in another project. We can manage this using Terraform's remote state:

```hcl
terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "project1/terraform.tfstate"
    region = "us-west-2"
  }
}
```

After setting this up, initialize the backend:

```bash
terraform init
```

---

### Sample Workflow:

1. **Write Terraform Config**: Create resource files (`vpc.tf`, `ec2.tf`).
2. **Initialize**: Run `terraform init` to set up the environment.
3. **Plan**: Run `terraform plan` to perform a dry-run and check for any potential issues.
4. **Apply**: Run `terraform apply` to provision the resources.
5. **State Management**: Use remote state for managing large infrastructures and multiple environments.

### Additional Resources:

- **AWS Resources**: VPC, Internet Gateway, Subnets, Security Groups, EC2 instances.
- **Data Sources**: Reuse and reference existing resources.
- **Remote State**: Manage infrastructure state across projects.

---

## Conclusion

Terraform offers greater flexibility and multi-cloud support compared to cloud-native tools like CloudFormation (CFT) and Azure Resource Manager (ARM). It simplifies resource management through modules, reusable code, and a powerful state management system. This repository contains code examples and best practices for managing your cloud infrastructure using Terraform.
