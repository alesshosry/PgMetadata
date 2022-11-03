running
setUp

	"User must make sure PostgreSQL is running!"
	"Create a new schema for test scenarios, which will be dropped in tearDown."

	super setUp.
	db := PgDatabase name: 'db' connection: (PgConnection
			       hostname: 'localhost'
			       port: 5432
			       database: 'postgres'
			       user: 'postgres'
			       password: 'postgres').
	db connect.
	schemaName := self uniqueSchemaName.
	client := db connection.
	client execute: 'CREATE SCHEMA ' , schemaName