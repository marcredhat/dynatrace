DT_TENANT=eyeXXXXX.live.dynatrace.com
DT_API_TOKEN=<Dynatrace API token>
DT_PAAS_TOKEN=<Dynatrace PaaS token>
oc -n keptn create secret generic dynatrace --from-literal="DT_TENANT=$DT_TENANT" --from-literal="DT_API_TOKEN=$DT_API_TOKEN"  --from-literal="DT_PAAS_TOKEN=$DT_PAAS_TOKEN" --from-literal="KEPTN_API_URL=http://localhost:8080/api" --from-literal="KEPTN_API_TOKEN=$KEPTN_API_TOKEN"
