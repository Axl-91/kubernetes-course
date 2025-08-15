#!/bin/bash

# Build and Deploy Script for k3d
# Usage: ./deploy.sh

set -e  # Exit on any error

echo -e "\033[32mBuilding Docker images...\033[0m\n"
docker build -t log-output-response:latest ./log-output-response
docker build -t log-output-writer:latest ./log-output-writer

echo -e "\n\033[32mImporting images to k3d cluster...\033[32m\n"
k3d image import log-output-response:latest
k3d image import log-output-writer:latest

echo -e "\n\033[32mDeploying to Kubernetes...\033[0m\n"
kubectl apply -f manifests

echo -e "\n\033[32mDeployment completed successfully!\033[0m\n"
