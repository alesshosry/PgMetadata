tests
testGetDatatypes

	| datatypes |
	datatypes := db getDatatypes.
	self assert: datatypes size equals: 2.
	self assert: (datatypes includes: dt1).
	self assert: (datatypes includes: dt2)