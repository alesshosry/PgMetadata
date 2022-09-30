action
extract
	self runSQL recordsAsDictionaries do: [ :item |
		| trigger |
		trigger := (SqlTrigger oid: (item at: #oid) name: (item at: #triggername) owner: self database).
		"trigger table: ((self database getTables) detect: [ :t | t oid = (item atName: #table_oid) asInteger ])."
		"trigger actually may be assigned to view!"
		trigger table: (self database getObjectWithOID: (item at: #table_oid) asInteger).
		trigger function: ((self database getTriggerFunctions) detect: [ :f | f oid = (item at: #function_oid) asInteger ]).
		
		(trigger table) ifNotNil: [ trigger addReferencedObject: trigger table ].
		(trigger function) ifNotNil: [ trigger addReferencedObject: trigger function ].
		trigger type: (item at: #tgtype) asInteger.
		self database addObject: trigger.
	]
