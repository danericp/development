SCRIPT_LIB=cluster-scale-init.sh
shopt -s expand_aliases
source ./${SCRIPT_LIB}

blog "Checking instances"

INT_POPULATE="*"

JSON_EC2_INS=$(aws --endpoint-url=http://localhost:4566 ec2 describe-instances --query "Reservations[${INT_POPULATE}].Instances[${INT_POPULATE}].{ID:InstanceId,AMI:ImageId,TYPE:InstanceType,KEY_PAIR:KeyName,PRIVATE_DNS:PrivateDnsName,PRIVATE_IP:PrivateIpAddress,PUBLIC_DNS:PublicDnsName,PUBLIC_IP:PublicIpAddress,STATUS:State.Name,SUBNET:SubnetId,VPC:VpcId,Tag:Tags[*].Value}" | jq -c)
JSON_EC2_IG=$(aws --endpoint-url=http://localhost:4566 ec2 describe-internet-gateways --query "InternetGateways[${INT_POPULATE}].{ID:InternetGatewayId,Attachment:Attachments,Tag:Tags[*].Value}" | jq -c)
JSON_EC2_KP=$(aws --endpoint-url=http://localhost:4566 ec2 describe-key-pairs --query "KeyPairs[${INT_POPULATE}].{ID:KeyPairId,Name:KeyName}" | jq -c)
JSON_EC2_NA=$(aws --endpoint-url=http://localhost:4566 ec2 describe-network-acls --query "NetworkAcls[${INT_POPULATE}].{ID:NetworkAclId,VPC:VpcId,Entries:Entries[*].{NUM:RuleNumber,ACTION:RuleAction,CIDR:CidrBlock,PROTOCOL:Protocol,RANGE:PortRange.{FROM:From,TO:To}},Tag:Tags[*].Value}" | jq -c)
JSON_EC2_RT=$(aws --endpoint-url=http://localhost:4566 ec2 describe-route-tables --query "RouteTables[${INT_POPULATE}].{ID:RouteTableId,VPC:VpcId,Routes:Routes[*].DestinationCidrBlock,Tag:Tags[*].Value}" | jq -c)
JSON_EC2_SG=$(aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --query "SecurityGroups[${INT_POPULATE}].{ID:GroupId,NAME:GroupName,IpPermissionsEgress:IpPermissionsEgress[*].{PROTOCOL:IpProtocol,RANGE:IpRanges},Tag:Tags[*].Value}" | jq -c)
JSON_EC2_SN=$(aws --endpoint-url=http://localhost:4566 ec2 describe-subnets --query "Subnets[${INT_POPULATE}].{ID:SubnetId,CIDR:CidrBlock,VPC:VpcId,Tag:Tags[*].Value}" | jq -c)
JSON_EC2_VPC=$(aws --endpoint-url=http://localhost:4566 ec2 describe-vpcs --query "Vpcs[${INT_POPULATE}].{ID:VpcId,CIDR:CidrBlock,Tag:Tags[*].Value}" | jq -c)
JSON_DOCKER_CTR=$(docker container inspect --format '{ "Container": "=docker-centos7", "Image": "{{.Config.Image}}", "Status": "{{.State.Status}}", "IP": "{{.NetworkSettings.IPAddress}}"}' docker-centos7)
JSON_KUBERNETES_NODE=$(echo "{$(kubectl get node -o jsonpath='{range .items[*]}"Node":"{.metadata.name}","InternalIP":"{.status.addresses[0].address}"{end}')}")
JSON_KUBERNETES_POD=$(echo "{$(kubectl get pods -o jsonpath='{range .items[*]}"Pod":"{.metadata.name}","Image":"{.spec.containers[*].image}","Node":"{.spec.nodeName}","Ports":"{.spec.containers[0].ports[0].hostPort}:{.spec.containers[0].ports[0].containerPort}"{end}')}")

echo "{
    \"JSON_EC2_Instances\":${JSON_EC2_INS},
    \"JSON_EC2_InternetGateways\":${JSON_EC2_IG},
    \"JSON_EC2_KeyPairs\":${JSON_EC2_KP},
    \"JSON_EC2_NetworkACLs\":${JSON_EC2_NA},
    \"JSON_EC2_RouteTables\":${JSON_EC2_RT},
    \"JSON_EC2_SecurityGroups\":${JSON_EC2_SG},
    \"JSON_EC2_Subnets\":${JSON_EC2_SN},
    \"JSON_EC2_VirtualPrivateClouds\":${JSON_EC2_VPC},
    \"JSON_DOCKER_CTR\":${JSON_DOCKER_CTR},
    \"JSON_KUBERNETES_NODE\":${JSON_KUBERNETES_NODE},
    \"JSON_KUBERNETES_POD\":${JSON_KUBERNETES_POD}
}" > ${FILE_CLUSTER}

echo -e "---------- AWS Section ----------"
echo "AWS, EC2, Instances: ${JSON_EC2_INS}" && echo
echo "AWS, EC2, Internet Gateway: ${JSON_EC2_IG}" && echo
echo "AWS, EC2, Key Pair: ${JSON_EC2_KP}" && echo
echo "AWS, EC2, Network ACLs: ${JSON_EC2_NA}" && echo
echo "AWS, EC2, Route Tables: ${JSON_EC2_RT}" && echo
echo "AWS, EC2, Security Groups: ${JSON_EC2_SG}" && echo
echo "AWS, EC2, Subnets: ${JSON_EC2_SN}" && echo
echo "AWS, EC2, VPC Lists: ${JSON_EC2_VPC}"
echo -e "---------------------------------\n"

echo -e "---------- Docker Section ----------"
echo "Docker, host-docker-centos7: ${JSON_DOCKER_CTR}"
echo -e "------------------------------------\n"

echo -e "---------- Kubernetes Section ----------"
echo "Kubernetes, node: ${JSON_KUBERNETES_NODE}"
echo "Kubernetes, pod: ${JSON_KUBERNETES_POD}"
echo -e "----------------------------------------\n"

# aws --endpoint-url=localhost:4566
# docker container inspect host-docker-centos7
# docker container inspect --format '{{.State.Status}}' host-docker-centos7
# docker container inspect --format 'Docker, Container: host-docker-centos7, Image: {{.Config.Image}}, Status: {{.State.Status}}, IP: {{.NetworkSettings.IPAddress}}' host-docker-centos7
# kubectl get node -o jsonpath="{range .items[*]} Kubernetes, Node: {.metadata.name}, InternalIP:{.status.addresses[0].address} {end}"
# kubectl get pods -o jsonpath="{range .items[*]}Kubernetes, Pod: {.metadata.name}, Image: {.spec.containers[*].image}, Node: {.spec.nodeName} {end}"