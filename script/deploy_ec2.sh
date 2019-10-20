#!/bin/sh

export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
export AWS_DEFAULT_REGION="us-east-2a"

MYSECURITYGROUP="sg-0a37eeb37fb44ccee"
MYIP=`curl -s ifconfig.me`

aws ec2 authorize-security-group-ingress --group-id $MYSECURITYGROUP --protocol tcp --port 22 --cidr $MYIP/32
ssh ${USER_NAME}@${HOST_NAME} 'cd /var/www/rails/teamlab_selection_task && git pull && docker-compose build && docker-compose run web bundle install && docker-compose restart'
aws ec2 revoke-security-group-ingress --group-id $MYSECURITYGROUP --protocol tcp --port 22 --cidr $MYIP/32