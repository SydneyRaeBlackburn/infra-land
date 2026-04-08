# Kubernetes Release Orchestraion

## Description
Build an Operator that manages canary deployments using Argo Rollouts and Istio. Create a GitHub Action that triggers the Operator when PRs merge, progressively shifting traffic while monitoring metrics (Prometheus). If errors spike, auto-rollback; otherwise, complete the deployment. Include custom CRDs to let developers declare deployment strategies declaratively.

## Plan

### Phase 1: Foundation Setup
1. Local Kubernetes cluster
  - [Install Minikube](https://minikube.sigs.k8s.io/docs/start/)
  - Verify cluster connectivity with `kubectl`

2. Install Core Components
  - [Argo Rollouts](https://argo-rollouts.readthedocs.io/en/stable/installation/) - progressive deployments
  - [Istio](https://minikube.sigs.k8s.io/docs/handbook/addons/istio/) - service mesh & traffic switching
  - [Prometheus](https://github.com/prometheus-community/helm-charts) - metrics collection
  - [Kyverno](https://kyverno.io/docs/installation/installation/#helm-chart) - policy validation

3. Test basic deployment
  - Deploy versioned `test-app` with Helm
  - Create Argo Rollout resource and verify traffic switching works

### Phase 2: Custom Operator Development
1. Design Custom CRD
  - Define a ReleaseStrategy CRD that lets developers specify: canary traffic percentage, duration, success metrics (error rate threshold, latency), and rollback conditions
  - Ex. `canaryPercent: 10%, duration: 5m, errorThreshold: 5% ...`

2. Build Operator
  - Use [Kubebuilder](https://book.kubebuilder.io/) framework
  - Operator watched for ReleaseStrategy resources
  - When detected, the Operator:
    - Creates/updates an Argo Rollout with the specified strategy
    - Configures Istio VirtualService for traffic splitting
    - Sets up Prometheus rules to monitor the specified metrics

3. Implement Reconciliation Logic
  - Operator monitors Prometheus metrics during canary phase
  - If error rate exceeds threshold -> trigger rollback
  - If metrics are healthy -> auto-complete the rollout

#### TODO
- ~~Implement versioning (short uuids) and automate with deploy command~~
- ~~Figure out why Argo is auto promoting when it's disabled~~
  - ~~Look into [autoPromotionSeconds](https://argo-rollouts.readthedocs.io/en/stable/features/bluegreen/#autopromotionseconds)~~
- ~~[Traffic switch with Istio](https://argo-rollouts.readthedocs.io/en/stable/getting-started/istio/)~~
- ~~Access app and test traffic distribution during deployment~~
- Verify cluster setup installs were successful
- Add call count to api, output in distribution test
- Update [Gateway](https://istio.io/latest/docs/setup/additional-setup/gateway/) to shared

#### Future Implementations
- [Trivy Operator](https://github.com/aquasecurity/trivy-operator) - runtime container scanning
- [checkov](https://github.com/bridgecrewio/checkov) - IaC scanner

## Setup

### Install
```sh
$ ./cluster-setup.sh

$ make install
```

### Deploy
```sh
$ make deploy
```

## Access
```sh
$ kubectl port-forward svc/istio-ingressgateway -n istio-system 8080:80

$ curl http://localhost:8080/
```

## Teardown
```sh
$ ./cluster-teardown.sh
```