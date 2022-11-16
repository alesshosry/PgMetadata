tests
testGetFunctions

	| functions |
	functions := db getFunctions.
	self assert: functions size equals: 1.
	self assert: (functions includes: func)