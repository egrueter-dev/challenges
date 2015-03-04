# YOUR SQL CODE GOES HERE

-- For which collars can we identify an owner?

# Produces owners & collar id for dogs that can be found.

SELECT dog_owners.name AS owner, lost_dog_collars.id
FROM dog_owners
JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name);

-- For which collars is there no known owner?

SELECT lost_dog_collars.id, lost_dog_collars.dog_name
FROM lost_dog_collars
LEFT JOIN dog_owners
ON lost_dog_collars.dog_name = dog_owners.dog_name;
WHERE dog_owners.dog_name IS NULL;

-- We need to see all collars, with an owner, if one matches.

SELECT lost_dog_collars.dog_name, dog_owners.name
FROM dog_owners
RIGHT JOIN lost_dog_collars
ON lost_dog_collars.dog_name = dog_owners.dog_name;

-- We need to see all owners, with collars in the Lost and Found, if one matches.

SELECT dog_owners.name, lost_dog_collars.id
FROM lost_dog_collars
RIGHT JOIN dog_owners
ON lost_dog_collars.dog_name = dog_owners.dog_name;
