# AWS S3 File Organizer for Datasync Migration

**Usage for AWS DataSync Migration (Over 50 Million Files in S3):**

If you plan to use AWS DataSync for migrating data from your S3 bucket and you have more than **50 million** files, this script becomes especially valuable. AWS DataSync has a ❗50 million file limitation per task. By using this script, you can efficiently folderize your files into subfolders, with each subfolder containing a maximum of 45 million files. This approach allows you to work within the 50 million file limit imposed by AWS DataSync.

Here's how it helps:

1. The script divides your files into manageable subfolders, each well below the 50 million file limit.
2. You can then specify these subfolders as source paths in your AWS DataSync tasks, ensuring that each task remains within the DataSync file limit.
3. This enables you to migrate your data smoothly using AWS DataSync, optimizing the process for buckets with large file counts.

By using this script, you can effectively overcome the file limitation hurdle and seamlessly migrate your extensive S3 bucket data using AWS DataSync.

...

## Prerequisites 🔧

Before using this script, make sure you have the following prerequisites:

1. **AWS Command Line Interface (CLI):** Ensure that you have the AWS CLI installed and configured with the necessary credentials.

2. **AWS DataSync:** If you plan to migrate large amounts of data to or from your S3 bucket using AWS DataSync, please be aware of the 50 million file limit per task. This script can help organize your files into subfolders to meet this limit.

## Usage 🐾

Follow these steps to use the script:

1. **Clone or Download:** Clone this repository or download the script to your local machine.

2. **Edit Configuration:** Open the script file `s3-file-organizer.sh` in a text editor and customize the following variables:
   
   - `source_bucket`: Specify the name of the source S3 bucket containing your files.
   - `destination_bucket`: By default, it is set to the same as the source bucket. Change it if you want to copy files to a different bucket.
   - `files_per_folder`: Define the maximum number of files you want in each subfolder (45 million for AWS DataSync).

3. **Run the Script:** ▶️
Open your terminal, navigate to the script directory, and run the script using the following command:
   
   ```bash
   ./s3-file-organizer.sh



In this images, you can see an example of the organized subfolders within an AWS S3 bucket. The script efficiently distributes files into subfolders, and in this demonstration, I've used the folders "folder-1," "folder-2," and "folder-3" as an example. Each subfolder contains just two or less files for simplicity, but in practice, the script is designed to handle large numbers of files, typically not exceeding 45 million per subfolder, as per the AWS DataSync limitation.

![image](https://github.com/al3v/datasync-quota-s3/assets/73062283/9b157b61-fdd2-42c4-b6fe-e36178e2bd72)

![image](https://github.com/al3v/datasync-quota-s3/assets/73062283/a535a7f8-965d-4123-b787-c9199747e767)

![image](https://github.com/al3v/datasync-quota-s3/assets/73062283/7ee8d65e-04c7-4b57-a29b-dd21edb6afbf)

![image](https://github.com/al3v/datasync-quota-s3/assets/73062283/99b71363-3e9b-4689-ae46-6d5c04019ae8)



...




This is what will be seen on terminal.
The reason you see these messages multiple times is that the script iterates through the list of files in the S3 bucket and performs a copy operation for each file. During each copy operation, it uses the AWS CLI to copy the file from one location to another, and this invokes the AWS CLI multiple times.

You can safely ignore these AWS CLI usage messages in the terminal 😸. They do not affect the functionality of the script, which is working as intended to organize and copy files into subfolders within your S3 bucket.

The last line, "Divided files into folders in alv-s3," is the script's own output message, indicating that the script has successfully organized the files into folders in your S3 bucket.


![image](https://github.com/al3v/datasync-quota-s3/assets/73062283/8ee2eab8-b7d8-45b2-bd01-886550a0019c)




   
