#check JSON models e.g. #https://www.dynatrace.com/support/help/dynatrace-api/configuration-api/service-api/custom-services-api/get-all/?response-parameters%3C-%3Ejson-model=json-model#parameters
#to see what info is available from Dynatrace
ubicontainer=$(buildah from registry.access.redhat.com/ubi8/ubi-minimal:latest)
export CONTAINER_FS=$(buildah mount)
#buildah run $ubicontainer microdnf update -y && \
buildah run $ubicontainer microdnf  install git python3-pip -y && \
buildah run $ubicontainer git clone https://github.com/Dynatrace/dynatrace-cli.git && \

buildah run $ubicontainer  pip3 install requests
buildah config --cmd /bin/bash ${ubicontainer} && \
buildah run $ubicontainer -- sh -c "python3 dynatrace-cli/dtcli.py config apitoken <Dynatrace API token> tenanthost <XXXXXXX.live.dynatrace.com>"
printf "\n***Display my OpenShift nodes using Dynatrace CLI***\n"
buildah run $ubicontainer -- sh -c "python3 dynatrace-cli/dtcli.py ent host .*ocp*. displayName"
printf "\n***Display the IP addresses of my OpenShift nodes using Dynatrace CLI***\n"
buildah run $ubicontainer -- sh -c "python3 dynatrace-cli/dtcli.py ent host .*ocp*. ipAddresses"
printf "\n***Display applications using Dynatrace CLI***\n"
buildah run $ubicontainer -- sh -c "python3 dynatrace-cli/dtcli.py ent app  .*web*. displayName"

#https://www.dynatrace.com/support/help/dynatrace-api/configuration-api/service-api/custom-services-api/get-all/?response-parameters%3C-%3Ejson-model=json-model#parameters
#buildah run $ubicontainer -- sh -c "python3 dynatrace-cli/dtcli.py ent srv serviceTechnologyTypes=Java  discoveredName"
#['Internal service', 'Jenkins v2.222.1', 'Jenkins v2.222.1', 'Requests executed in background threads of com.install4j.runtime.launcher.UnixLauncher nexus-*', 'Requests executed in background threads of jenkins.war jenkins-*', 'Requests executed in background threads of org.sonar.server.app.WebServer sonarqube-*', 'ScriptResource', 'Sonatype Nexus']
#buildah run $ubicontainer -- sh -c "python3 dynatrace-cli/dtcli.py ent srv .*Jenkins*. discoveredName"

#buildah run $ubicontainer -- sh -c "python3 dynatrace-cli/dtcli.py evt query from=60 to=0 host .*ocp.*"

#buildah run $ubicontainer -- sh -c "python3 dynatrace-cli/dtcli.py ent app .*web*."
#{'nextEventStartTms': None, 'nextEventId': None, 'nextCursor': None, 'from': 1595790690000, 'to': 1595794290000, 'totalEventCount': 0, 'events': []}
#['APPLICATION-EA7C4B59F27D43EB']
#buildah run $ubicontainer -- sh -c "python3 dynatrace-cli/dtcli.py  evt query entityId=APPLICATION-EA7C4B59F27D43EB"
