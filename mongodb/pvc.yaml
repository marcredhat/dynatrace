oc create -f - <<EOF
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: marco-mongo-pvc
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 10Gi
  storageClassName: non-dynamic
EOF
