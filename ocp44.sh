sudo ssh -X root@dell-r730-001  -L 443:console-openshift-console.apps.ocp4.local:443 -L 80:nexus-cicd-marc.apps.ocp4.local:80 -L 80:ansible-tower-web-svc-tower371.apps.ocp4.local:80
