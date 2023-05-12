#!/usr/bin/env bash

set -e

function _create_topic() {
	local topic=$1
	kafka-topics --create --if-not-exists \
		--bootstrap-server ${KAFKA_REST_BOOTSTRAP_SERVERS} \
		--replication-factor 1 \
		--partitions 10 \
		--topic $topic \
		--config "confluent.value.schema.validation=true"
}


_create_topic $DEPARTMENT_TOPIC
_create_topic $COURSE_TOPIC
_create_topic $STUDENT_TOPIC

cowsay "Done creating topics, listing all topics"

kafka-topics --list \
	--bootstrap-server ${KAFKA_REST_BOOTSTRAP_SERVERS} \
