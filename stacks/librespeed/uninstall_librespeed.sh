#!/usr/bin/env bash
set -Eeuo pipefail

app=librespeed
ns=${app}

echo "===> uninstalling "${app}
helm uninstall -n ${app} ${ns}

sleep 5

echo "===> removing namespace: "${ns}
kubectl delete namespaces ${ns}

echo "===> done!"