#!/bin/sh

# mozjpeg
echo "MOZJPEG_PATH = '/usr/local/bin/mozjpeg'" >> /usr/local/thumbor/thumbor.conf
echo "MOZJPEG_QUALITY = 80" >> /usr/local/thumbor/thumbor.conf

# pngquant
echo "PNGQUANT_PATH = '/usr/bin/pngquant'" >> /usr/local/thumbor/thumbor.conf
echo "PNGQUANT_SPEED = 3" >> /usr/local/thumbor/thumbor.conf

# set OPTIMIZERS
echo "OPTIMIZERS = ['thumbor_plugins.optimizers.mozjpeg', 'thumbor_plugins.optimizers.pngquant']" >> /usr/local/thumbor/thumbor.conf

# configure AWS
AWS=$(cat <<EOF
################################# AWS Storage ##################################

## Default location to use if S3 does not return location header.
## Can use {bucket_name} var.
## Defaults to: 'https://{bucket_name}.s3.amazonaws.com'
AWS_DEFAULT_LOCATION = '{{ AWS_DEFAULT_LOCATION | default('https://{bucket_name}.s3.amazonaws.com') }}'

## Region where thumbor's objects are going to be stored.
## Defaults to: 'us-east-1'
AWS_STORAGE_REGION_NAME = '{{ AWS_STORAGE_REGION_NAME | default('us-east-1') }}'

## S3 Bucket where thumbor's objects are going to be stored.
## Defaults to: 'thumbor'
AWS_STORAGE_BUCKET_NAME = '{{ AWS_STORAGE_BUCKET_NAME | default('thumbor') }}'

## Secret access key for S3 to allow thumbor to store objects there.
## Defaults to: None
AWS_STORAGE_S3_SECRET_ACCESS_KEY = '{{ AWS_STORAGE_S3_SECRET_ACCESS_KEY | default('') }}'

## Access key ID for S3 to allow thumbor to store objects there.
## Defaults to: None
AWS_STORAGE_S3_ACCESS_KEY_ID = '{{ AWS_STORAGE_S3_ACCESS_KEY_ID | default('') }}'

## Endpoint URL for S3 API. Very useful for testing.
## Defaults to: None
{% if AWS_STORAGE_S3_ENDPOINT_URL is defined %}
AWS_STORAGE_S3_ENDPOINT_URL = '{{ AWS_STORAGE_S3_ENDPOINT_URL }}'
{% endif %}

## Storage prefix path.
## Defaults to: '/st'
AWS_STORAGE_ROOT_PATH = '{{ AWS_STORAGE_ROOT_PATH | default('/st') }}'

## ACL to use for storing items in S3.
## Defaults to: None
AWS_STORAGE_S3_ACL = '{{ AWS_STORAGE_S3_ACL | default('') }}'

################################################################################

############################## AWS Result Storage ##############################

## Region where thumbor's objects are going to be stored.
## Defaults to: 'us-east-1'
AWS_RESULT_STORAGE_REGION_NAME = '{{ AWS_RESULT_STORAGE_REGION_NAME | default('us-east-1') }}'

## S3 Bucket where thumbor's objects are going to be stored.
## Defaults to: 'thumbor'
AWS_RESULT_STORAGE_BUCKET_NAME = '{{ AWS_RESULT_STORAGE_BUCKET_NAME | default('thumbor') }}'

## Secret access key for S3 to allow thumbor to store objects there.
## Defaults to: None
AWS_RESULT_STORAGE_S3_SECRET_ACCESS_KEY = '{{ AWS_RESULT_STORAGE_S3_SECRET_ACCESS_KEY | default('') }}'

## Access key ID for S3 to allow thumbor to store objects there.
## Defaults to: None
AWS_RESULT_STORAGE_S3_ACCESS_KEY_ID = '{{ AWS_RESULT_STORAGE_S3_ACCESS_KEY_ID | default('') }}'

## Endpoint URL for S3 API. Very useful for testing.
## Defaults to: None
{% if AWS_RESULT_STORAGE_S3_ENDPOINT_URL is defined %}
AWS_RESULT_STORAGE_S3_ENDPOINT_URL = '{{ AWS_RESULT_STORAGE_S3_ENDPOINT_URL }}'
{% endif %}

## Result Storage prefix path.
## Defaults to: '/rs'
AWS_RESULT_STORAGE_ROOT_PATH = '{{ AWS_RESULT_STORAGE_ROOT_PATH | default('/rs') }}'

## ACL to use for storing items in S3.
## Defaults to: None
AWS_RESULT_STORAGE_S3_ACL = '{{ AWS_RESULT_STORAGE_S3_ACL | default('') }}'

################################################################################

EOF
)

echo -e "$AWS" | envtpl >> /usr/local/thumbor/thumbor.conf
