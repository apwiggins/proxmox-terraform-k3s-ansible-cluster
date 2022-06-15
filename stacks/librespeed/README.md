# Add a sample application stack

Assumes that you have [kubectl] (<https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/>) and [helm] (<https://helm.sh/docs/intro/install/>) installed

## 1. Get chart values

Prior to installation, pull the chart values for any local customizations; original is saved as values.yaml.orig and working copy is values.yaml

`./get_chart_values.sh`

## 2. Add ingress to sample application's namespace

Sample ingress to a namespace is provided at librespeed_ingress.yaml
Adjust to local needs.
Add librespeed.example.com and IP address to your local DNS server; I use pi-hole for local DNS

## 3. Install sample application from chart

`./install_librespeed.sh`

## 4. Uninstall sample application

`./uninstall_librespeed.sh`
