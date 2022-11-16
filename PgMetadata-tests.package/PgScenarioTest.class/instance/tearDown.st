running
tearDown

	client execute: 'DROP SCHEMA IF EXISTS ' , schemaName , ' CASCADE'.
	db close.
	super tearDown