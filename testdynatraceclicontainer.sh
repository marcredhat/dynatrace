#!/bin/bash
printf "\n***podman container ls***\n"
podman container ls
dynatraceclicontainer=`podman container ls  | grep dynatracecli |  awk '{print $1'}`


printf "==============================================================="
printf "\nRunning commands inside the Dynatrace CLI container using podman\n"
printf "==============================================================="
printf "\n***Display my OpenShift nodes using Dynatrace CLI***\n"


podman exec -i  $dynatraceclicontainer '/bin/sh' -c 'python3 dynatrace-cli/dtcli.py ent host .*ocp*. displayName'


printf "\n***Display the IP addresses of my OpenShift nodes using Dynatrace CLI***\n"
podman exec -i  $dynatraceclicontainer '/bin/sh' -c 'python3 dynatrace-cli/dtcli.py ent host .*ocp*. ipAddresses'


printf "\n***Display applications using Dynatrace CLI***\n"
podman exec -i  $dynatraceclicontainer '/bin/sh' -c 'python3 dynatrace-cli/dtcli.py ent app  .*web*. displayName'
