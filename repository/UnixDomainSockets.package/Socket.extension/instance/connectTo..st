*UnixDomainSockets
connectTo: socketAddress
	| status |
	
	status := self primSocketConnectionStatus: socketHandle.
	(status = Unconnected)
		ifFalse: [ InvalidSocketStatusException signal: 'Socket status must be Unconnected before opening a new connection.' ].
		
	self primSocket: socketHandle connectTo: socketAddress