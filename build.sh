ubicontainer=$(buildah from registry.access.redhat.com/ubi8/ubi-minimal:latest)
export CONTAINER_FS=$(buildah mount)
#buildah run $ubicontainer microdnf update -y && \
buildah run $ubicontainer microdnf  install git python3-pip -y && \
buildah run $ubicontainer git clone https://github.com/Dynatrace/dynatrace-cli.git && \

buildah run $ubicontainer  pip3 install requests
buildah config --cmd /bin/bash ${ubicontainer} && \
buildah run $ubicontainer -- sh -c "python3 dynatrace-cli/dtcli.py --help"
