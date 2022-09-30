action
extract
	self runSQL recordsAsDictionaries  do: [ :schema | 
		self database addObject: (SqlNamespace oid: (schema at: #oid) name: (schema at: #nspname) owner: self database) 
	].