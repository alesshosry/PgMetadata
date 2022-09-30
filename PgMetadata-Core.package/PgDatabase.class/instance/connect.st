connection
connect
	connection := (P3Client new url: (parameters computeURL)).
	connection connect.
	self postgresql: (PgPostgresql about: self).
	self extractObjects