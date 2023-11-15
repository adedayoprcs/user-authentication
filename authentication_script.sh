#!/bin/bash

# Declare an associative array to store usernames and passwords
declare -A group_users

# Add key-value pairs to the dictionary
group_users["John"]="XXXXX"
group_users["James"]="XX@X"
group_users["Jonah"]="Shark"

# Function to print lines
lines() {
    dot=2
    dott=2
    for ((i=0; i<dot; i++)); do
        for ((j=0; j<dott; j++)); do
            echo -n "──────────────────────────────────────────────────────────"
        done
        echo   # Move to the next line after printing dots in the inner loop
    done
}

# Function to get the username
get_username(){
    read -p "Username: " user_name
    echo "$user_name"
}

# Function to get the password
get_password(){
    read -p "Password: " password
    echo "$password"
}

# Function to validate the username
validate_username(){
    username=$(get_username)

    # Iterate over keys and values in the associative array
    for key in "${!group_users[@]}"; do
        if [ "$username" == "$key" ]; then
            echo "$username"
            break
        fi
    done
}

# Function to validate the password
validate_password(){
    trials=3

    for ((i=0; i<trials; i++)); do
        username=$(validate_username)
        get_password=$(get_password)
        dotted_lines=$(lines)
        limit=2

        if [ "${group_users[$username]}" == "$get_password" ]; then
            echo "$dotted_lines"
            echo "PERMISSION GRANTED"
            break
        else
            echo "$dotted_lines"
            echo "PERMISSION DENIED"
        fi
    done
}

# Call the function to validate the password
validate_password
