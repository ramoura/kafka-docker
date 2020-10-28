#! /bin/sh

MACHINE=$1

if [ -z $MACHINE ]
then
  echo "The machine name must be informed"
else
  docker-machine create --driver amazonec2 --amazonec2-open-port 9092 --amazonec2-region us-east-1 --amazonec2-zone a $MACHINE
  eval $(docker-machine env $MACHINE)
  export DOCKER_HOST_IP=$(docker-machine ip $MACHINE)
fi

#aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId, State.Name]"
#aws ec2 start-instances --instance-ids 

