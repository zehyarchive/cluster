#!/bin/bash

#docker push -a zehy/cluster

docker manifest create zehy/cluster:latest zehy/cluster:amd64 zehy/cluster:386 zehy/cluster:arm64 zehy/cluster:arm
docker manifest push --purge zehy/cluster:latest