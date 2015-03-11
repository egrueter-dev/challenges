CREATE TABLE clients (
  id serial PRIMARY KEY,
  name varchar(300) NOT NULL UNIQUE,
  project varchar(300) NOT NULL UNIQUE
);

CREATE TABLE users (
  id serial PRIMARY KEY
);

CREATE TABLE retainers (
  id serial PRIMARY KEY,
  amount varchar(300) NOT NULL,
  DateInserted date,
  user_id integer REFERENCES users(id),
  client_id varchar(300) REFERENCES clients(id)
);
