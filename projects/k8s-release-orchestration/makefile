VERSION := $(shell cat ./test-app/VERSION)
PROFILE := release-orchestration

build:
	docker build -t test-app:$(VERSION) ./test-app/api && \
	minikube image load test-app:$(VERSION) --profile=$(PROFILE)

install:
	helm install test-app ./test-app/deployment/ \
  	-f ./test-app/deployment/values.yaml 

template:
	helm template test-app ./test-app/deployment/ \
  	-f ./test-app/deployment/values.yaml

deploy:
	helm upgrade test-app ./test-app/deployment/ \
  	-f ./test-app/deployment/values.yaml \
		--set image.tag=$(VERSION) \
		--force-conflicts

uninstall:
	helm uninstall test-app