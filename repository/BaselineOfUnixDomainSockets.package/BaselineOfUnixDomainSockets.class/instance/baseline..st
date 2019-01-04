baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'UnixDomainSockets-Tests' with: [ spec requires: 'UnixDomainSockets' ];
				package: 'UnixDomainSockets'.
			spec group: 'default' with: #('UnixDomainSockets').
			spec group: 'tests' with: #('UnixDomainSockets-Tests') ]