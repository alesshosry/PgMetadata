action
extractStubFunctions: isStub 
	self runSQL recordsAsDictionaries 
		do: [ :func | 
			| function resultType language namespace owner |
			owner := isStub ifTrue: [ nil ] ifFalse: [ self database ].
			function := (func at: #prorettypename) = 'trigger'
				ifTrue: [ SqlTriggerFunction oid: (func at: #oid) name: (func at: #proname) owner: owner stub: isStub ]
				ifFalse: [ self extractNonTriggerFunctionFrom: func withOwner: owner toBeStub: isStub ].
			function code: (func at: 'prosrc').
			language := SqlLanguage
				oid: (func at: #prolang)
				name: (func at: #prolangname)
				owner: owner.
			function language: (self addUniqueObject: language).
			namespace := SqlNamespace
				oid: (func at: #pronamespace)
				name: (func at: #pronamespacename)
				owner: owner.
			function namespace: (self addUniqueObject: namespace).
			resultType := SqlDatatype
				oid: (func at: #prorettype)
				name: ((func at: #proretset) ifTrue: [ 'setof ' ] ifFalse: [ '' ]) , (func at: #prorettypename)
				owner: owner.
			function returnType: (self addUniqueObject: resultType).
			self addUniqueObject: function ]