CIRCLE_BUILD_NUM=local
CIRCLE_BRANCH=local

.PHONY: test deps bash

default: test

compose: #: Bring up the app with all dependencies and run in the background
	docker-compose up -d

start: #: Bring the app and its dependencies up
	docker-compose start

stop: #: Bring down the app and all dependencies
	docker-compose stop

kill: #: Kill the running containers and all their data
	docker-compose down --volumnes

test: #: Run rails and react tests
	#docker-compose run web rake test This seems to be missing deps, not sure why
	docker-compose run --rm --workdir="/usr/src/quantum/client" web npm test

deps: #: Install the deps
	docker-compose run --rm web mix deps.get

seeds: #: Seed the db
	docker-compose exec -T web mix run priv/repo/seeds.exs

bash: #: Get a bash prompt on a running container
	docker-compose exec web bash

help: #: Show help topics
	@grep "#:" Makefile | sed "s/:.*#//g" | grep -v "@grep" | sort
