-- If you want to run this schema repeatedly you'll need to drop
-- the table before re-creating it. Note that you'll lose any
-- data if you drop and add a table:

-- DROP TABLE IF EXISTS articles;

CREATE TABLE users (
	user_id serial PRIMARY KEY,
	email varchar (300) NOT NULL UNIQUE,
	password varchar (300) NOT NULL UNIQUE
);

CREATE TABLE urls (
	url_id serial PRIMARY KEY,
	long varchar(300) NOT NULL UNIQUE,
	short varchar(300) NOT NULL UNIQUE
	user_id integer REFERENCES urls(url_id)
);
