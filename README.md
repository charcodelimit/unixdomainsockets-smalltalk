# Unix Domain Sockets for Smalltalk

Adds support for Unix domain sockets to [Pharo](http://pharo.org) 
and [Squeak](http://www.squeak.org) Smalltalk.

## Requires

* [Squeak](http://www.squeak.org) 5.1,5.2a
* [Pharo](http://pharo.org/) 6.1,7.0

## Installing

To install the latest version execute the following:

```Smalltalk
Metacello new
  baseline: 'UnixDomainSockets';
  repository: 'github://charcodelimit/unixdomainsockets-smalltalk/repository';
  load.
```

## How to use

The original implementation is described in the following two blog posts from
Pierce Ng:

* [Unix Domain Sockets on Pharo](https://www.samadhiweb.com/blog/2013.07.27.unixdomainsockets.html)
* [GOODS OODB on Unix Domain Sockets](https://www.samadhiweb.com/blog/2013.07.28.goods.oodb.html)

The following example closely follows the one described in the blog, and is available
in the implemenation as integration test as well.

First run the following echo server [script](tests/uds-echo.py) written in Python:

```Python
import socket,os
sp = "/tmp/echo-test"
s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
try:
    os.remove(sp)
except OSError:
    pass
s.bind(sp)
s.listen(1)
conn, addr = s.accept()
while 1:
    data = conn.recv(1024)
    if not data: break
    print data
    conn.send(data)
conn.close()
```

Then connect to it from within Smalltalk:

```Smalltalk
| socket stream message |
socket := Socket newIPC connectTo: (NetNameResolver addressForSocketPath: '/tmp/echo-test').
(Delay forMilliseconds: 10) wait.
stream := SocketStream on: socket.
message := 'Hello, from Smalltalk!'.
stream nextPutAll: message; flush.
Transcript show: (stream next: message size); cr.
stream close.
```

## License

Unix Domain Sockets for Pharo Smalltalk is licensed under the [MIT License](https://opensource.org/licenses/MIT).
