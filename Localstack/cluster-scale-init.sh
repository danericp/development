DIR_BACKUP=./backup
DIR_LOCALSTACKPRO_VOLUME=./docker/volume
DIR_LOG=./log
DIR_TERRAFORM=./terraform
FILE_CLUSTER=./cluster.json
FILE_DOCKER_COMPOSE=./docker/docker-compose.yml
STAMP_DATE=%Y%m%d
STAMP_DATETIME=%Y/%m/%d-%H:%M:%S

if [[ ! -d ${DIR_LOG} ]]
then
    mkdir ${DIR_LOG}
fi

if [[ ! -d ${DIR_BACKUP} ]]
then
    mkdir ${DIR_BACKUP}
fi

blog () {
    echo -e "$(date +"${STAMP_DATETIME}") - ${@}" | tee -a ./log/log-$(date +"${STAMP_DATE}").log
}

blog init