action
extract
	self database getSchemas do: [ :namespace |
		(self runSQLWith: { namespace name }) recordsAsDictionaries  do: [ :result |
			| constrainedTable referencedTable |
			constrainedTable := self database getObjectWithOID:(result at: #dependent_table_oid) asNumber.
			constrainedTable ifNotNil: [  
				referencedTable := self database getObjectWithOID: (result at: #source_table_oid) asNumber.
				referencedTable ifNotNil: [ 
					((result at: #column_idx) > 0) ifTrue: [  
					constrainedTable addReferencedObject: (referencedTable columnAt: (result at: #column_idx)).
					]
				]
			]
		]
	]
	 
