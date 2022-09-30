action
extract
	self database getColumnContainers do: [ :table |
		(self runSQLWith: { table oid }) recordsAsDictionaries  do: [ :result | 
			| column dt |
			column := SqlColumn oid: nil name: (result at: #attname) owner: table.
			column num: (result at: 'attnum') asInteger.
			column length: (result at: 'attlen') asInteger.
			column dimensions: (result at: 'attndims') asInteger.
			column isNotNull: (result at: 'attnotnull').
			column hasDefaultValue: (result at: 'atthasdef').

			dt := SqlDatatype oid: (result at: 'type_oid') name: (result at: 'typname')  owner: (self database).
						
			column datatype: (self database addUniqueObject: dt).
			self database addObject: column. 
			table addColumn: column.
		]
	]