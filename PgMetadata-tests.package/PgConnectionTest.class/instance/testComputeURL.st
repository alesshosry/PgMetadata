tests
testComputeURL

	| connection url |
	connection := PgConnection
		              hostname: 'localhost'
		              port: 5432
		              database: 'db'
		              user: 'john'
		              password: 'doe'.
	url := connection computeURL.
	self assert: url equals: 'psql://john:doe@localhost:5432/db'