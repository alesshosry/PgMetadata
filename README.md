# PgMetadata
Extracts the PostgreSQL metadata and build an SQL Model (In progress).

##  Pharo 10 and Moose 10 notes

In Pharo 10 [Garage](https://github.com/pharo-rdbms/garage) is not working anymore as it relies on the Text conversion classes which had removed from the image.
The Garage itself has last commit on Sep 27, 2018.
So I decided to switch to the P3 library, which is active and healthy project in 2022.
All work is done in the development branch and will be released with v10.0.0 tag when ready.

## How to install

### Pharo 10

```
Metacello new
    baseline: 'PgMetadata';
    repository: 'github://deem0n/PgMetadata:development';
    load
```

### Old Pharo releases

```
Metacello new
    baseline: 'PgMetadata';
    repository: 'github://olivierauverlot/PgMetadata';
    load
```

## How to use PgMetadata

The class PgMetadata returns an instance of PgDatabase that describes the SQL schema. 

    | metadata sqlObjects |
    metadata := PgMetadata database: 'mydb' connection: (
	PgConnection
		hostname: 'localhost'
		port: 5432
		database: 'dbname'
		user: 'username'
		password: 'password'
    ).
    pgDB := metadata extractMetadata.
    sqlObjects := pgDB objects
