#!/bin/bash

source config

docker build -t ${RPXC_IMAGE} .
