#!/bin/bash


repository=$1
tag=$2
if [ -z "$tag" ] || [ -z "$repository" ] ; then
    echo "Enter repository and tag"
    exit 1
fi

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $repository:$tag

docker build -t $repository:tag .
docker tag $repository:tag $repository:latest
docker push $repository:tag
docker push $repository:latest


