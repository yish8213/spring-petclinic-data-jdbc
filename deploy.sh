#!/usr/bin/env bash

./gradlew bootBuildImage

docker push y1sh/petclinic-test:latest
