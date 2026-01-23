#!/bin/bash
echo "Running load test..."
for i in {1..100}; do
  curl -s -o /dev/null -w "%{http_code} %{time_total}s\n" http://localhost:8080/ &
done

wait

echo "checking backend distribution:"
curl -s http://localhost:3001 | jq '.requests'
curl -s http://localhost:3002 | jq '.requests'
curl -s http://localhost:3003 | jq '.requests'