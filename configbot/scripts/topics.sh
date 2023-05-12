#!/usr/bin/env bash

set -e

kafka-topics --create --if-not-exists \
	--bootstrap-server ${KAFKA_REST_BOOTSTRAP_SERVERS} \
	--replication-factor 1 \
	--partitions 10 \
	--topic mytopic \
	--config "confluent.value.schema.validation=true"

cowsay "Done creating topics, listing all topics"

kafka-topics --list \
	--bootstrap-server ${KAFKA_REST_BOOTSTRAP_SERVERS} \