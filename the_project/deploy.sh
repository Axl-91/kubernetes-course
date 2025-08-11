#!/bin/bash

# Build and Deploy Script for k3d
# Usage: ./deploy.sh

set -e  # Exit on any error

echo "Building Docker image..."
docker build -t the-project:latest .

echo "Importing image to k3d cluster..."
k3d image import the-project:latest

echo "Deploying to Kubernetes..."
kubectl apply -f manifests/deployment.yaml

echo "Deployment completed successfully!"
