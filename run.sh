#!/bin/sh

set -e
# Sleep to let the db server come up
sleep 5
mix ecto.create
mix ecto.migrate
#mix run priv/repo/seeds.exs
#cd assets && npm install && node node_modules/brunch/bin/brunch build && cd ../
mix phx.server
