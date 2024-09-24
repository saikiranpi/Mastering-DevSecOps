# Day 02 Arguments-PassingSpecialparams

![02](https://github.com/user-attachments/assets/13165920-47f8-4843-b6d4-00af9ca7ac5f)


Welcome to the **Arguments-PassingSpecialparams** repository! This project focuses on demonstrating the usage of parameter passing, special shell parameters, and output redirection in Bash scripting, specifically in the context of AWS VPC management.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Scripts Overview](#scripts-overview)
  - [get_vpc.sh](#get_vpcsh)
  - [script.sh](#scriptsh)
- [Usage](#usage)
  - [Running `get_vpc.sh`](#running-get_vpcsh)
  - [Running `script.sh`](#running-scriptsh)
- [Understanding Special Parameters](#understanding-special-parameters)
  - [`$?`](#-exit-code)
  - [`$@` and `$*`](#-and-)
  - [`$#`](#-number-of-arguments)
- [Error Handling and Output Redirection](#error-handling-and-output-redirection)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This repository contains Bash scripts designed to interact with AWS EC2 to retrieve VPC (Virtual Private Cloud) details across different regions. The scripts demonstrate:

- **Passing Parameters**: How to pass and utilize arguments in Bash scripts.
- **Special Parameters**: Utilizing `$?`, `$@`, `$*`, and `$#` to handle script behavior based on inputs and command execution status.
- **Output Redirection**: Managing script output and errors effectively.

## Prerequisites

Before using the scripts, ensure you have the following installed and configured:

- **AWS CLI**: [Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- **jq**: A lightweight and flexible command-line JSON processor. [Installation Guide](https://stedolan.github.io/jq/download/)
- **Bash Shell**: Most Unix-based systems come with Bash pre-installed.
- **AWS Credentials**: Ensure your AWS credentials are configured with the necessary permissions to describe VPCs. [Configuration Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

## Getting Started

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/Arguments-PassingSpecialparams.git
   cd Arguments-PassingSpecialparams
   ```

2. **Make Scripts Executable**

   ```bash
   chmod +x get_vpc.sh script.sh
   ```

## Scripts Overview

### `get_vpc.sh`

This script retrieves VPC IDs from a specified AWS region.

**Script Content:**

```bash
#!/bin/bash

# Check if at least one argument is provided
if [ $# -gt 0 ]; then
    REGIONS=$@
    echo "Fetching VPC IDs for regions: $REGIONS"
    for REGION in $REGIONS; do
        aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
    done
else
    echo "You have provided $# arguments. Please provide at least one region."
    exit 1
fi
```

### `script.sh`

This script demonstrates the use of special parameters and error handling by checking the AWS CLI version before proceeding to retrieve VPC details.

**Script Content:**

```bash
#!/bin/bash

# Suppress AWS CLI version output
aws --version > /dev/null 2>&1

# Check if the previous command was successful
if [ $? -eq 0 ]; then
    REGIONS=$@
    echo "Fetching VPC IDs for regions: $REGIONS"
    for REGION in $REGIONS; do
        aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
    done
else 
    echo "Incorrect AWS command. Please check your AWS CLI installation."
    exit 1
fi
```

## Usage

### Running `get_vpc.sh`

Retrieve VPC IDs from one or multiple AWS regions.

**Example:**

```bash
./get_vpc.sh us-east-1 ap-south-1 us-east-2
```

**Output:**

```
vpc-0abcd1234efgh5678
vpc-1bcde2345fghij678
...
```

### Running `script.sh`

Ensure AWS CLI is correctly installed and then retrieve VPC IDs.

**Example:**

```bash
./script.sh us-east-1 us-east-2 ap-southeast-1
```

**Output:**

```
Fetching VPC IDs for regions: us-east-1 us-east-2 ap-southeast-1
vpc-0abcd1234efgh5678
vpc-1bcde2345fghij678
...
```

**Handling Errors:**

- If AWS CLI is not installed or incorrectly configured, the script will output:

  ```
  Incorrect AWS command. Please check your AWS CLI installation.
  ```

- If no regions are provided as arguments, the script will output:

  ```
  You have provided 0 arguments. Please provide at least one region.
  ```

## Understanding Special Parameters

### `$?` – Exit Code

- Represents the exit status of the last executed command.
- `0` indicates success, while any non-zero value indicates an error.

**Example:**

```bash
ls -al
echo $?  # Outputs 0 if successful
ls nonexistentfile
echo $?  # Outputs a non-zero value indicating an error
```

### `$@` and `$*` – All Positional Parameters

- Both represent all the arguments passed to the script.
- The difference lies in how they handle quoted arguments.

**Usage in Scripts:**

```bash
REGIONS=$@
# or
REGIONS=$*
```

### `$#` – Number of Arguments

- Represents the number of arguments passed to the script.

**Example:**

```bash
echo "Number of arguments: $#"
```

## Error Handling and Output Redirection

**Output Redirection:**

- **Standard Output (`stdout`)**: Default output stream.
- **Standard Error (`stderr`)**: Output stream for errors.

**Redirecting Outputs:**

- Suppress standard output:

  ```bash
  aws --version > /dev/null
  ```

- Suppress both standard output and standard error:

  ```bash
  aws --version > /dev/null 2>&1
  ```

**Using Conditional Statements:**

Utilize exit codes to control script flow.

```bash
aws --version > /dev/null 2>&1
if [ $? -eq 0 ]; then
    # Proceed with script
else
    echo "AWS CLI not found. Exiting."
    exit 1
fi
```
## License

This project is licensed under the [MIT License](LICENSE).

---

*Happy Scripting!*

