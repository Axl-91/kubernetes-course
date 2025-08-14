# Ping Pong

To deploy run the `deploy.sh` script
The ingress for this app is shared with log_output, so you need to run that ingress 

Ex:
``` bash
./deploy.sh
kubectl apply -f ../log_output/manifests/ingress.yaml
```

