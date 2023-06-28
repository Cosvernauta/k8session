#!/bin/bash

DEPLOY=$(ubectl get deploy nginx-deployment -n k8sdeploy|wc -l)

if [ "$DEPLOY" -eq "0" ]; then
  exit 0
else
  exit 1
fi
