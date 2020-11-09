### Pre-requisites:

- awscli
- aws account with aws config and credentials file setup

1. Navigate to 'work' directory.

replace the values in between `[]` with your own.

2. Deploy Shared Infrastructure Stack
   `aws --profile [AWS_PROFILE_NAME] --region [AWS_REGION] cloudformation deploy --template-file sharedInfra.cf.yaml --stack-name [STACK_NAME]`

3. Deploy DB Stack
   `aws --profile [AWS_PROFILE_NAME] --region [AWS_REGION] cloudformation deploy --template-file database.cf.yaml --stack-name [STACK_NAME]`

4. Obtain the DB Endpoint from AWS Console in the RDS section or from the command:
   `aws --profile [AWS_PROFILE_NAME] --region eu-west-1 cloudformation list-exports`
   Record the output key: `cross2-RdsInstanceDnsName` for the next step

5. Prepare the AMI

   - Create a the temp instance and allow SSH access to yourself.
   - Copy over local files from the `input` folder to remote server
     `rsync /local/file/path/input ec2-user@[PUBLIC_IP_OF_TEMP_INSTANCE]:/home/ec2-user/
   - Execute the `ami_pre.sh` (in the input folder) script which installs the dependancies
   - Shutdown the instance and convert it to an AMI. Record the AMI ID which will be used in step 8.

6. Restore DB Dump

   - `mysqldump -u webapp -p -h [RDS_INSTANCE_DNS_NAME] hello_world < hello_world.sql`
     note: [RDS_INSTANCE_DNS_NAME] is from step 4.

7. Deploy Compute Stack
   Update the value of the parameter `AmiId` in the template to the one you recorded in step 6.
   Change the parameter of the ``

   `aws --profile [AWS_PROFILE_NAME] --region [AWS_REGION] cloudformation deploy --template-file compute.cf.yaml --stack-name [STACK_NAME]`

   Record the DNS address of the ALB and navigate to it using your browser.
