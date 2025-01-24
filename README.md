This shell script requires some pre-requisites, here are they!

1. Command should be in a proper format as given below:
	./shell-script.sh ap-south-1 ec2

2. AWS CLI should be installed:
	1) sudo apt update && sudo apt upgrade -y    									 #ensures your package manager is up to date.
	2) sudo apt install unzip curl -y            									 #install required dependencies.
	3) curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"                             #download the aws cli installation file
	4) unzip awscliv2.zip                         									#unzip the downloaded file to extract it
	5) sudo ./aws/install                         									#run the installation script 
	6) aws --version                              									#verify the installation

3) AWS CLI should be configured, here's how to do it:
	1)aws configure                										#set up your credentials (Using IAM, create a secret access key)
	2) rm -rf awscliv2.zip aws     										#optionally, you can delete the installation file to save space. 

Next,
1. Connect to your instance using ec2 connect
2. Check the pwd and create a .sh file to write your shell script.
3. Assign chmod 711 to your shell script.
4. Now, authenticate using SSH with your GitHub:
	1)Generate an SSH key: ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
	2)Save the key in the default location that is provided.
	3)Use the cat command to view and copy the key
	4)Go to GitHub and save this SSH key in the GitHub SSH settings.
	5)Test the connection: ssh -T git@github.com

5. Once you are authenticated, install the git on your instance: sudo apt install git -y

6. Initialize the repository : git init

7. Add the shell script: git add .

8. Commit the script

9. Set the branch name : git branch -M main

10. Add the remote origin.

11. Push the script to main branch

12. Here, again you will be prompted to enter your:
	1) GitHub username
	2) GitHub password (Create a classic personal access token and select the required scopes:
	# repo: Full access to repositories (for private repositories).
	# workflow: To manage workflows if needed. 
Now, copy this token as you won't be able to see it again and paste it in the password section.
We did this because GitHub no longer allows password authentication for HTTPS.
