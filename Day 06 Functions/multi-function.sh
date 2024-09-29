#!/bin/bash
function subnets {
    echo "************************************************************"
    echo "**Getting SUBNETS Info VPC $VPC in region $REGION**"
    echo "************************************************************"
    aws ec2 describe-subnets --filters "Name=vpc-id,Values=$VPC" --region $REGION | jq ".Subnets[].SubnetId"
    echo "---------------------------------------------"
}

function sg {
    echo "********************************************************************"
    echo "**Getting Security Group Info VPC $VPC in region $REGION**"
    echo "********************************************************************"
    aws ec2 describe-security-groups --filters "Name=vpc-id,Values=$VPC" --region $REGION | jq ".SecurityGroups[].GroupName"
    echo "---------------------------------------------"
}

vpcs() {
    for REGION in $@; do
        echo "Getting VPC List For Regions $REGION..."
        vpcs=$(aws ec2 describe-vpcs --region "${REGION}" | jq ".Vpcs[].VpcId" | tr -d '"')
        echo $vpcs
        echo "--------------------------------------------------"
        for VPC in $vpcs; do
            subnets $VPC
            # sg $VPC
        done
        # for VPC in $vpcs; do
        #     sg $VPC
        # done
    done
}

vpcs $@
