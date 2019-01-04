| socket stream message |
socket := Socket newIPC connectTo: (NetNameResolver addressForSocketPath: '/tmp/echo-test').
(Delay forMilliseconds: 10) wait.
stream := SocketStream on: socket.
message := 'Hello, from Smalltalk!'.
stream nextPutAll: message; flush.
Transcript show: (stream next: message size); cr.
stream close.
