tests
testFunction

	| schema functions |
	client execute: ('
CREATE FUNCTION {1}.noop() RETURNS void RETURN null;
CREATE FUNCTION {1}.one_arg(arg int) RETURNS void RETURN null;
CREATE FUNCTION {1}.multi_args(arg1 text, arg2 decimal, arg3 money, arg4 bool) RETURNS void RETURN null;
CREATE FUNCTION {1}.simple_return() RETURNS int RETURN 0;
CREATE FUNCTION {1}.out_arg(OUT arg float) RETURN 0;
CREATE FUNCTION {1}.inout_arg(INOUT arg varchar) RETURN arg;
CREATE FUNCTION {1}.record_return(OUT arg1 date, OUT arg2 time) RETURN null::record;
CREATE FUNCTION {1}.table_return() RETURNS TABLE (name varchar, surname varchar, age int) RETURN null::setof record;
CREATE FUNCTION {1}.complex(IN arg1 char, INOUT arg2 date, VARIADIC arg3 json[], OUT arg4 int) RETURN null::record;
' format: { schemaName }).
	"noms de func, d'args, de return"
	db extractObjects.
	schema := db getSchemas detect: [ :s | s name = schemaName ].
	functions := Dictionary new.
	db getFunctions do: [ :f | 
		f namespace = schema and: [ functions at: f name put: f ] ].
	self
		checkFunction: (functions at: 'noop')
		withArgs: {  }
		withReturnType: 'void'.
	self
		checkFunction: (functions at: 'one_arg')
		withArgs: { ('arg' -> 'int4') }
		withReturnType: 'void'.
	self
		checkFunction: (functions at: 'multi_args')
		withArgs: { 
				('arg1' -> 'text').
				('arg2' -> 'numeric').
				('arg3' -> 'money').
				('arg4' -> 'bool') }
		withReturnType: 'void'.
	self
		checkFunction: (functions at: 'simple_return')
		withArgs: {  }
		withReturnType: 'int4'.
	self
		checkFunction: (functions at: 'out_arg')
		withArgs: { ('arg' -> 'float8') }
		withReturnType: 'float8'.
	self
		checkFunction: (functions at: 'inout_arg')
		withArgs: { ('arg' -> 'varchar') }
		withReturnType: 'varchar'.
	self
		checkFunction: (functions at: 'record_return')
		withArgs: { 
				('arg1' -> 'date').
				('arg2' -> 'time') }
		withReturnType: 'record'.
	self
		checkFunction: (functions at: 'table_return')
		withArgs: { 
				('name' -> 'varchar').
				('surname' -> 'varchar').
				('age' -> 'int4') }
		withReturnType: 'setof record'.
	self
		checkFunction: (functions at: 'complex')
		withArgs: { 
				('arg1' -> 'bpchar').
				('arg2' -> 'date').
				('arg3' -> '_json').
				('arg4' -> 'int4') }
		withReturnType: 'record'