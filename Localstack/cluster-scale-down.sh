SCRIPT_LIB=cluster-scale-init.sh
shopt -s expand_aliases
source ./${SCRIPT_LIB}

blog "Terraform - destroying clusters"
terraform -chdir="./terraform" destroy --auto-approve
if [[ -f ./cluster.json ]]
then
    rm -f ./cluster.json
fi

blog "Kubernetes - destroying all resources"
kubectl delete all --all

blog "Terraform - destroying providers"
rm -rf ./terraform/.terraform

blog "Docker - destroying localstack, plus volumes"
docker-compose -f ./docker/docker-compose.yml stop
docker-compose -f ./docker/docker-compose.yml rm --force
# docker image prune --all --force
if [[ -d ${DIR_LOCALSTACKPRO_VOLUME} ]]
then
    rm -rf ${DIR_LOCALSTACKPRO_VOLUME}
fi

# blog "Kubernetes - destroying namespace localstack-pro"
# kubectl delete namespace localstack-prod

blog "Backing-up files"
if [[ -f ${DIR_TERRAFORM}/.terraform.lock.hcl ]]
then
    mv ${DIR_TERRAFORM}/.terraform.lock.hcl ${DIR_BACKUP}/.terraform.lock.hcl.$(date +${STAMP_DATE})
fi
if [[ -f ${DIR_TERRAFORM}/terraform.tfstate.backup ]]
then
    mv ${DIR_TERRAFORM}/terraform.tfstate.backup ${DIR_BACKUP}/terraform.tfstate.backup.$(date +${STAMP_DATE})
fi
if [[ -f ${DIR_TERRAFORM}/terraform.tfstate ]]
then
    rm ${DIR_TERRAFORM}/terraform.tfstate
fi

echo -e "Run this command\nalias aws='aws'\n"