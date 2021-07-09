#!/bin/bash

if [[ $GITHUB_REF == refs/tags/* ]]; then
    REF="${GITHUB_REF#refs/*/}";
else \
    REF="${GITHUB_SHA:0:8}";
fi;

echo ::set-output name=${OUTPUTS_TO}::${REF}