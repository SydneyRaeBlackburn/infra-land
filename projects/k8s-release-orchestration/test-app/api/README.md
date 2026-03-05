# test-app: API

| Method | Endpoint | Description |
|:--|:--|:--|
GET | `/` | Returns welcome message
## Build
```bash
# build image
$ docker build -t test-app .

# load into minikube
$ minikube image load test-app:latest
```