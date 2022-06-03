# add a sample application stack

# get chart values
Prior to installation, pull the chart values for any local customizations; original is saved as values.yaml.orig and working copy is values.yaml
'''$ ./get_chart_values.sh'''

# add ingress to sample application's namespace
Sample ingress to a namespace is provided at librespeed_ingress.yaml
Adjust to local needs.
Add librespeed.example.com and IP address to your local DNS server; I use pi-hole for local DNS

# install sample application from chart
'''$ ./install_librespeed.sh'''

# uninstall sample application
'''$ ./uninstall_librespeed.sh'''