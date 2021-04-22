#!/bin/sh

ipfs daemon --init &
ipfs-cluster-follow default run --init cluster.zehy.net &
