# Three-Tier Architecture: API

| Method | Endpoint | Description |
|:--|:--|:--|
GET | `/` | Returns welcome message
GET | `/foods/` | Returns a list of foods

## Build & Deploy
```bash
$ docker build -t three-tier-api .

$ kubectl apply -f templates/
```

## Access API
```bash
$ kubectl port-forward svc/api-service 8080:80

$ curl http://127.0.0.1:8080/
```