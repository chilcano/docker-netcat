# Dockerfile to create a Netcat container.

FROM debian:jessie

MAINTAINER Roger CARHUATOCTO <chilcano at intix dot info>

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends netcat
RUN apt-get clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/*
# Allocate the 8182 and 9192 port to listen for TCP and UDP traffic
EXPOSE 8182 9192
COPY ep_nc.sh /
RUN chmod a+x /ep_nc.sh
ENTRYPOINT ["/ep_nc.sh"]
