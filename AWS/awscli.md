# eksctl Cheat Sheet

A collection of useful AWS CLI commands.

## Table of Contents

- [Account](#account)
- [Cost Explorer](#cost-explorer)
- [EC2]()
- [EFS]()
- [EKS]()
- [IAM]()

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

## EC2

| Command | Description |
|-|-|
| `aws ec2 authorize-security-group-ingress --group-id sg-xxx  --protocol tcp --port 2049 --cidr VPC_CIDR` | |
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

## IAM

| Command | Description |
|-|-|
| `aws iam get-account-summary` | |

## References

- [account](https://docs.aws.amazon.com/cli/latest/reference/account)
- [ce](https://docs.aws.amazon.com/cli/latest/reference/ce)
- [ec2](https://docs.aws.amazon.com/cli/latest/reference/ec2)
- [efs](https://docs.aws.amazon.com/cli/latest/reference/efs)
- [iam](https://docs.aws.amazon.com/cli/latest/reference/iam)