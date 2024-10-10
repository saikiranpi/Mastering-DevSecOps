![Untitled design](https://github.com/user-attachments/assets/d7d9ad96-e14e-40d8-ac6f-93004fb69da0)



# Terraform Day 02 - Dependencies, Variables,  TFVars and Create Before Destroy

Today, we'll dive into **dependencies in Terraform** and cover two main topics:  
1. **Implicit and Explicit Dependencies**  
2. **Variables and TFVars**

## Dependencies in Terraform

Terraform automatically handles resource dependencies in two ways:

### 1. Implicit Dependencies
An **implicit dependency** occurs when one resource refers to the attribute of another resource. For example, when creating a VPC and then an Internet Gateway, the Internet Gateway doesn't inherently know that it must wait for the VPC to be created. However, when you reference the VPC ID in the Internet Gateway resource, Terraform understands that the VPC must be created first.

- **Example:**  
  When you declare a VPC, its ID is generated only after it is created. Any resource, like a subnet or Internet Gateway, that references this VPC ID creates an implicit dependency.

### 2. Explicit Dependencies
Sometimes, implicit dependencies aren’t enough. For example, if we want the **S3 bucket** to be created only after the VPC is created, we need to use explicit dependencies. This is done using the `depends_on` argument in Terraform.

- **Example:**  
  A **NAT Gateway** should only be created after a **Route Table** has been established. If the NAT Gateway is created before the route table, it won’t function as expected. This is where **explicit dependencies** come into play using `depends_on`.

### Task Example: VPC, Internet Gateway, and S3 Bucket
- First, we’ll create a **VPC** and an **S3 bucket**. Since there's no direct dependency between the VPC and the S3 bucket, Terraform may create the S3 bucket first.
- To enforce order, we’ll explore how to use `depends_on` to make sure that resources like the **NAT Gateway** and **S3 bucket** are created in the correct sequence.

### Create S3 Buckets
1. Create an `s3.tf` file.
2. In it, define three S3 buckets.
3. Observe that the S3 buckets and VPC will deploy in parallel because there is no dependency between them.

To ensure that the S3 bucket is created **after** the VPC, we’ll add explicit dependencies using the `depends_on` argument.

---

## Variables and TFVars

### Variables
Variables allow us to easily change values without editing the code directly. This makes managing infrastructure more flexible and reusable.

### TFVars
Terraform variable values can be stored in separate `.tfvars` files, helping to:
- Keep the code clean.
- Manage sensitive data or multiple environments efficiently.

### Removing Lock Files
Remember to clean up all `terraform.tfstate.lock` files before redeploying to avoid locking issues.

---

## Create Before Destroy

When replacing resources, Terraform often follows the **create before destroy** pattern. This ensures minimal downtime by creating a replacement resource before destroying the original.

- **Example:**  
  When updating a resource like a **Key Pair** or upgrading a component, Terraform will first create the new key, then destroy the old one after the new one is functional.

### Task: Example Deployment
1. Deploy the resource.
2. Run `terraform plan` and observe the changes. (Copy the output to a Notepad for reference.)
3. Deploy the resource.
4. Add an additional name to the S3 bucket and reapply the changes to see how Terraform manages updates.

---

## Prevent Destroy

Use `prevent_destroy` to safeguard critical resources. This is especially useful for resources like databases or sensitive buckets where destruction could cause significant issues.

---

By the end of this session, you’ll have a deeper understanding of how Terraform handles dependencies, the flexibility of variables, and the best practices for managing infrastructure deployment and updates.

---

