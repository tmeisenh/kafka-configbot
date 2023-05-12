#!/usr/bin/env bash

set -e

function _register_avro_schema() {
	local avro=$1
	local avroPath="${APP_ROOT}/avro/${avro}.avsc"
	jq '. | {schema: tojson}' ${avroPath} |
	curl -X POST ${KAFKA_REST_SCHEMA_REGISTRY_URL}/subjects/${avro}-value/versions \
	-H "Content-Type: application/json" \
	-d @-
}

cowsay "Registering avro schemas"

_register_avro_schema $DEPARTMENT_TOPIC
_register_avro_schema $COURSE_TOPIC
_register_avro_schema $STUDENT_TOPIC

cowsay "Finished registering avro schemas"