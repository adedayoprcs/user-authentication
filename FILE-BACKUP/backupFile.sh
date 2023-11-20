User
#!/bin/bash

# Default values
USERNAME="cloud_user"
LOGFILE="backup.log"
BACKUP_DIR="/path/to/backup"
timestamp=$(date "+%Y-%m-%d %H:%M:%S")


# Function to display usage information
usage() {
    echo "Usage: $0 [-u <username>] [-l <logfile>] [-d <backup_dir>]"
    exit 1
}

# Parse command line options
while getopts ":u:f:d:" opt; do
    case $opt in

        u)
            USERNAME="$OPTARG"   
            ;;     

        f)
            LOGFILE="$OPTARG"
            ;;
        d)
            BACKUP_DIR="$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument."
            usage
            ;;
    esac
done

# Check if no options were provided
if [ "$#" -eq 0 ]; then
    echo "No options provided."
    usage
fi
# Check if the backup directory exists, create it if not
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# Backup files to the specified directory
echo "Backing up files for user $USERNAME to $BACKUP_DIR" | tee -a "$LOGFILE"
# Add your backup commands here (e.g., rsync, cp, tar)
 if cp "$PWD/$LOGFILE" "$BACKUP_DIR"; then
    echo "$timestamp | File copied successfully." >> backup.log
    # Add other commands you want to execute if the copy is successful
else
    echo "$timestamp | Error: Unable to copy the file." >> backup.log
    # Add other commands you want to execute if the copy fails
fi


# Log completion. 
echo "Backup completed successfully at $timestamp" >> backup.log



all_users=("John" "James" "Judas" "Jade")

for i in "${all_users[@]}"; do
    if [ "$i" == "$USERNAME" ]; then
        chmod 700 backupFile.sh
        echo "PERMISSION GRANTED!"
        break  # Assuming you want to exit the loop after granting permission
    else
        echo "PERMISSION DENIED!"
    fi
done
    