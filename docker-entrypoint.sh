#!/bin/sh

if [[ ! -z "${GOOGLE_CLOUD_CREDENTIAL}" ]]; then
  echo $GOOGLE_CLOUD_CREDENTIAL > /tmp/key.json
  GOOGLE_CLOUD_KEY_FILE=/tmp/key.json
fi

if [[ ! -z "${AWS_CONTAINER_CREDENTIALS_RELATIVE_URI}" ]]; then
  curl -sL 169.254.170.2$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI > /tmp/aws.json
  export AWS_ACCESS_KEY_ID=$(cat /tmp/aws.json | jq -r ".AccessKeyId")
  export AWS_SECRET_ACCESS_KEY=$(cat /tmp/aws.json | jq -r ".SecretAccessKey")
  export AWS_SECURITY_TOKEN=$(cat /tmp/aws.json | jq -r ".Token")
fi

gcloud auth activate-service-account --key-file $GOOGLE_CLOUD_KEY_FILE 
"$@"
