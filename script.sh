


#!/bin/bash
# Author: Arya Baride
# Date: 22-1-2025
# Purpose: List AWS resources for a specific region and service.
# Usage: ./list_resources.sh <region> <service_name>
# Example: ./list_resources.sh us-east-1 ec2

# Supported services:
supported_services=("ec2" "rds" "vpc" "cloudformation" "lambda" "sns" "sqs" "dynamodb" "ebs" "amplify" "cloudtrail" "efs" "kinesis" "eks" "glacier")   #array of services


# Function to validate AWS CLI and credentials
validate_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it and try again."
        exit 1
    fi

    if ! aws sts get-caller-identity &> /dev/null; then
        echo "AWS CLI is not configured or credentials are invalid."
        exit 1
    fi
}

# Functions to check if the service is supported
is_supported_service() {
    for service in "${supported_services[@]}"; do
        if [[ "$1" == "$service" ]]; then
            return 0
        fi
    done
    return 1
}

main() {
    # Checks arguments
    if [[ $# -ne 2 ]]; then
        echo "Usage: $0 <region> <service_name>"
        echo "Example: $0 us-east-1 ec2"
        exit 1
    fi

    local region=$1
    local service=$2

    # Validates AWS CLI and credentials
    validate_aws_cli

    # Checks if the service is supported
    if ! is_supported_service "$service"; then
        echo "Error: Unsupported service '$service'. Supported services are: ${supported_services[*]}"
        exit 1
    fi


    # Lists resources based on service
    case $service in
        ec2)
            aws ec2 describe-instances --region "$region"
            ;;
        rds)
            aws rds describe-db-instances --region "$region"
            ;;
        vpc)
            aws ec2 describe-vpcs --region "$region"
            ;;
        cloudformation)
            aws cloudformation describe-stacks --region "$region"
            ;;
        lambda)
            aws lambda list-functions --region "$region"
            ;;
        sns)
            aws sns list-topics --region "$region"
            ;;
        sqs)
            aws sqs list-queues --region "$region"
            ;;
        dynamodb)
            aws dynamodb list-tables --region "$region"
            ;;
        ebs)
            aws ec2 describe-volumes --region "$region"
            ;;
        amplify)
            aws amplify list-artifacts --region "$region"
            ;;
        cloudtrail)
            aws cloudtrail get-trail-status --region "$region"
            ;;
        efs)
            aws efs describe-file-systems --region "$region"
            ;;
        kinesis)
            aws kinesis describe-stream-summary --region "$region"
            ;;
        eks)
            aws eks list-clusters --region "$region"
            ;;
        glacier)
            aws glacier list-vaults --region "$region"
            ;;
        *)
            echo "Error: Something went wrong. Unsupported service '$service'."
            exit 1
            ;;
    esac


}



