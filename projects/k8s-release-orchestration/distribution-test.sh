#!/bin/bash
echo "Running distribution test..."
while true; do
  curl http://localhost:8080/ & sleep 1
  echo
done