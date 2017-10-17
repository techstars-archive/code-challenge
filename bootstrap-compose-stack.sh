#!/bin/bash
docker-compose build
docker-compose run web bin/rails db:create
docker-compose run web bin/rails db:migrate
docker-compose run web bin/rails db:seed
docker-compose up -d
