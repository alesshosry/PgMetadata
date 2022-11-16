tests
uniqueSchemaName

	"Return a unique name for a schema."

	| name ind |
	ind := 0.
	name := 'test_schema_' , ind asString.
	db getSchemas ifNotEmpty: [ :schemas | 
		[ schemas detect: [ :schema | schema name = name ] ifNone: nil ] 
			whileNotNil: [ 
				ind := ind + 1.
				name := (name first: 12) , ind asString ] ].
	^ name