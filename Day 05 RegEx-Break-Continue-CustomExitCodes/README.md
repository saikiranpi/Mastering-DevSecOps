# Day 05 RegEx-Break-Continue-CustomExitCodes

![05](https://github.com/user-attachments/assets/27fd624d-bb91-46d5-b710-3b04db991e75)


## Features:
1. **Regular Expressions in Shell Scripts**
2. **Break and Continue for Iteration Control**
3. **Custom Exit Codes**
4. **Arrays in Shell Scripts**

---

## 1. **User Automation with Regex**

Regular expressions are a powerful tool in shell scripts for tasks like input validation. In this repository, we demonstrate how to use regular expressions to enforce patterns in username creation, specifically requiring users to create usernames that follow a certain format (e.g., `3 lowercase letters followed by 3 numbers`).

**Example:**
```bash
if [[ $USER =~ ^[a-z]{3}[0-9]{3}$ ]] ; then
  echo "Username is valid"
else
  echo "Username is invalid"
fi
```

## 2. **Common Regex Patterns:**

- `\d` - Matches any digit.
- `\D` - Matches any non-digit character.
- `\s` - Matches any whitespace.
- `\W` - Matches any non-word character (like punctuation).

**Example:**
To find a phone number pattern like `123-456-7890`, you can use:
```regex
\d{3}-\d{3}-\d{4}
```

---

## 3. **Iteration Control Using Break and Continue**

In shell scripting, `break` and `continue` are essential for controlling loops.

- **Break**: Used to exit a loop when a condition is met.
- **Continue**: Used to skip the current iteration of the loop and move on to the next iteration.

**Example:**
```bash
for i in {1..10}; do
  if [[ $i -eq 5 ]]; then
    break  # Stops the loop when i equals 5
  fi
  echo $i
done
```

## 4. **Custom Exit Codes**

In shell scripts, you can use custom exit codes to signal the success or failure of commands. For instance, if an AWS command runs successfully, but you encounter a regional endpoint issue, you can check the exit status to determine what happened.

**Example:**
```bash
aws ec2 describe-vpcs --region us-east-1
if [[ $? -ne 0 ]]; then
  echo "Incorrect region, exiting"
  exit 1
else
  echo "Correct region"
fi
```

## 5. **Arrays in Shell Scripts**

Arrays are a useful way to handle multiple values in a shell script. You can manipulate strings or data using array operations.

**Example:**
```bash
NAME='SaikiranPinapathruni'
echo ${#NAME}  # Outputs the length of the string

for i in {0..${#NAME}}; do
  echo ${NAME:$i:1}  # Prints one character at a time
done
```

---

## 6. **Practical Scenarios:**

1. **Regex for Phone Numbers**:
   - Extract phone numbers starting with a specific pattern like `1-234`.
   
   Example regex: `\d-[234]\d\d-\d\d\d-\d\d\d\d`

2. **Shell Script for User Creation**:
   - Create two users: one with lowercase letters and one with uppercase letters.
   
3. **Exit Code Handling**:
   - Check whether a command executed successfully and handle errors gracefully based on the exit code.

---

## Conclusion

This repository provides a detailed guide on how to use regular expressions, break/continue, arrays, and exit codes in shell scripts. These concepts are essential for automating tasks and creating efficient shell scripts that handle various scenarios gracefully.

---


