#!/bin/bash
#1. Download the website files
wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-200-ACACAD-2-91555/14-lab-mod10-challenge-CFn/s3/static-website.zip
unzip static-website.zip -d static
cd static
#2. Set the ownership controls on the bucket
aws s3api put-bucket-ownership-controls --bucket createbucket-s3bucket-sgdarfndiq9i --ownership-controls Rules=[{ObjectOwnership=BucketOwnerPreferred}]
#3. Set the public access block settings on the bucket
aws s3api put-public-access-block --bucket createbucket-s3bucket-sgdarfndiq9i --public-access-block-configuration "BlockPublicAcls=false,RestrictPublicBuckets=false,IgnorePublicAcls=false,BlockPublicPolicy=false"
#4. Copy the website files to the bucket
aws s3 cp --recursive . s3://createbucket-s3bucket-sgdarfndiq9i/ --acl public-read
