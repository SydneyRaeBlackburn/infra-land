#!/bin/bash

minikube delete --profile=release-orchestration

helm repo remove prometheus-community

helm repo remove kyverno