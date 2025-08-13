#!/bin/bash

# Build and Deploy Script for k3d
# Usage: ./deploy.sh

set -e  # Exit on any error

echo "Building Docker image..."
docker build -t log-output:latest .

echo "Importing image to k3d cluster..."
k3d image import log-output:latest

echo "Deploying to Kubernetes..."
kubectl apply -f manifests

echo "Deployment completed successfully!"
