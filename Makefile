up:
	docker-compose up -d

build:
	docker-compose up -d --build

stop:
	docker-compose stop

down: 
	docker-compose down

tests:
	docker-compose up -d --build sdk
	docker-compose run sdk dotnet test --logger:trx
