#!/usr/bin/env bash
set -Eeuo pipefail

chart='k8s-at-home/librespeed '

helm show values ${chart} >values.yaml
cp values.yaml values.yaml.orig