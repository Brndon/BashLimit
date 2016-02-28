# AWS Bash Limit
LimitCheck.sh is a simple bash script to programmatically poll the Trusted Advisor resource limit checks. If any of your limits are found to be in Warning (i.e. "Yellow" or "Red") the script will publish a message to the SNS topic ARN provided.


Instructions:

1) Install the AWS CLI from http://aws.amazon.com/cli

-configure with your AWS credentials

2) Install the opensource tool "jq"

"sudo yum install jq.x86_64"

3) Create an SNS topic and subscribe to it via the AWS Management Console

-replace the ARN in the Publish function of "LimitCheck.sh" with the ARN of your SNS topic.

