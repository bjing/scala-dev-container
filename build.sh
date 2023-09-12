#!/bin/bash

source scripts/install_scala.env

docker build --build-arg $SCALA_VERSION -t scala-dev-container:latest .
