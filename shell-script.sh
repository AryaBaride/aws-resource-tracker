#!/bin/bash
# Author: Arya Baride
# Date: 22-1-2025
# Purpose: This script will list all the resources in AWS account.
# Usage: ./list_resources.sh <region> <service_name>
# Example: ./list_resources.sh us-east-1 ec2

# Below are the services that are supported by this script:
# 1. EC2
# 2. RDS
# 3. S3
# 4. CloudFront
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. VPC
# 15. EBS

#check if the required number of arguments are correctly passed
if [ $# -ne 2 ];   #here it checks if the number of command line arguments are equal to 2
then
    echo "Usage: $0 <region> <service_name>"    #print the error message
    echo "Example: list_resources.sh us-east-1 ec2"
exit 1
fi

#check if aws cli is installed
if ! command -v aws &> /dev/null;
then
	echo "AWS CLI is not installed. Please install it first."
exit 1
fi

#check if aws cli is configured
if [! -d ~/.aws ]; then      #checks if .aws file is present
	echo "AWS CLI is not configured. Please configure it first."
exit 1
fi

#Assign the arguments to variables 
aws_region=$1
aws_service=$2

#using switch case for each service
# List the resources based on the service
case $aws_service in
    ec2)
        echo "Listing EC2 Instances in $aws_region"
        aws ec2 describe-instances --region $aws_region
        ;;
    rds)
        echo "Listing RDS Instances in $aws_region"
        aws rds describe-db-instances --region $aws_region
        ;;
    s3)
        echo "Listing S3 Buckets in $aws_region"
        aws s3api list-buckets --region $aws_region
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions in $aws_region"
        aws cloudfront list-distributions --region $aws_region
        ;;
    vpc)
        echo "Listing VPCs in $aws_region"
        aws ec2 describe-vpcs --region $aws_region
        ;;
    iam)
        echo "Listing IAM Users in $aws_region"
        aws iam list-users --region $aws_region
        ;;
    route5)
        echo "Listing Route53 Hosted Zones in $aws_region"
        aws route53 list-hosted-zones --region $aws_region
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms in $aws_region"
        aws cloudwatch describe-alarms --region $aws_region
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $aws_region"
        aws cloudformation describe-stacks --region $aws_region
        ;;
    lambda)
        echo "Listing Lambda Functions in $aws_region"
        aws lambda list-functions --region $aws_region
        ;;
    sns)
        echo "Listing SNS Topics in $aws_region"
        aws sns list-topics --region $aws_region
        ;;
    sqs)
        echo "Listing SQS Queues in $aws_region"
        aws sqs list-queues --region $aws_region
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $aws_region"
        aws dynamodb list-tables --region $aws_region
        ;;
    ebs)
        echo "Listing EBS Volumes in $aws_region"
        aws ec2 describe-volumes --region $aws_region
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac
