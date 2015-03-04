
CREATE TABLE recipes (

recipeid serial PRIMARY KEY,
recipe varchar(255)
);

CREATE TABLE comments (

comments varchar(255),
recipeid integer REFERENCES recipes(recipeid)
);
