#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
cd /home/ec2-user
S3_BUCKET_NAME=bucket-2810-ec2
REGION=us-west-2
aws s3 cp s3://$S3_BUCKET_NAME/api-server.zip .
unzip api-server.zip
pip3 install -r requirements.txt
cd src
python3 main.py
