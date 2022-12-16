S3_BUCKET_NAME=bucket-2810-ec2
S3_SECOND_BUCKET_NAME=bucket-2810-dynamo
REGION=us-west-2
if aws s3 ls "s3://$S3_BUCKET_NAME" 2>&1 | grep -q 'An error occurred'
then
    aws s3api create-bucket --bucket $S3_BUCKET_NAME --region $REGION --create-bucket-configuration LocationConstraint=$REGION
else
    echo $S3_BUCKET_NAME  "bucket already exists"
fi
cd api-server
zip -r ../api-server.zip .
cd ..
aws s3 cp api-server.zip s3://$S3_BUCKET_NAME

if aws s3 ls "s3://$S3_SECOND_BUCKET_NAME" 2>&1 | grep -q 'An error occurred'
then
    aws s3api create-bucket --bucket $S3_SECOND_BUCKET_NAME --region $REGION --create-bucket-configuration LocationConstraint=$REGION
else
    echo $S3_SECOND_BUCKET_NAME "bucket already exists"
fi
