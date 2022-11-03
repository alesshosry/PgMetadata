tests
testGetColumns

	| columns |
	columns := db getColumns.
	self assert: columns size equals: 3.
	self assert: (columns includes: colname).
	self assert: (columns includes: colsurname).
	self assert: (columns includes: colage)