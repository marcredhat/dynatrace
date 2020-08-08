oc create -f - <<EOF
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv0064
spec:
  capacity:
    storage: 10Gi
  accessModes:
  - ReadWriteOnce
  nfs:
    path: /mnt/marc
    server: 10.1.8.11
  persistentVolumeReclaimPolicy: Retain
  storageClassName: non-dynamic
EOF
