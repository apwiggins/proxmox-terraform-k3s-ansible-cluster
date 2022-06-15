#!/usr/bin/env bash
set -Eeuo pipefail

chart='k8s-at-home/librespeed '

echo "==> installing k8s-at-home helm repo"
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update

echo "==> saving values at ./values.yaml"
helm show values ${chart} >values.yaml
cp values.yaml values.yaml.orig