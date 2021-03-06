up:
	docker-compose up -d

build:
	docker-compose up -d --build

stop:
	docker-compose stop

down: 
	docker-compose down

ci-deploy:
	gcloud container clusters get-credentials ${CI_K8S_CLUSTER}
	kubectl config current-context
	helm upgrade --install user-access ./charts/apollo-user-access/ \
		--create-namespace --namespace=user-access \
 		--set api.deployment.container.image.tag="${CIRCLE_WORKFLOW_ID}-${CIRCLE_SHA1}" \
 		--debug

ci-tests: ci-run-tests ci-cleanup

ci-cleanup:
	docker-compose -f docker-compose.ci.yml down --remove-orphans

ci-run-tests:
	docker-compose -f docker-compose.ci.yml run sdk dotnet test --logger:trx
