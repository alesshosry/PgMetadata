action
runSQLWith: aParametersList
	^self connection query: (self sqlRequest format: aParametersList)