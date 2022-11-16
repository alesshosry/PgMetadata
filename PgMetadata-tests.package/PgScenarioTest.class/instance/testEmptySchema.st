tests
testEmptySchema

	| schema |
	db extractObjects.
	schema := db getSchemas detect: [ :s | s name = schemaName ].
	self assert: (db objects select: [ :object | 
			 object isSqlObjectInNamespace and: [ object namespace = schema ] ])
			isEmpty