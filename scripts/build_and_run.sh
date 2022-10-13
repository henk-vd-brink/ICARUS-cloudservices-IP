#!/bin/bash

docker-compose -f docker-compose.ci.build.yaml build
docker-compose -f docker-compose.yaml up