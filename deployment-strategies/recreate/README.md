# Recreate
Set strategy in `deployment.yaml` to `Recreate`:
```yaml
  ...
  strategy:
    type: Recreate
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