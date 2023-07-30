#!/bin/sh

kubectl delete -f ../eso-manifests/external-secret.yaml

kubectl delete -f ./eso-manifests/secret-store.yaml

eksctl delete iamserviceaccount \
    --name $SERVICE_ACCOUNT_NAME \
    --namespace $SERVICE_ACCOUNT_NAMESPACE \
    --cluster $CLUSTER_NAME

helm delete external-secrets --namespace external-secrets

eksctl delete cluster --region=$AWS_REGION --name=$CLUSTER_NAME
 
aws iam delete-policy --policy-arn=$POLICY_ARN