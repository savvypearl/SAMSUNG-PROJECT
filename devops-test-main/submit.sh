#!/bin/sh

user=${1//[^a-zA-Z0-9.]/}

if [ -z "$user" ]; then
  echo "Usage: $0 firstname.lastname"
  exit 1
fi

DIR=$(dirname $0)

USING_DOCKER=true
if [ ! -d /app ] || [ ! -f /app/package.json ] || [ ! -x /app/submit.sh ]; then
  USING_DOCKER=
fi

if [ -z "$(which aws)" ]; then
  echo "Error: please install AWS CLI"
  exit 1
fi

echo
echo Using user: $user
echo "Creating archive: submission.tgz ..."
echo

uname -a >$DIR/.os

rm -f submission.tgz
tar --exclude-from=.gitignore --exclude=.git/ --exclude=submission.tgz -czvf submission.tgz $DIR/

date=`date +%Y%m%d`
dateFormatted=`date -R`
s3Bucket="codesubmit.samnasbo.com"
fileName="submission.tgz"
targetFileName="devops-test/submissions/$user/submission_$(date +%s)_$(( RANDOM % 100000 )).tgz"
relativePath="/${s3Bucket}/${targetFileName}"
contentType="application/octet-stream"
stringToSign="PUT\n\n${contentType}\n${dateFormatted}\n${relativePath}"
s3AccessKey="AKIAWUBWYG64XBLNHKFK"
s3SecretKey="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"
signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${s3SecretKey} -binary | base64`

echo
echo "Uploading file..."

AWS_ACCESS_KEY_ID=${s3AccessKey} AWS_SECRET_ACCESS_KEY=${s3SecretKey} aws s3 cp submission.tgz "s3://${s3Bucket}/${targetFileName}" --acl public-read

result=$?

if [ $result -eq 0 ]; then
   echo "File uploaded: submission.tgz ->  http://${s3Bucket}.s3-us-west-1.amazonaws.com/${targetFileName}"
   echo
   echo "Send by email the following link:"
   echo
   echo "http://${s3Bucket}.s3-us-west-1.amazonaws.com/${targetFileName}"
else
   echo Upload failed. Please try again.
fi
