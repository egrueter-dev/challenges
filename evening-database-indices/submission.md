
##Find all rows that have an ingredient name of Brussels sprouts.

SELECT * from ingredients WHERE name ILIKE '%Brussels Sprouts%';

##Calculate the total count of rows of ingredients with a name of Brussels sprouts.

EXPLAIN ANALYZE SELECT count(*) from ingredients WHERE name ILIKE '%Brussels Sprouts';

##Find all Brussels sprouts ingredients having a unit type of gallon(s).

SELECT ingredients.name FROM ingredients WHERE unit='gallon(s)';

##Find all rows that have a unit type of gallon(s), a name of Brussels sprouts or has the letter j in it.

EXPLAIN ANALYZE SELECT count(*) FROM ingredients WHERE ingredients.unit='gallon(s)'; AND (ingredients.name ILIKE '%j%' OR ingredients.name ILIKE 'Brussels Sprouts');

#Created index

CREATE INDEX PIndex ON ingredients (name);

Screenshots:

Before:

![alt](http://i.imgur.com/8GEm0O7.png)

After:

![alt](http://i.imgur.com/mdqvw4J.png)
