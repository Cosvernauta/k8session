#!/bin/bash

NUM_REP=$(kubectl get pods mi-primer-pod | wc -l)

if [ "$NUM_REP" -eq "0" ]; then
    exit 0
else
    exit 1
fi

