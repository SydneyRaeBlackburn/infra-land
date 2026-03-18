# Rolling
Set startegy in `deployment.yaml` to `RollingUpdate`:
```yaml
  ...
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 25% # allow 1/4 of pods to be unavailable at once
      maxSurge: 25% # allow an extra 1/4 of pods to replace
  ...
```

## Build & Deploy
```bash
# Build api
$ docker build -t recreate-api:0.1.0 ../api/
$ minikube image load recreate-api:0.1.0

# deploy
$ kubectl apply -f deployment.yaml
```

## Access Content
```bash
# port-forward
$ kubectl port-forward pod/<pod-name> 8080:8080

$ curl http://localhost:8080 
```