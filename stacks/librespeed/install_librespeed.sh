#!/usr/bin/env bash
set -Eeuo pipefail

app=librespeed
ns=${app}
chart='k8s-at-home/librespeed'
ingress='librespeed-ingress.yaml'
values="./values.yaml"

echo "===> creating namespace: "${ns}
kubectl create namespace ${ns}

echo "===> installing Helm chart: "${chart}
helm repo update
if [ -f ${values}  ];
    then
        helm install -n ${ns} ${app} -f ${values} ${chart}
    else
        helm install -n ${ns} ${app} ${chart}
fi

echo "===> adding ingress for: "${app}
kubectl apply -f ${ingress}

kubectl get ingresses -n ${ns}
kubectl get pods -w -n ${ns}
~