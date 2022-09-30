actions
extract
	self runSQL recordsAsDictionaries 
		do: [ :schema | 
			self database
				addObject:
					(self sqlObjectClass 
						oid: (schema at: #oid)
						name: (schema at: #relname)
						owner: self database
						namespace: (self database schemaReferenceOf: (schema at: #relnamespace))) ]