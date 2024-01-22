#!/bin/bash
source_bucket="alv-s3"
destination_bucket="$source_bucket"
files_per_folder=45000000  # Maximum number of files per folder

# Use AWS CLI to list objects in the source bucket
file_list=$(aws s3 ls "s3://$source_bucket/" --recursive)

# Initialize variables
current_folder=1
copied_files=0

# Loop through the file list and create folders as needed
while read -r file_info; do
  # Extract the file name from the file info
  file_name=$(echo "$file_info" | awk '{print $4}')

  # Check if a new folder needs to be created
  if [ "$copied_files" -eq 0 ] || [ "$copied_files" -ge "$files_per_folder" ]; then
    # Generate the new folder name
    current_folder_name="folder-$current_folder"
    copied_files=0

    # Create the new folder in the destination bucket
    aws s3 mkdir "s3://$destination_bucket/$current_folder_name"

    # Increment the folder counter
    ((current_folder++))
  fi

  # Copy the file to the current folder
  aws s3 cp "s3://$source_bucket/$file_name" "s3://$destination_bucket/$current_folder_name/$file_name"

  # Increment the copied files counter
  ((copied_files++))
done <<< "$file_list"

echo "Divided files into folders in $destination_bucket"
