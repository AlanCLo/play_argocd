#!/usr/bin/env bash

if [ -d ./helm_output ]; then
    rm -rf ./helm_output
fi

mkdir -p ./helm_output

helm template test-app --output-dir ./helm_output
