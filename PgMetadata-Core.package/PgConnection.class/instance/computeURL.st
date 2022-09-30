action
computeURL
	| string |
   "psql://postgres:postgres@postgres:5432/postgres"
	
	string := WriteStream on: String new.
	string 
		nextPutAll: 'psql://';
		nextPutAll: self user;
		nextPutAll: ':';
		nextPutAll: self password;
		nextPutAll: '@';		
		nextPutAll: self hostname;	
		nextPutAll: ':';		
		nextPutAll: (self port asString);
		nextPutAll: '/';
		nextPutAll: self database.
		
	^string contents