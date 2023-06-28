#!/bin/bash
  
POD=$(kubectl get po -n k8sdeploy|grep -v "NAME"|wc -l)

if [ "$POD" -eq "10" ]; then
    exit 0
else
    exit 1
fi
