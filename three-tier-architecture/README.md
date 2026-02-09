# Three-Tier Architecture
Simple three tier architecture application

## Deploy
```bash
# run if not already installed
$ helm install three-tier-architecture ./deployment/ \
  -f ./deployment/values.yaml 

$ helm upgrade three-tier-architecture ./deployment/ \
  -f ./deployment/values.yaml 
```

## Access API
```bash
$ kubectl port-forward svc/api-service 8080:80

$ curl http://127.0.0.1:8080/
```

# Uninstall
```sh
$ helm uninstall three-tier-architecture
```