#!/bin/sh

if [[ ! -z "${GOOGLE_CLOUD_CREDENTIAL}" ]]; then
  echo $GOOGLE_CLOUD_CREDENTIAL > /tmp/key.json
  GOOGLE_CLOUD_KEY_FILE=/tmp/key.json
fi

gcloud auth activate-service-account --key-file $GOOGLE_CLOUD_KEY_FILE 
$@
