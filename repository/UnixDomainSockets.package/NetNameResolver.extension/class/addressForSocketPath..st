*UnixDomainSockets
addressForSocketPath: aSocketPathString
	| size socketAddress |
	self initializeNetwork.
	self class
		primGetAddressInfoHost: ''
		service: aSocketPathString
		flags: 0
		family: 1
		type: 0
		protocol: 0.
	size := self class primGetAddressInfoSize.
	socketAddress := SocketAddress new: size withAll: 0.
	self class primGetAddressInfoResult: socketAddress.
	^ socketAddress