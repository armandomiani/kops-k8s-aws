#!/bin/bash

# Define variables which will be populated by the user creation flow
AWS_IAM_ID=""
AWS_IAM_SECRET=""


# Creates Users, Groups and Access Key
pushd users/
terraform apply -auto-approve
AWS_IAM_ID=`terraform output --json | jq '.aws_access_key_id.value'`
AWS_IAM_SECRET=`terraform output --json | jq '.aws_access_key_secret.value'`
popd


# Change config files
pushd infrastructure/

CHANGE_CMD="cat terraform.template.tfvars | sed -e 's/#accesskey_id/$AWS_IAM_ID/g' -e 's/#accesskey_secret/$AWS_IAM_SECRET/g' > terraform.tfvars"
eval $CHANGE_CMD

# Create the whole Infrastructure



popd    