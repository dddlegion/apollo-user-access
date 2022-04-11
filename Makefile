up:
	docker-compose up -d

build:
	docker-compose up -d --build

stop:
	docker-compose stop

down: 
	docker-compose down

ci-tests: ci-run-tests ci-cleanup

ci-cleanup:
	docker-compose -f docker-compose.ci.yml down --remove-orphans

ci-run-tests:
	docker-compose -f docker-compose.ci.yml run sdk dotnet test --logger:trx
