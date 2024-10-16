
# Terraform Functions Part: 1

![Thumb](https://github.com/user-attachments/assets/69bc2680-9ffe-4852-a7f0-f2b9ed8496c5)


This repository demonstrates the efficient use of Terraform functions to manage infrastructure as code without duplicating resources. The focus is on creating modular, scalable, and maintainable Terraform configurations.

## Overview

In this project, we will utilize Terraform functions and techniques to create a cloud infrastructure with multiple instances and subnets efficiently. We aim to minimize duplication in our code by using various Terraform functionalities such as `count`, `for_each`, `locals`, and dynamic blocks.

### Key Objectives

- Clone the repository.
- Streamline Terraform configuration files by removing unnecessary variables and resources.
- Implement best practices for variable management and resource creation.

## Repository Structure

- **main.tf**: Main configuration file containing resource definitions.
- **variables.tf**: File for variable definitions.
- **terraform.tfvars**: File for variable values.
- **locals.tf**: File for local variables.
- **subnet.tf**: File dedicated to managing subnet resources.
- **routing_table.tf**: File for route table configurations.
- **sg.tf**: File for security group configurations.

## Step-by-Step Tasks

### 1. Clone Repository

Start by cloning the repository to your local environment.

### 2. Clean Up Terraform Files

#### variables.tf
- **Remove**:
  - Access Key and Secret Key
  - AMI
  - Internet Gateway (IGW)
  - All CIDR and Subnet entries
- **Keep**:
  - Availability Zones (AZs)
  - Environment (ENV)
- **Define Variables**:
  - Create a variable for `Public_cidr_block` to manage the creation of 6 subnets (3 private and 3 public).
  - Define `Private_cidr_block`.

#### terraform.tfvars
- Copy all relevant variables from `variables.tf` and paste them into `terraform.tfvars`.
- **Remove** routing table configurations to let them inherit the VPC name.

### 3. Modify main.tf

- **Remove** Access Key and Secret Key entries.
- **Paste** remote backend configuration.
- **Update VPC Tags**: Instead of passing values for each tag, utilize `locals` for common tag values.

### 4. Create locals.tf

- Define local variables for common tag values.
- Access local variables in the VPC configuration using the appropriate syntax.

### 5. Update Subnet Configurations

#### Public Subnets
- Remove additional public subnets (subnet 2 and 3).
- Use `count = 3` to create the necessary number of public subnets.
- Utilize the `element` function to reference specific CIDR blocks based on the count index.

#### Private Subnets
- Rename resources to reflect they are private.
- Adjust tags accordingly.

### 6. Route Tables Configuration

- Define separate route tables for public and private subnets.
- **Comment Out** route table associations temporarily.
- Use `terraform plan` to preview subnet configurations.

### 7. Organize Subnets into subnet.tf

- Move all subnet resources to `subnet.tf`.
- Use `count.index + 1` to manage subnet indexing dynamically.

### 8. Create routing_table.tf

- Move all route table blocks to this file.
- Address subnet ID issues by ensuring the correct variable references.
- Introduce Splat syntax for managing multiple subnet associations.

### 9. Dynamic Security Group Management

#### sg.tf
- Copy necessary configurations from `main.tf` into `sg.tf`.
- Add ports 443 and 22 to the security group.
- Implement dynamic ingress rules by creating a `service_ports` variable.
- Populate this variable with values for multiple ports: `["80", "8080", "443", "8443", "22", "3306", "1433"]`.

### 10. Finalization

- Run `terraform fmt` to format the configuration files.
- Execute `terraform plan` and `terraform apply` to validate and deploy the infrastructure.
- Check inbound and outbound rules to ensure proper configuration.

## Conclusion

By following these steps and utilizing Terraform functions, we can efficiently manage our cloud infrastructure with minimal duplication and improved scalability. This project serves as a template for creating robust Terraform configurations.

---
