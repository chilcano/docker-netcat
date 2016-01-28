# Dockerfile to create a Netcat container.

The `netcat` (or `nc`) is a very versatile network security tool.
In this case, this `netcat` container will open 2 ports suitable to listen TCP/UDP traffic.
For further information about `netcat`, check out this page: [http://nc110.sourceforge.net](http://nc110.sourceforge.net)

## Usage

__1) Previous steps__

```bash
$ git clone https://github.com/chilcano/docker-netcat.git
$ cd docker-netcat
```
__2) Building and running the `netcat` Docker container__

```bash
$ docker build --rm -t chilcano/netcat:jessie jessie/.

$ docker run -d -t --name=netcat-jessie -p 8182:8182 -p 9192:9192/udp chilcano/netcat:jessie

$ docker exec -ti netcat-jessie bash

// to listen TCP traffic
root@6749cf8a7bf8:/# nc -vvl -p 8182

// to listen UDP traffic
root@6749cf8a7bf8:/# nc -vvul -p 9192
```

or

```bash
// starts container and runs netcat listening on a TCP port
$ docker run -ti --rm -p 8182:8182 chilcano/netcat:jessie -vvl -p 8182

// starts container and runs netcat listening on an UDP port
$ docker run -ti --rm -p 9192:9192/udp chilcano/netcat:jessie -vvul -p 9192
```

__3) Sending traces to the `netcat` Docker container__

```bash
// checking if `netcat` is listening on 9192 UDP port
$ nc -vuz -w 3 192.168.99.100 9192		
Connection to 192.168.99.100 9192 port [udp/*] succeeded!
```

More examples:

```bash
// send traces to open a TCP port
$ ping 8.8.4.4 | nc -v 192.168.99.100 8182

// send traces to an UDP port
$ ping 8.8.8.8 | nc -vu 192.168.99.100 9192

// send traces to an UDP port without netcat
$ ping 8.8.4.4 > /dev/udp/192.168.99.100/9192

$ tail -f /opt/wiremock/wiremock.log | nc -vu 192.168.99.100 9192

// send traces to a TCP port without `netcat`
$ tail -f /opt/wso2esb01a/repository/logs/wso2carbon.log > /dev/tcp/192.168.99.100/8182

// send traces to an UDP port without `netcat`
$ tail -f /opt/wso2am02a/repository/logs/wso2carbon.log > /dev/udp/192.168.99.100/9192
```

