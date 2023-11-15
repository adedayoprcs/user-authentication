User Authentication Script
Overview
This Bash script is designed for basic user authentication, allowing users to enter a username and password for validation against a predefined set of credentials stored in an associative array.

Script Content
The script includes the following components:

Initialization of User Credentials:

bash
declare -A group_users
group_users["John"]="XXXXX"
group_users["James"]="XX@X"
group_users["Jonah"]="Shark"
The script initializes an associative array named group_users and assigns passwords to specific usernames.

Lines Printing Function:

bash
Copy code
lines() {
    # ...
}
Defines a function lines that prints a sequence of horizontal lines. This is just to make the code look clean on the terminal.


Function
get_username(){
}

Function
get_password(){
}
Functions get_username and get_password prompt the user to input a username and password, respectively.


Username Validation Function:
Function
validate_username(){
}
Checks if the entered username is present in the group_users array.


Password Validation Function:
function
validate_password(){
}
Prompts the user for a username and password, validates the username, and checks if the entered password matches the stored password. It allows three attempts (trials) for password entry.


Main Execution:
function
validate_password
Calls the validate_password function to initiate the user authentication process.

Instructions
Execution:
Run the script in a Bash environment using the following command:

bash
./authentication_script.sh
User Input:
Follow the prompts to enter a username and password.

Validation:
The script will validate the entered credentials against the predefined set, providing feedback on successful or unsuccessful authentication.
