# PgMetadata
Extracts the PostgreSQL metadata and build an SQL Model (In progress).

##  Pharo 10 and Moose 10 notes

In Pharo 10 [Garage](https://github.com/pharo-rdbms/garage) is not working anymore as it relies on the Text conversion classes which had removed from the image.
The Garage itself has last commit on Sep 27, 2018.
This version is forked from deemOn's version and includes the below changes:
1.	Ability to connect to Postgres 12+
2.	Some methods were still dependent of Garage, so I fully replaced it by [P3](https://github.com/alesshosry/P3)

## How to install

### Pharo 10 and above + Postgres 12 and above

```
Metacello new
    baseline: 'PgMetadata';
    repository: 'github://alesshosry/PgMetadata:development';
    load
```

### Pharo 10 and above + Postgres 11 and less

```
Metacello new
    baseline: 'PgMetadata';
    repository: 'github://deemOn/PgMetadata:development';
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
