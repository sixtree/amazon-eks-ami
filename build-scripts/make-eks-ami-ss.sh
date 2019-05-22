#!/bin/bash
cd ../

AWS_PROFILE=alpha-ss KMS_KEY_ID=7c367ce3-8a5b-4a35-acf3-0f9a0ca9a9e2 make AWS_REGION=eu-west-1
