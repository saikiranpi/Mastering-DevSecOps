#!/bin/bash
if [ $# -gt 0 ]; then
    USER=$1
    echo $USER
else
    echo " Please Enter the Valid parameter "
fi

##ADDING-USER##

#!/bin/bash
if [ $# -gt 0 ]; then
    USER=$1
    echo $USER
    EXISTING_USER=$(cat /etc/passwd | grep -i -w $USER | cut -d ":" -f1)
    if [ "${USER}" = "${EXISTING_USER}" ]; then
        echo "The $USER you have entered is already present in the machine, Please Enter the Another USername"
    else
        echo " Lets Create a New New username"
        sudo useradd -m $USER --shell /bin/bash
    fi
else
    echo " Please Enter the Valid parameter "

fi

##password ##

#!/bin/bash
if [ $# -gt 0 ]; then
    USER=$1
    echo $USER
    EXISTING_USER=$(cat /etc/passwd | grep -i -w $USER | cut -d ":" -f1)
    if [ "${USER}" = "${EXISTING_USER}" ]; then
        echo "The $USER you have entered is already present in the machine, Please Enter the Another USername"
    else
        echo " Lets Create a New New username"
        sudo useradd -m $USER --shell /bin/bash
        SPEC=$(echo ' !@#$%^&*()_' | fold -w1 | shuf | head -1)
        PASSWORD="IndianArmy@${RANDOM}${SPEC}"
        echo "$USER:$PASSWORD" | sudo chpasswd
        echo "The temporary password the $USER is ${PASSWORD}"
        passwd -e $USER
    fi
else
    echo " Please Enter the Valid parameter "

fi

# Sed -i “58 s/.*PasswordAuthentication.*/PasswordAuthentication yes/g” /etc/ssh/sshd_config

##Multi User passing ##

#!/bin/bash

#!/bin/bash
if [ $# -gt 0 ]; then
    for USER in $@; do
        echo $USER
        EXISTING_USER=$(cat /etc/passwd | grep -i -w $USER | cut -d ":" -f1)
        if [ "${USER}" = "${EXISTING_USER}" ]; then
            echo "The $USER you have entered is already present in the machine, Please Enter the Another USername"
        else
            echo " Lets Create a New New username"
            sudo useradd -m $USER --shell /bin/bash
            SPEC=$(echo ' !@#$%^&*()_' | fold -w1 | shuf | head -1)
            PASSWORD="IndianArmy@${RANDOM}${SPEC}"
            echo "$USER:$PASSWORD" | sudo chpasswd
            echo "The temporary password the $USER is ${PASSWORD}"
            passwd -e $USER
        fi
    done
else
    echo " Please Enter the Valid parameter "

fi

##regex##

#regex- Regular Expressions#
#!/bin/bash
if [ $# -gt 0 ]; then
    for USER in $@; do
        echo $USER
        if [[ $USER =~ ^[a-zA-Z]+$ ]]; then
            EXISTING_USER=$(cat /etc/passwd | grep -i -w $USER | cut -d ':' -f1)
            if [ "${USER}" = "${EXISTING_USER}" ]; then
                echo "$USER is already exisitin, Please create a New user"
            else
                echo "Lets create the New $USER"
                sudo useradd -m $USER --shell /bin/bash
                SPEC=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
                PASSWORD="IndianArmy@${RANDOM}${SPEC}"
                echo "$USER:$PASSWORD" | sudo chpasswd
                echo "The termporary password for the user is ${PASSWORD}"
                passwd -e $USER
            fi
        else
            echo "The User Must Contain Alphabets"
        fi
    done
else
    echo "Please pass the Argument"
fi
