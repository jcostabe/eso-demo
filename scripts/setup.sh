#!/bin/sh

eksctl create cluster --name $CLUSTER_NAME \ 
    --version=1.27 \
    --region $AWS_REGION \
    --zones ${AWS_REGION}a,${AWS_REGION}b \
    --managed --nodegroup-name mynodegroup