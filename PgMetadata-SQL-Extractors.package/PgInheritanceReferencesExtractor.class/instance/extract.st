action
extract
	self runSQL recordsAsDictionaries 
		do: [ :reference | 
			| child parent |
			"Who is the parent table ?"
			child := self database getTables detect: [ :table | table oid = (reference at: #inhrelid) asInteger ].
			parent := (self database getTables detect: [ :table | table oid = (reference at: #inhparent) asInteger ]).
			child addParent: parent.
		]