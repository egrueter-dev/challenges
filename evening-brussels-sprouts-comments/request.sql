
-- SELECT * FROM comments;
-- SELECT * FROM recipes;
--
-- SELECT recipeid, COUNT(*)
-- FROM comments
-- GROUP BY recipeid;
--
-- SELECT recipes.recipe, comments.comments
-- FROM recipes
-- INNER JOIN comments
-- ON comments.recipeid = recipes.recipeid;

--
-- SELECT recipeid, COUNT(*)
-- FROM comments
-- GROUP BY recipeid;

SELECT recipes.recipe, count(*)
FROM recipes
INNER JOIN comments
ON comments.recipeid = recipes.recipeid
GROUP BY recipes.recipeid;
