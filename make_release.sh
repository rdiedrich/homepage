#!/bin/sh
set -e

export SECRET_KEY_BASE=$(mix phx.gen.secret)
export DATABASE_URL=ecto://postgres:postgres@localhost/homepage_dev

mix deps.get --only prod
MIX_ENV=prod mix assets.deploy
MIX_ENV=prod mix compile
mix phx.gen.release

MIX_ENV=prod mix release
