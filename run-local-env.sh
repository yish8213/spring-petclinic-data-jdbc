#!/usr/bin/env bash

# Clean up
./remove-env.sh

# Run
docker-compose -f docker-compose.yml up -d
