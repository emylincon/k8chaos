#!/bin/bash

function line_break() {
    echo "################################################################################################"
}

line_break
echo "[$(date)] - Starting Deployment Service manager..."
line_break
while [ true ]; do
    kubectl get deployments.apps nginx-deployment &>/dev/null
    if [[ ! $? -eq 0 ]]; then
        echo "[$(date)] - Failed to get deployments.apps nginx-deployment"
        echo "[$(date)] - Restarting deployment..."
        kubectl apply -f nginx.yaml
        line_break
    fi
    sleep 2
done
