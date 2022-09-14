#!/bin/bash
#
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.
if [[ $(whoami) != "root" ]]
then 
	echo "Please run this script as root user"
	exit 1
fi

# Get the username (login).
read -p "Enter the username to create: " USER_NAME

# Get the real name (contents for the description field).
read -p "Enter the user FIRST and LAST name: " COMMENT

# Get the password.
read -sp "Enter the password: " PASSWORD

# Create the account.
useradd -c "${COMMENT}" ${USER_NAME} 2> /dev/null

# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.
if [[ $? -ne 0 ]]
then 
	echo "Could not add user. Check for duplicates"
	exit 2
fi
# Set the password.
echo ${PASSWORD} | passwd --stdin ${USER_NAME} 1> /dev/null

# Check to see if the passwd command succeeded.
if [[ $? -ne 0 ]]
then
	echo "Could not set the password"
	exit 3
fi
# Force password change on first login.
passwd -e ${USER_NAME} 1> /dev/null

# Display the username, password, and the host where the user was created.
echo "Username is: ${USER_NAME}"
echo "Password is: ${PASSWORD}"
echo "Hostname is: $(hostname)"
