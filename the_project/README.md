# The Project (Todo Server)

Steps to deploy

```
docker build -t the-project:latest .
k3d image import the-project:latest
kubectl apply -f manifests/deployment.yaml
```
