VERSION := $(shell uuidgen | cut -c1-8)
PROFILE := release-orchestration

build:
	docker build -t test-app:$(VERSION) ./test-app/api && \
	minikube image load test-app:$(VERSION) --profile=$(PROFILE)

install:
	docker build -t test-app:$(VERSION) ./test-app/api && \
	minikube image load test-app:$(VERSION) --profile=$(PROFILE) && \
	helm install test-app ./test-app/deployment/ \
  	-f ./test-app/deployment/values.yaml  \
		--set image.tag=$(VERSION) \

template:
	helm template test-app ./test-app/deployment/ \
  	-f ./test-app/deployment/values.yaml \
		--set image.tag=$(VERSION) \

deploy:
	docker build -t test-app:$(VERSION) ./test-app/api && \
	minikube image load test-app:$(VERSION) --profile=$(PROFILE) && \
	helm upgrade test-app ./test-app/deployment/ \
  	-f ./test-app/deployment/values.yaml \
		--set image.tag=$(VERSION) \
		--force-conflicts

uninstall:
	helm uninstall test-app