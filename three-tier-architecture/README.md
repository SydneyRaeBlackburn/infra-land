# Three-Tier Architecture
Simple three tier architecture application

## Deploy
```bash
$ helm upgrade three-tier-architecture ./deployment/ \
  -f ./deployment/values.yaml 
```

## Access API
```bash
$ kubectl port-forward svc/api-service 8080:80

$ curl http://127.0.0.1:8080/
```