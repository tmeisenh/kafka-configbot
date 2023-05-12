#!/usr/bin/env bash

cowsay "Waiting for the things"
## add a sleep on the end to break out of this
cub kafka-ready -b $KAFKA_REST_BOOTSTRAP_SERVERS 1 40  && cub sr-ready $KAFKA_REST_SCHEMA_REGISTRY_HOST $KAFKA_REST_SCHEMA_REGISTRY_PORT 40  && sleep 10

cowsay "Everything is up!"