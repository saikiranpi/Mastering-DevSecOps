#!/bin/bash
REGION='us-east-2'
aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r

#!/bin/bash
REGION=$1
aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r

# $?
#!/bin/bash
awd --version
if [$? -eq 0]; then
    REGION=$1
    aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
else
    echo "incorrecct command "
fi

# $@
#!/bin/bash
aws --version
if [$? -eq 0]; then
    REGIONS=$@
    for REGION in ${REGIONS}; do
        aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
    done
else
    "incorrecct command"
fi

bash script.sh us-east-1 us-east-2 us-west-1

# $*

# $#
#!/bin/bash
if [$# -gt 0]; then
    aws --version
    if [$? -eq 0]; then
        REGIONS=$@
        for REGION in ${REGIONS}; do
            aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
        done
    else
        "incorrecct command"
    fi
else
    echo "Please The correct Arguments"
fi

bash script.sh us-east-1 us-east-2 us-west-1
