kubectl config set-context minikube --namespace=openfaas

export gw=http://$(minikube ip):31112
echo $gw

export OPENFAAS_URL=$gw
echo $OPENFAAS_URL


kubectl expose deployment prometheus --type=NodePort --name=prometheus-ui
kubectl get svc prometheus-ui
kubectl port-forward svc/prometheus-ui 9090:9090 &

kubectl run grafana --image=stefanprodan/faas-grafana:4.6.3 --port=3000
kubectl expose deployment grafana --type=NodePort --name=grafana
kubectl expose pod grafana --type=NodePort --name=grafana
kubectl get service grafana
kubectl port-forward svc/grafana 3000:3000 &
