#!/bin/bash
:'
This script stresses the resources of all the running pods in the default namespace
'

function install_stress() {
    pod=$1
    commandPrefix="kubectl exec ${pod}"
    $commandPrefix -- which stress-ng &>/dev/null
    if [ ! $? -eq 0 ]; then
        echo "[DEBUG]: updating apt..."
        $commandPrefix -- apt update &>/dev/null
        echo "[DEBUG]: Install stress-ng ..."
        $commandPrefix -- apt install stress-ng -y &>/dev/null
    fi
}

function stress_service() {
    pod=$1
    kubectl exec ${pod} -- stress-ng --vm-bytes 4096 --cpu 1 --cpu-load 65% --hdd-bytes 1048576 --io 4 --timeout 20s &>>stress_tmp.log
}

output=$(kubectl get pods -o json)
length=$(echo $output | jq '.items | length')
if [ $length -gt 0 ]; then
    for c in $(seq 0 $((length - 1))); do
        name=$(echo $output | jq -r ".items[$c].metadata.name")
        install_stress $name
        echo "[DEBUG]: Running stress on $name ..."
        stress_service $name &
    done
fi
