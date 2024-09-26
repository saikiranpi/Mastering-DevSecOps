# Day 04 UserAutomation

![a-3d-render-of-a-dark-themed-cybersecurity-confere-TU2eVZcIRda9RcDkaObkyg-yt2DCIPgQIaI9w7_DYZnYw](https://github.com/user-attachments/assets/75314cc4-86a5-41bb-b47b-acb0d3765555)

This script automates the process of creating new users on a Linux system. It checks if a user already exists, creates a new user if they don't, generates a random password with a special character, and forces the user to reset their password on the first login.

## Features:
1. Checks if the provided username already exists in the system.
2. If the user doesn’t exist, it creates the user with a randomly generated password.
3. The password includes a special character and a random number.
4. The user is forced to reset their password during their first login.
5. Supports creating multiple users in one execution.
6. Includes automated SSH configuration changes to enable password authentication.

## Prerequisites:
- You must have root or sudo privileges to run this script.
- Ensure that `passwd` and `sed` are installed on your system.

## How It Works:
1. **Check for Existing Users:**  
   The script checks the `/etc/passwd` file to see if the provided username already exists.
   
2. **Create New User:**  
   If the user does not exist, it creates a new user with the `useradd` command and assigns a randomly generated password.
   
3. **Generate Random Password:**  
   The password is created using a combination of random numbers and a randomly selected special character from a predefined set.
   
4. **SSH Configuration:**  
   The script uses `sed` to modify the `/etc/ssh/sshd_config` file to enable password authentication. It also creates a backup of this file before making changes.
   
5. **Multiple Users Creation:**  
   The script allows you to create multiple users by passing multiple arguments.

## Script Example:

```bash
#!/bin/bash
if [ $# -gt 0 ]
then
  for USER in $@
  do
    echo $USER
    EXISTING_USER=$(cat /etc/passwd | grep -i -w $USER | cut -d ":" -f1)
    
    if [ "${USER}" = "${EXISTING_USER}" ]
    then
      echo "$USER already exists. Please choose a different username."
    else
      echo "Creating new user: $USER"
      sudo useradd -m $USER --shell /bin/bash
      SPEC=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
      PASSWORD="IndianArmy@${RANDOM}${SPEC}"
      echo "$USER:$PASSWORD" | sudo chpasswd
      echo "Temporary password for $USER is $PASSWORD"
      sudo passwd -e $USER
    fi
  done
else
  echo "Please provide at least one username as an argument."
fi
```

## SSH Configuration (Optional):
To enable password authentication for newly created users, the script modifies the SSH configuration using `sed`. This is important for AWS instances, where password authentication is disabled by default.

```bash
# Backup the sshd_config file
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_backup

# Modify the sshd_config file to enable password authentication
sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config

# Restart the SSH service
sudo service sshd restart
```

## How to Run the Script:
1. Save the script as `user-automation.sh`.
2. Run the script with a username as an argument:
   ```bash
   bash user-automation.sh username1 username2
   ```
   Example:
   ```bash
   bash user-automation.sh alice bob
   ```

## Notes:
- Ensure that password authentication is enabled on your system if you want to use password-based login for the newly created users.
- This script automatically forces the new user to reset their password on first login.

---

This README provides an overview of the script in simple terms, helping users understand what it does and how to use it.
