tests
testEcho
	| socket stream message |
	socket := Socket newIPC
		connectTo: (NetNameResolver addressForSocketPath: '/tmp/echo-test').
	(Delay forMilliseconds: 10) wait.
	stream := SocketStream on: socket.
	self assert: stream isConnected.
	message := 'Hello, from Smalltalk!'.
	stream nextPutAll: message; flush.
	(Delay forMilliseconds: 10) wait.
	self assert: stream isDataAvailable.
	self assert: (stream next: message size) equals: message.
	stream close