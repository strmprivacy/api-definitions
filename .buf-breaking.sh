#!/bin/bash
export LATEST_TAG=$(git tag -l | sort -V | tail -n 1)
if [ ! -z "$LATEST_TAG" ]; then
  echo "running buf breaking against $LATEST_TAG"
  buf breaking --against ".git#tag=$LATEST_TAG"
fi
