#!/bin/bash
cd ../

AWS_REGION=ap-southeast-2
AWS_PROFILE=datarcpt_ss

SOURCE_AMI_ID=$(AWS_PROFILE=$AWS_PROFILE aws \
	--region $AWS_REGION \
	ec2 describe-images \
	--output text \
	--filters \
		Name=owner-id,Values=679593333241 \
		Name=virtualization-type,Values=hvm \
		Name=root-device-type,Values=ebs \
		Name=name,Values='CIS Amazon Linux 2 Benchmark v1.*' \
		Name=architecture,Values=x86_64 \
		Name=state,Values=available \
	--query 'max_by(Images[], &CreationDate).ImageId')

echo $SOURCE_AMI_ID


PATH=~/bin:$PATH AWS_PROFILE=$AWS_PROFILE KMS_KEY_ID=da34a320-7bf8-475b-b506-e96defe9b0c0 make AWS_REGION=${AWS_REGION} SOURCE_AMI_ID=${SOURCE_AMI_ID} 1.11
