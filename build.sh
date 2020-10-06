#!/usr/bin/env bash

./run-local-env.sh

./check-env.sh

./gradlew clean build

./remove-env.sh
