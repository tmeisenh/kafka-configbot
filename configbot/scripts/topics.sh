#!/usr/bin/env bash

set -e

/usr/local/app/sample/sample_topic.sh

cowsay "Done creating topics, listing all topics"
kafka-topics --list \
	--bootstrap-server ${KAFKA_REST_BOOTSTRAP_SERVERS}

cowsay "Listing all schemas"
curl http://schema-registry:8081/subjects --silent | jq
