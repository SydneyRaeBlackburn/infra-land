# test-app
Simple versioned HTTP service

## Deploy
```bash
# run if not already installed
$ helm install test-app ./test-app/deployment/ \
  -f ./deployment/values.yaml 

# otherwise, deploy
$ helm upgrade test-app ./test-app/deployment/ \
  -f ./deployment/values.yaml 
```

## Access API
```bash
$ kubectl port-forward svc/test-app-<stable/canary> 8080:80

$ curl http://127.0.0.1:8080/
```

# Uninstall
```sh
$ helm uninstall test-app
```