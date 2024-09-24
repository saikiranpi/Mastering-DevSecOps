#  Introduction-BaseLabCreation - Variables-Script-grep-awk-cut

![1](https://github.com/user-attachments/assets/bb18e257-ad41-4d32-acfe-4963bb23cb8f)

# DevSecOps Scripting Course - Day 01 & 02

## Course Overview
This course is designed to help you get started with DevSecOps by covering shell scripting, cloud infrastructure, and essential security tools. You'll work with real-world tasks, using various tools and services to build a secure and functional DevSecOps environment.

---

## Prerequisites
### Cloud Platforms:
- **AWS**, **Azure**, or **GCP** – choose any one.

### DevSecOps Tools:
- **SonarQube** – for code quality and security analysis.
- **HashiCorp Vault** – for managing secrets and passwords.
- **Trivy** – for container image scanning.
- **Ansible Vault** – for secure secret management.
- **CISO** – for cybersecurity insights.

### Tools Required for Scripting:
- **JQ** – For parsing JSON data.
- **Net-tools** – Network utilities like `ifconfig`, `nslookup`.
- **Unzip** – To extract `.zip` files.

---

## Task: Create a Base Lab Environment

### Objective:
Set up a VPC, create a new key pair, deploy an instance, and access it using PuTTY.

### Steps:
1. **Create VPC and Instance**:
   - Create a new VPC with a single EC2 instance.
   - Generate a new key pair (PEM format).

2. **Generate PPK File for PuTTY**:
   - Open PuTTYgen and load the PEM file.
   - Generate and save a new private key (PPK format).

3. **Login via PuTTY**:
   - Open PuTTY and connect to `ubuntu@<EC2-IP>`.
   - Customize window settings (bold text, window size, colors).
   - Under `Connection > SSH > Auth`, browse and load your PPK file.
   - Save the session as "SecOps Session" for future use.

> **Note:** In production, avoid running `sudo su -` as you may not have root access. Running root commands could result in access to sensitive operations, like deleting logs.

4. **Install Required Tools**:
   ```bash
   sudo apt install jq -y && apt install net-tools -y && apt install unzip -y
   ```

---

## Shell Scripting Tasks

### Task 1: Using Tmux
To manage multiple servers or sessions, break the screen into two:
- Use `Ctrl + b`, then `Shift + "` to split the screen horizontally.
- For vertical split: `Ctrl + b`, then `Shift + 5`.
- Useful for monitoring multiple servers.

### Task 2: Print Time Repeatedly
Print the date and time every second for 10 seconds:
```bash
for i in {1..10}
do
  echo $(date)
  sleep 1
done
```

> **Note:** To get only the day, date, and time, modify the above script using `awk`:
```bash
for i in {1..10}
do
  echo $(date) | awk -F " " '{print $1, $2, $3, $4}'
  sleep 1
done
```

### Task 3: Understanding Variables in Shell Scripting
Variable declaration is useful for repeated values.
1. Declaring a variable and using it:
   ```bash
   RG='Saikiran-SecOps'
   echo $RG
   echo "${RG}"
   ```

2. Using variables with single and double quotes:
   ```bash
   X=10
   RG='Saikiran-SecOps-$X'  # Won't expand the variable
   echo $RG  # Outputs: Saikiran-SecOps-$X

   RG="Saikiran-SecOps-$X"  # Will expand the variable
   echo $RG  # Outputs: Saikiran-SecOps-10
   ```

---

## Task 4: AWS CLI and Data Manipulation

### Install AWS CLI:
Run the following commands:
```bash
sudo apt install awscli -y
aws configure  # Configure AWS access and secret keys.
```

### S3 Bucket Example:
1. List the contents of an S3 bucket:
   ```bash
   aws s3 ls
   ```

2. Use `cut` to extract specific fields:
   ```bash
   aws s3 ls | cut -d ' ' -f1,2,3
   ```

3. Use `awk` for more complex field manipulation:
   ```bash
   aws s3 ls | awk -F " " '{print $3,$2,$1}'
   ```

4. Use `grep` to find specific patterns:
   ```bash
   aws s3 ls | grep -E ^www[-]
   ```

---

## Shell Script Example: `get_bucket.sh`

```bash
#!/bin/bash
aws s3 ls | cut -d ' ' -f 3 | grep -E ^www[-]
echo "Hello Saikiran, welcome to DevSecOps!"
```

### Execution:
```bash
chmod +x get_bucket.sh
./get_bucket.sh
```

> **Note:** Do **not** use `chmod 777` as it grants full permissions to everyone, which is a security risk. Use `chmod 700` instead to restrict access to the owner.

---

## Debugging Scripts

To enable debugging in a script:
```bash
#!/bin/bash
set -x  # Enable debugging
```

This will print each command before executing it, helping you to debug.

---

## Conclusion
This README covers Day 01 of DevSecOps, focusing on basic shell scripting, AWS tools, and security best practices. You should now be familiar with setting up a basic lab, working with shell scripts, and using AWS CLI for DevSecOps tasks.
