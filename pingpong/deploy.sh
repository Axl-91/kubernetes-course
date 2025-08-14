#!/bin/bash

# Build and Deploy Script for k3d
# Usage: ./deploy.sh

set -e  # Exit on any error

echo "Building Docker image..."
docker build -t ping-pong:latest .

echo "Importing image to k3d cluster..."
k3d image import ping-pong:latest

echo "Deploying to Kubernetes..."
kubectl apply -f manifests

echo "Deployment completed successfully!"
