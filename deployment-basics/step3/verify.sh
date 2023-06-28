#!/bin/bash

NUM_REP=$(kubectl get deployment nginx-deployment -n k8sdeploy|wc -l)

if [ "$NUM_REP" -eq "2" ]; then
    exit 0
else
    exit 1
fi

