action
extractArgumentsTypesFrom: func
	^ ((func at: #proallargtypes) 
		ifNil: [ ((func at: #proargtypes) substrings: ' ') ]
		ifNotNil: [ ((func at: #proallargtypes) allButFirst allButLast
			substrings:',' ) ]) collect: [ :oid | self getAllDatatypes detect: [ :d | d oid = oid asInteger  ] ]