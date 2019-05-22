#!/bin/bash
cd ../

AWS_PROFILE=alpha-np KMS_KEY_ID=039f810a-367e-4cac-b2c5-fd9402e52c17 make AWS_REGION=eu-west-1
