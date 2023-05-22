SCRIPT_LIB=cluster-scale-init.sh
shopt -s expand_aliases
source ./${SCRIPT_LIB}

# set -vx

blog "Docker - starting localstack-pro"
docker-compose -f ./docker/docker-compose.yml up -d --remove-orphans

blog "Terraform - Init"
terraform -chdir="./terraform" fmt
terraform -chdir="./terraform" init
terraform -chdir="./terraform" plan
terraform -chdir="./terraform" apply --auto-approve

echo -e "Run this command\nalias aws='aws --endpoint-url=http://localhost:4566'\n"