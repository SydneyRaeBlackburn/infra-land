# Three-Tier Architecture: API

| Method | Endpoint | Description |
|:--|:--|:--|
GET | `/` | Returns welcome message
GET | `/foods/` | Returns a list of foods

## Build
```bash
# build image
$ docker build -t three-tier-api .

# load into minikube
$ minikube image load three-tier-api:latest
```