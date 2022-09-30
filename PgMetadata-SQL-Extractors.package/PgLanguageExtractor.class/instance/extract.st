action
extract
	self runSQL recordsAsDictionaries  do: [ :language | 
		self database addObject: (SqlLanguage oid: (language at: #oid) name: (language at: #lanname) owner: self database) 
	]