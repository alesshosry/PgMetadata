tests
testGetConnectionString

	| connection str |
	connection := PgConnection
		              hostname: 'localhost'
		              port: 5432
		              database: 'db'
		              user: 'john'
		              password: 'doe'.
	str := connection getConnectionString.
	self
		assert: str
		equals: 'postgresV2://localhost:5432/db?user=john&password=doe'