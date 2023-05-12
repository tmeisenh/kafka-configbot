#!/usr/bin/env bash

set -e

env

/usr/local/app/bin/wait.sh
/usr/local/app/bin/topics.sh

cowsay -f dragon "Everything is up"

while true; do
	echo "Press [CTRL+C] to stop.."
	sleep 1
done
