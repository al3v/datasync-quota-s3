# AWS S3 File Organizer for Datasync Migration

**Usage for AWS DataSync Migration (Over 50 Million Files in S3):**

If you plan to use AWS DataSync for migrating data from your S3 bucket and you have more than **50 million** files, this script becomes especially valuable. AWS DataSync has a 50 million file limitation per task. By using this script, you can efficiently folderize your files into subfolders, with each subfolder containing a maximum of 45 million files. This approach allows you to work within the 50 million file limit imposed by AWS DataSync.

Here's how it helps:

1. The script divides your files into manageable subfolders, each well below the 50 million file limit.
2. You can then specify these subfolders as source paths in your AWS DataSync tasks, ensuring that each task remains within the DataSync file limit.
3. This enables you to migrate your data smoothly using AWS DataSync, optimizing the process for buckets with large file counts.

By using this script, you can effectively overcome the file limitation hurdle and seamlessly migrate your extensive S3 bucket data using AWS DataSync.

...

## Prerequisites

Before using this script, make sure you have the following prerequisites:

1. **AWS Command Line Interface (CLI):** Ensure that you have the AWS CLI installed and configured with the necessary credentials.

2. **AWS DataSync:** If you plan to migrate large amounts of data to or from your S3 bucket using AWS DataSync, please be aware of the 50 million file limit per task. This script can help organize your files into subfolders to meet this limit.

## Usage

Follow these steps to use the script:

1. **Clone or Download:** Clone this repository or download the script to your local machine.

2. **Edit Configuration:** Open the script file `s3-file-organizer.sh` in a text editor and customize the following variables:
   
   - `source_bucket`: Specify the name of the source S3 bucket containing your files.
   - `destination_bucket`: By default, it is set to the same as the source bucket. Change it if you want to copy files to a different bucket.
   - `files_per_folder`: Define the maximum number of files you want in each subfolder (45 million for AWS DataSync).

3. **Run the Script:** Open your terminal, navigate to the script directory, and run the script using the following command:
   
   ```bash
   ./s3-file-organizer.sh
