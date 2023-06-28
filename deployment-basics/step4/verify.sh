#!/bin/bash
  
POD=$(kubectl get po -n k8sdeploy|wc -l)

if [ "$POD" = "\"httpd:alpine\"" ]; then
    exit 0
else
    exit 1
fi
