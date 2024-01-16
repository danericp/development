# AWS CLI Cheat Sheet

A collection of useful AWS CLI commands.

## Table of Contents

- [Account](#account)
- [Cost Explorer](#cost-explorer)
- [EC2 - Elastic Compute Cloud](#ec2---elastic-compute-cloud)
- [EFS - Elastic File System](#efs---elastic-file-system)
- [EKS - Elastic Kubernetes System](#eks---elastic-kubernetes-service)
- [IAM - Identity and Access Management](#iam---identity-and-access-management)
- [RDS - Relational Database Service]()
- [SAM - Serverless Application Model]()
- [S3 - Simple Storage Service](#s3---simple-storage-service)

---

## Account

| Command | Description |
|-|-|
| `aws account get-contact-information` | Get - Account Contact Information |

### Insert Account Contact Information

```bash
aws account put-contact-information --contact-information \
'{"AddressLine1": "111 Dummy", "City": "FakeCity", "CountryCode": "CC", "FullName": "Full Name Here", "PhoneNumber": "+11111111111", "PostalCode": "11111", "StateOrRegion": "ST"}'
```

## Cost Explorer

| Command | Description |
|-|-|
| `aws ce get-cost-and-usage --time-period Start=2023-01-01,End=2023-01-31 --granularity MONTHLY --metrics "BlendedCost" --group-by "Type=DIMENSION,Key=SERVICE"` | Delete an EKS cluster |

## EC2 - Elastic Compute Cloud

| Command | Description |
|-|-|
| `aws ec2 authorize-security-group-ingress --group-id sg-xxx  --protocol tcp --port 2049 --cidr VPC_CIDR` | |
| `aws ec2 create-key-pair --key-name linux --query 'KeyMaterial' --output text > linux.pem` | |
| `aws ec2 create-security-group --description efs-test-sg --group-name efs-sg --vpc-id VPC_ID` | |
| `aws ec2 describe-instances --filters "Name=tag:Name,Values=jenkins" --output text --query 'Reservations[*].Instances[*].[PrivateIpAddress]' --region=eu-central-1` | |
| `aws ec2 describe-instances --filters "Name=tag:Name,Values=jenkins" --output text --query 'Reservations[*].Instances[*].InstanceId' --region=eu-central-1` | |
| `aws ec2 describe-instances --filters "Name=tag:Name,Values=jenkins" --region=eu-central-1` | |
| `aws ec2 describe-instances --filters Name=tag-key,Values=Name --query "Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,Name:Tags[?Key=='Name'].Value}" --output json` | |
| `aws ec2 describe-instances --filters Name=tag-key,Values=Name --query "Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,Name:Tags[?Key=='Name']\|[0].Value}" --output table ` | |
| `aws ec2 describe-instances --filters Name=tag-key,Values=Name --query "Reservations[*].Instances[*].{Type:InstanceType, Instance:InstanceId, AZ:Placement.AvailabilityZone, Name:Tags[?Key=='Name']\|[0].Value, IP:PrivateIpAddress, DNS:PrivateDnsName, Status:State.Name}" --output json` | |
| `aws ec2 describe-instances --filters Name=tag-key,Values=Name --query "Reservations[*].Instances[*].{Type:InstanceType, Instance:InstanceId, AZ:Placement.AvailabilityZone, Name:Tags[?Key=='Name']\|[0].Value, IP:PrivateIpAddress, DNS:PrivateDnsName, Status:State.Name}" --output json \| ConvertFrom-Json` | |
| `aws ec2 describe-instances --filters Name=tag-key,Values=Name --query "Reservations[*].Instances[*].{Type:InstanceType, Instance:InstanceId, AZ:Placement.AvailabilityZone, Name:Tags[?Key=='Name']\|[0].Value, IP:PrivateIpAddress, DNS:PrivateDnsName, Status:State.Name}" --output table` | |
| `aws ec2 describe-instances --filters Name=tag-key,Values=Name --query "Reservations[*].Instances[*].{Type:InstanceType, Instance:InstanceId, AZ:Placement.AvailabilityZone, Name:Tags[?Key=='Name']\|[0].Value, IP:PrivateIpAddress, DNS:PrivateDnsName, Status:State.Name} \| sort_by(@, &[0].IP)" --output table` | |
| `aws ec2 describe-instances --filters Name=tag-key,Values=Name --query "Reservations[*].Instances[*].{Type:InstanceType, Instance:InstanceId, AZ:Placement.AvailabilityZone, Name:Tags[?Key=='Name']\|[0].Value, IP:PrivateIpAddress, DNS:PrivateDnsName, Status:State.Name} \| sort_by(@, &[0].Name)" --output table` | |
| `aws ec2 describe-instances --filters Name=tag-key,Values=Name --query "Reservations[*].Instances[*].{Type:InstanceType, Instance:InstanceId, AZ:Placement.AvailabilityZone, Name:Tags[?Key=='Name']\|[0].Value, IP:PrivateIpAddress, DNS:PrivateDnsName, Status:State.Name}" --output text` | |
| `aws ec2 describe-instances --filters Name=tag-key,Values=Name --query "Reservations[*].Instances[*].{Type:InstanceType, Instance:InstanceId, AZ:Placement.AvailabilityZone, Name:Tags[?Key=='Name']\|[0].Value, IP:PrivateIpAddress, DNS:PrivateDnsName, Status:State.Name}" --output text \| Export-Csv -Path .\ProcessLog.csv` | |
| `aws ec2 describe-volumes --query "Volumes[*].{AZ:AvailabilityZone,ID:VolumeId,Attachment:Attachments[*],Tags:Tags[*]}" --volume-ids vol-0aaaaaaaaaaaaaaa5 --output table` | |
| `aws ec2 describe-volumes --query "Volumes[*].{AZ:AvailabilityZone,ID:VolumeId,Attachment:Attachments[*]}" --output table` | |
| `aws ec2 describe-volumes --query "Volumes[*].{AZ:AvailabilityZone,ID:VolumeId,Attachment:Attachments[*]}" --output text` | |
| `aws ec2 describe-vpcs --vpc-ids vpc-id --query "Vpcs[].CidrBlock" --output text` | |
| `aws ec2 run-instances --image-id ami-xxxxxxxx --count 1 --instance-type t2.micro --key-name your_key_name --security-group-ids your_security_group_id --subnet-id your_subnet_id` | |

## EFS - Elastic File System

| Command | Description |
|-|-|
| `aws efs create-file-system --creation-token eks-efs` | |
| `aws efs create-mount-target --file-system-id FileSystemId --subnet-id SubnetID --security-group GroupID` | |
| `aws efs describe-file-systems --query "FileSystems[*].FileSystemId" --output text` | |

## EKS - Elastic Kubernetes Service

| Command | Description |
|-|-|
| `aws eks describe-cluster --name getting-started-eks --query "cluster.resourcesVpcConfig.vpcId" --output text` | |

## IAM - Identity and Access Management

| Command | Description |
|-|-|
| `aws iam get-account-summary` | |

## RDS - Relational Database Service

| Command | Description |
|-|-|
| `aws rds describe-db-instances --db-instance-identifier jira-aurora-db` | |
| `aws rds describe-db-instances --db-instance-identifier jira-aurora-db --query 'DBInstances[*].Endpoint.Address' --output text` | |
| `aws rds describe-db-instances --db-instance-identifier jira-aurora-db --query 'DBInstances[*].[Endpoint.Address,Endpoint.HostedZoneId]' --output text` | |

### For Powershell Reports

| Command | Description |
|-|-|
| `aws rds describe-db-instances --query "DBInstances" --output json \| ConvertFrom-Json \| ft` | |
| `RDS aws rds describe-db-instances --query="DBInstances[*]" --db-instance-identifier DBInstanceIdentifier \| ConvertFrom-Json` | |
| `RDS aws rds describe-db-instances --query="DBInstances[*].{Identifier:DBInstanceIdentifier,Class:DBInstanceClass,Engine:Engine,Status:DBInstanceStatus,MasterUsername:MasterUsername,DBName:DBName,Endpoint:Endpoint,AllocatedStorage:AllocatedStorage}" \| ConvertFrom-Json \| ft` | |
| `RDS aws rds describe-db-instances --query="DBInstances[*].{Identifier:DBInstanceIdentifier,Class:DBInstanceClass,Engine:Engine,Status:DBInstanceStatus,MasterUsername:MasterUsername,DBName:DBName,Endpoint:Endpoint,AllocatedStorage:AllocatedStorage}" --db-instance-identifier DBInstanceIdentifier` | |
| `RDS aws rds describe-db-instances --query="DBInstances[*].{Identifier:DBInstanceIdentifier,Class:DBInstanceClass,Engine:Engine,Status:DBInstanceStatus,MasterUsername:MasterUsername,DBName:DBName,Endpoint:Endpoint,AllocatedStorage:AllocatedStorage}" --db-instance-identifier DBInstanceIdentifier --output table` | |

## S3 - Simple Storage Service

| Command | Description |
|-|-|
| `aws s3 mb --region <Region> "s3://<Bucket Name>"` | |
| `aws s3 mb --region us-east-1 "s3://static-s3-bucket"` | |
| `aws s3api list-buckets` | |
| `aws s3api put-public-access-block --bucket <Bucket Name> --public-access-block-configuration <Configuration>` | |
| `aws s3api put-public-access-block --bucket static-s3-bucket --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"` | |
| `aws s3api sync <Directory> "s3://<Bucket Name>"` | |
| `aws s3api sync . s3://luxxy-covid-testing-system-pdf-en-xxxx` | |

## SAM - Serverless Application Model

| Command | Description |
|-|-|
| `cd ./sam-app` | |
| `sam build` | |
| `sam deploy --guided` | |
| `sam init` | |
| `sam local invoke` | Invoke Function |
| `sam sync --stack-name {{stack-name}} --watch` | Test Function in the Cloud |
| `sam validate` | Validate SAM template |

## References

* [account](https://docs.aws.amazon.com/cli/latest/reference/account)
* [ce](https://docs.aws.amazon.com/cli/latest/reference/ce)
* [ec2](https://docs.aws.amazon.com/cli/latest/reference/ec2)
* [efs](https://docs.aws.amazon.com/cli/latest/reference/efs)
* [iam](https://docs.aws.amazon.com/cli/latest/reference/iam)
* [s3](https://docs.aws.amazon.com/cli/latest/reference/s3)

- [Set the AWS CLI output format](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-output-format.html)