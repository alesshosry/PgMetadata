action
extract
	self runSQL recordsAsDictionaries  do: [ :extension | 
		self database addObject: (SqlExtension oid: (extension at: #oid) name: (extension at: #extname) owner: self database) 
	].