# Dockerfile to create a Netcat container.
#
# The `netcat` (or `nc`) is a very versatile network security tool.
# In this case, this `netcat` container will open 2 ports suitable to listen TCP/UDP traffic.
# For further information about `netcat`, check out this page: [http://nc110.sourceforge.net](http://nc110.sourceforge.net)
#
# Usage:
#
#   Previous steps:
#     1) $ git clone https://github.com/chilcano/docker-netcat.git
#     2) $ cd docker-netcat
#
#     $ docker build --rm -t chilcano/netcat:wily wily/.
#     $ docker run -d -t --name=netcat-wily -p 8182:8182 -p 9192:9192/udp chilcano/netcat:wily
#	  $ docker exec -ti netcat-wily bash
#	  root@6749cf8a7bf8:/# nc -vvl -p 8182		// to listen TCP traffic
#	  root@6749cf8a7bf8:/# nc -vvul -p 9192		// to listen UDP traffic
#
#	  or
#
#	  $ docker run -ti --rm -p 8182:8182 chilcano/netcat:wily -vvl -p 8182		// starts container and runs netcat listening on a TCP port
#	  $ docker run -ti --rm -p 9192:9192/udp chilcano/netcat:wily -vvul -p 9192	// starts container and runs netcat listening on an UDP port
#
#	Samples how to send traces to `netcat` listening on TCP/UDP port:
#	  $ nc -vuz -w 3 192.168.99.100 9192		// checking if netcat is listening on 9192 UDP port
#     Connection to 192.168.99.100 9192 port [udp/*] succeeded!
#
#	  $ ping 8.8.4.4 | nc -v 192.168.99.100 8182		// send traces to open a TCP port
#     $ ping 8.8.8.8 | nc -vu 192.168.99.100 9192		// send traces to an UDP port
#     $ ping 8.8.4.4 > /dev/udp/192.168.99.100/9192		// send traces to an UDP port without netcat
#     $ tail -f /opt/wiremock/wiremock.log | nc -vu 192.168.99.100 9192
#	  $ tail -f /opt/wso2esb01a/repository/logs/wso2carbon.log > /dev/tcp/192.168.99.100/8182	// to TCP without netcat
#	  $ tail -f /opt/wso2am02a/repository/logs/wso2carbon.log > /dev/udp/192.168.99.100/9192	// to UDP without netcat
#

FROM ubuntu:wily

MAINTAINER Roger CARHUATOCTO <chilcano at intix dot info>

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends netcat
RUN apt-get clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/*
# Allocate the 8182 and 9192 port to listen for TCP and UDP traffic
EXPOSE 8182 9192
COPY ep_nc.sh /
RUN chmod a+x /ep_nc.sh
ENTRYPOINT ["/ep_nc.sh"]