baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec package: 'UnixDomainSockets'.
			spec
				group: 'default'
				with: #('UnixDomainSockets') ]