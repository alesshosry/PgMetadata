action
extractMetaInformations
	"extraction of datatypes"
	| dbCon |
	dbCon := (self database connection
		query: 'SELECT oid,typname,typnamespace FROM pg_type') recordsAsDictionaries.
		
		dbCon  
		do: [ :datatype | 
			
			self datatypes
				add:
					(SqlDatatype
						oid: (datatype at: #oid) asInteger
						name: (datatype at: #typname)
						owner: self database) ]. 
	"getting version"
	(self database connection query: 'SHOW server_version') recordsAsDictionaries 
		do: [ :versionString | 
			| versionParts major |			
			versionParts := (versionString at: 'server_version') splitOn: $..
			major := versionParts first asNumber.
			self
				databaseMajorVersion:
					(major > 9
						ifTrue: [ major ]
						ifFalse: [ ('.'
								join:
									{major asString.
									versionParts second}) asNumber ]) ]