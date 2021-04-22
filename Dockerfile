ARG ARCH

FROM --platform=${ARCH} alpine:latest

WORKDIR /app

VOLUME /data
ENV IPFS_PATH="/data/ipfs"
ENV IPFS_CLUSTER_PATH="/data/ipfs-cluster"

ARG ARCH

RUN wget -O go-ipfs.tar.gz https://dist.ipfs.io/go-ipfs/v0.8.0/go-ipfs_v0.8.0_linux-$ARCH.tar.gz && \
    tar -xf go-ipfs.tar.gz && \
    rm go-ipfs.tar.gz

RUN wget -O ipfs-cluster-follow.tar.gz https://dist.ipfs.io/ipfs-cluster-follow/v0.13.2/ipfs-cluster-follow_v0.13.2_linux-$ARCH.tar.gz &&  \
    tar -xf ipfs-cluster-follow.tar.gz && \
    rm ipfs-cluster-follow.tar.gz

RUN mv go-ipfs/ipfs /bin/ipfs && mv ipfs-cluster-follow/ipfs-cluster-follow /bin/ipfs-cluster-follow

RUN rm -R go-ipfs && rm -R ipfs-cluster-follow

ADD start.sh .
ADD service.json .

CMD ["/bin/sh", "-c", "./start.sh"]