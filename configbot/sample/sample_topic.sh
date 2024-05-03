#!/usr/bin/env bash

set -e

# Example on creating a topic, adding its schema, and then pumping it with some data

kafka-topics --create --if-not-exists \
	--bootstrap-server ${KAFKA_REST_BOOTSTRAP_SERVERS} \
	--replication-factor 1 \
	--partitions 10 \
	--topic sample \
	--config "confluent.value.schema.validation=true"

jq '. | {schema: tojson}' /usr/local/app/sample/sample.avsc |
	curl -X POST ${KAFKA_REST_SCHEMA_REGISTRY_URL}/subjects/sample-value/versions \
		-H "Content-Type:application/json" \
		-d @-

kafka-avro-console-producer \
	--bootstrap-server ${KAFKA_REST_BOOTSTRAP_SERVERS} \
	--property schema.registry.url=${KAFKA_REST_SCHEMA_REGISTRY_URL} \
	--topic sample \
	--property value.schema.id=1 \
	--property key.schema='{"type":"string"}' \
	--property parse.key=true \
	--property "key.separator= " \
	--property key.serializer=org.apache.kafka.common.serialization.StringSerializer \
	</usr/local/app/sample/sample.json.txt

cowsay "Done with sample topic!"
