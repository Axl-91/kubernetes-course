#!/bin/bash

# Build and Deploy Script for k3d
# Usage: ./deploy.sh

GREEN='\033[32m'
RESET='\033[0m'

set -e  # Exit on any error

echo -e "\n${GREEN}Building Docker images...${RESET}\n"
docker build -t log-output-response:latest ./log-output-response
docker build -t log-output-writer:latest ./log-output-writer

echo -e "\n${GREEN}Importing images to k3d cluster...${RESET}\n"
k3d image import log-output-response:latest
k3d image import log-output-writer:latest

echo -e "\n${GREEN}Deploying to Kubernetes...${RESET}\n"
kubectl apply -f manifests

echo -e "\n${GREEN}Deployment completed successfully!${RESET}\n"
