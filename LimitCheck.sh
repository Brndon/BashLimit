#!/bin/bash 
# programmatic polling and SNS notification of TA limit checks

SNSARN="arn:aws:sns:us-west-2:141820633316:AWS-Limits"     #replace this value with your own SNS ARN

> limitvalue.txt

Limit () {
echo "Contacting Trusted Advisor..."

aws support describe-trusted-advisor-check-result --check-id "eW7HH0l7J9" --query 'result.sort_by(flaggedResources[?status!=`ok`],&metadata[2])' | jq  '.[].metadata' > limitvalue.txt
# eW7HH0l7J9 - service limits
# S45wrEXrLz - VPN Tunnel Redundancy
}

Publish () {
echo "Publishing message to SNS topic..."

aws sns publish --topic-arn $SNSARN --message "You have limits approaching their upper threshold. Please take action accordingly."
}

Limit

if [ -s limitvalue.txt ]
then
  echo "The value is: "
  cat limitvalue.txt
  Publish
else
  echo "All systems green!"
fi
