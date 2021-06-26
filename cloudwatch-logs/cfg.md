1. IAM Policy for cloudwatch logs privileges
2. IAM role for EC2 and attach this policy
3. Install Cloudwatch agent on EC2:
   1. sudo yum update -y
   2. sudo yum install -y awslogs
4. service awslogsd start
5. create log file, append text, check with cloudwatch management console to see the output in log groups
6. create metric filter on logs that contain ERROR
7. create Alarm, with SNS email notification
8. simulate the error to test
