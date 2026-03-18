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
$ kubectl port-forward svc/istio-ingressgateway -n istio-system 8080:80 --address=0.0.0.0

$ curl http://localhost:8080/
```

# Uninstall
```sh
$ helm uninstall test-app
```