# Day 06: Functions and Scripts

## Overview

In this session, we explore the concept of functions in shell scripting and how they can be beneficial in managing code effectively. While functions might not be heavily utilized in shell scripting, they become crucial when you transition to languages like Python.

## What is a Function?

A **function** is a block of code that can be called whenever needed. It allows for code reuse and better organization.

### Example in Python

```python
def addition(a, b):  # Passing two parameters: a and b
    return a + b  # Returns the sum of a and b

# Calling the function
result_a = addition(2, 3)
result_b = addition(4, 5)
result_c = addition(10, 20)

print(result_a + result_b + result_c)  # Outputs the sum of all results
```

### Importance of Functions

Functions will only execute when they are called. For instance, in Terraform, you might use functions like:

```hcl
count = 3 
element
length
```

### Installing Docker

To install Docker, you would typically call a function from a script like this: [Docker Installation](https://get.docker.com).

## Defining Functions in Shell Scripting

In shell scripting, you can define functions in two ways:

1. **Using the `function` keyword:**

   ```bash
   function hello {
       # code
   }
   ```

2. **Using parentheses:**

   ```bash
   hello() {
       # code
   }
   ```

## Checking Installed Commands

You can check if a command is installed using:

```bash
command -v jq
echo $?  # Returns the exit status of the last command

command -v aq
echo $?
```

If the `command_exist` function wasn’t used, you would need to enter these commands multiple times in your script, making functions very useful for reducing redundancy.

## Running the Delete Volume Scripts

1. **Create three 1 GB EBS volumes.**
2. To automate this task daily, we’ll use **Cron Jobs**.

### Understanding Cron Jobs

To set up a Cron job, you would:

```bash
crontab -e  # Edit the crontab file
# Add the following line:
* * * * * sudo bash /root/deleteebs.sh us-east-1  # Adjust timing as needed
```

Ensure that your script is saved at `/root/deleteebs.sh`.

## Scheduling Adjustments

If you want the task to run every 10 minutes, use:

```
*/10 * * * * sudo bash /root/deleteebs.sh us-east-1
```

## Nginx Server Installation and Test

1. Install the Nginx server on your instance.
2. Access it and generate a simple HTML game:

   ```bash
   nano /var/www/html/index.html  # Make your changes here
   ```

3. Set up uptime monitoring with StatusCake:

   - Log in with Google.
   - Create a new uptime test with the URL and desired parameters.

## Calling Multiple Functions

In your script, you can call multiple functions. At the end of your script, you might have:

```bash
vpc $@  # Allows passing multiple regions
```

## Interview Question Example

**Question:** In one system, how can I find files larger than 10 MB?

**Answer:** You can list files and check their sizes with `du`, but using the `find` command is more efficient:

```bash
find / -size +50M -size -60M 2>/dev/null
```

### Explanation:

- `/`: The starting directory for the search (root).
- `-size +50M`: Finds files larger than 50 MB.
- `-size -60M`: Finds files smaller than 60 MB.
- `2>/dev/null`: Redirects error messages (e.g., permission denied) to `/dev/null`.

## Log Rotation Script

Log rotation helps manage log files by preventing them from growing indefinitely. When log files reach a certain size, the rotation script will execute to keep things organized.

---
