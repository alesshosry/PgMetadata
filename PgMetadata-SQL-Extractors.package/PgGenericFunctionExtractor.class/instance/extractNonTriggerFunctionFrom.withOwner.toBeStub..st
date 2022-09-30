action
extractNonTriggerFunctionFrom: func withOwner: owner toBeStub: isStub
	| argtypes function argnames |
	function := (func at: #prokind) = 'a'
		ifTrue: [ SqlAggregateFunction
				oid: (func at: #oid)
				name: (func at: #proname)
				owner: owner
				stub: isStub ]
		ifFalse: [ SqlFunction
				oid: (func at: #oid)
				name: (func at: #proname)
				owner: owner
				stub: isStub ].
	argnames := func at: #proargnames.
	"Arguments and types are only extracted if function is not stub"
	(isStub not and: [ argnames isNotNil ])
		ifTrue: [ argtypes := self extractArgumentsTypesFrom: func.
			argnames
				with: argtypes
				do: [ :argname :argtype | 
					function
						addArgument: (SqlArgument name: argname datatype: argtype owner: function) ] ].
	^ function