#!/bin/sh

export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
export AWS_DEFAULT_REGION="us-east-2"
# EC2が属するSGを定義する
MYSECURITYGROUP="sg-0a37eeb37fb44ccee"
# 自身のグローバルIPアドレスを定義する
MYIP=`curl -s ifconfig.me`

# 一時的に自身のグローバルIPアドレスからEC2が属するSGへのアクセスを許可する
aws ec2 authorize-security-group-ingress --group-id $MYSECURITYGROUP --protocol tcp --port 22 --cidr $MYIP/32
# EC2にログインして、デプロイする
ssh ${USER_NAME}@${HOST_NAME} 'cd /var/www/rails/teamlab_selection_task && git pull && docker-compose build && docker-compose run web bundle exec rails db:migrate && docker-compose run web bundle install && docker-compose restart'
# 自身のグローバルIPアドレスからEC2が属するSGへのアクセス許可を取り消す
aws ec2 revoke-security-group-ingress --group-id $MYSECURITYGROUP --protocol tcp --port 22 --cidr $MYIP/32
