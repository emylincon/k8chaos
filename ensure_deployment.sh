#!/bin/bash

function line_break() {
    echo "################################################################################################"
}

line_break
echo "[$(date)] - Starting Deployment Service manager..."
line_break

defaultReplicaCount=$(yq '.spec.replicas' <nginx.yaml | head -n 1)

while [ true ]; do
    output=$(kubectl get deployments.apps nginx-deployment -o json 2>/dev/null) # send error to /dev/null
    if [[ ! $? -eq 0 ]]; then
        echo "[$(date)] - Failed to get deployments.apps nginx-deployment"
        echo "[$(date)] - Restarting deployment..."
        kubectl apply -f nginx.yaml
        line_break
    fi
    replicaCount=$(echo $output | jq '.status.availableReplicas')
    # echo "[$(date)] - Replica count: $replicaCount"
    if [[ ! $replicaCount == $defaultReplicaCount ]]; then
        echo "[$(date)] - Replica count deviation: (replicaCount=$replicaCount)"
        echo "[$(date)] - Rescaling replica count"
        kubectl apply -f nginx.yaml
        line_break
    fi
    output=$(kubectl get svc nginx-service -o json 2>/dev/null)
    if [[ ! $? -eq 0 ]]; then
        echo "[$(date)] - Failed to get svc nginx-service"
        echo "[$(date)] - Restarting service..."
        kubectl apply -f nginx.yaml
        line_break
    fi
    sleep 2
done
