#!/bin/bash

docker build --build-arg ARCH=amd64 --no-cache -t zehy/cluster:amd64 .
docker build --build-arg ARCH=arm64 --no-cache -t zehy/cluster:arm64 .
docker build --build-arg ARCH=arm --no-cache -t zehy/cluster:arm .
docker build --build-arg ARCH=386 --no-cache -t zehy/cluster:386 .