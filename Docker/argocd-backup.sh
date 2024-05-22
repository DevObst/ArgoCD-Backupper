#!/bin/bash

# Set the current date
current_date=$(date +'%Y-%m-%d-%H-%M-%S')
new_name="backup-$current_date.yaml"

# Destination directory for the backup
backup_dir="/home/argocd/backup/"

# Check if the destination directory exists, if not, create it
if [ ! -d "$backup_dir" ]; then
    echo "Creating directory $backup_dir..."
    mkdir -p "$backup_dir"
    if [ $? -ne 0 ]; then
        echo "Error: Unable to create directory $backup_dir."
        exit 1
    fi
fi

# Export ArgoCD configuration
argocd admin export > "$backup_dir$new_name"

# Check if the export was successful
if [ $? -ne 0 ]; then
    echo "Error: Backup failed."
    exit 1
fi

# Check if the file was created and is not empty
if [ -s "$backup_dir$new_name" ]; then
    echo "Backup completed successfully. Saved to $backup_dir$new_name"
else
    echo "Error: Backup file $backup_dir$new_name is empty, export failed."
    exit 1
fi
