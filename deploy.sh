#!/usr/bin/env bash

set -e

# Login to Kubernetes Cluster.
if [ -n "$CLUSTER_ROLE_ARN" ]; then
    aws eks \
        --region ${AWS_REGION} \
        update-kubeconfig --name ${CLUSTER_NAME} \
        --role-arn=${CLUSTER_ROLE_ARN}
else
    aws eks \
        --region ${AWS_REGION} \
        update-kubeconfig --name ${CLUSTER_NAME} 
fi

# Helm Deployment
if [ -z  $DEPLOY_CHART_PATH ]; then
  cd $DEPLOY_CHART_PATH
fi
APPLY_COMMAND="helmfile -e $DEPLOY_NAMESPACE --file $DEPLOY_CHART_PATH/${HELM_FILE_NAME} apply --context 4"
echo "Executing: ${APPLY_COMMAND}"
${APPLY_COMMAND}