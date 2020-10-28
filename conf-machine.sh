#! /bin/sh


MACHINE=$1
REGEN=$2


if [ -z $MACHINE ]
then
  echo "The machine name must be informed"
else
  if [ ! -z $REGEN ]
  then 
    docker-machine regenerate-certs $MACHINE
  fi
  eval $(docker-machine env $MACHINE)
  export DOCKER_HOST_IP=$(docker-machine ip $MACHINE)
fi

#aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId, State.Name]"
#aws ec2 start-instances --instance-ids i-0a410f3d8ae82e698
