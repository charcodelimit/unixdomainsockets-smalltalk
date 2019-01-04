*UnixDomainSockets
addressForSocketPath: aSocketPathString
	| size socketAddress |
	self initializeNetwork.
	self
		primGetAddressInfoHost: ''
		service: aSocketPathString
		flags: 0
		family: 1
		type: 0
		protocol: 0.
	size := self primGetAddressInfoSize.
	socketAddress := SocketAddress new: size withAll: 0.
	self primGetAddressInfoResult: socketAddress.
	^ socketAddress