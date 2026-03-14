#!/bin/bash

PROFILE=release-orchestration

# Install minikube
minikube start \
  --profile=$PROFILE \
  --memory=8192mb \
  --cpus=4 \
  --nodes=2 \
  --addons=metrics-server \
  --wait=all

# Install Istio
minikube addons enable istio-provisioner --profile=$PROFILE
minikube addons enable istio --profile=$PROFILE
kubectl label namespace default istio-injection=enabled

# Install Argo Rollouts
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

# Install Prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus oci://ghcr.io/prometheus-community/charts/prometheus -n monitoring --create-namespace

# Install Kyverno
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update
helm install kyverno kyverno/kyverno -n kyverno --create-namespace
