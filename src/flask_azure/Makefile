
docker_app := rosso-python

docker_tag := rosso-python

# docker_version := v1.0.4
docker_version := v1.0.0-build$(shell date +%s)

runner := nerdctl

.PHONY: help
help: ## help
	@grep -h "##" $(MAKEFILE_LIST) | grep -v grep

run: ## run
	@flask run --port 8080 --host 0.0.0.0 --debug

debug: ## debug
	@echo docker_app: $(docker_app)
	@echo docker_version: $(docker_version)
	@sleep 2
	@echo docker_version: $(docker_version)

k8s-run: ## k8s run
	# @$(runner) --namespace k8s.io rmi $(docker_tag):$(docker_version)
	@$(runner) --namespace k8s.io build -t $(docker_tag):$(docker_version) .
	@$(runner) --namespace k8s.io images
	@ansible-playbook deploy.yml \
		-e DOCKER_TAG="$(docker_tag)" \
		-e DOCKER_VERSION="$(docker_version)" \
		-e DOCKER_APP="$(docker_app)"
	# nerdctl run --namespace k8s.io -p 8080:8080 rosso-python:169260237

docker-build: ## docker-build
	@docker build --tag $(docker_app) .

docker-run: docker-build ## docker-run
	@docker run --detach --publish 8080:8080 --name flask $(docker_app)
	#@docker run -it --rm -p 8080:8080 --name $(docker_tag) $(docker_tag):$(docker_version)
