#!/bin/sh
set -e

rsync -vau _build/prod/rel/homepage/ servi-eins:/srv/www/homepage/