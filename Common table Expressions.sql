
#Common table Expressions
#Common Table Expressions (CTEs) are temporary result sets that are defined within the execution
# scope of a single SQL statement. They provide a way to simplify complex SQL queries, improve 
# readability, and avoid redundancy by allowing you to define a named query block that can be 
# referenced within the main query.
use computer;

select * from sakila.actor;

WITH acting (actor_id,first_name,last_name)
AS
(
    SELECT actor_id,first_name,last_name
    FROM sakila.actor
    UNION ALL
    SELECT category_id, name
    FROM sakila.category
    )
SELECT *
FROM acting;

desc sakila.actor;

# Not using CTE
SELECT actor_id, first_name,last_name FROM sakila.actor;





# Recursive Common Table Expressions


WITH RECURSIVE cte_name (column1, column2)
AS
(
    -- Anchor member: initial query
    SELECT column1, column2
    FROM your_table
    WHERE conditions
    
    UNION ALL
    
    -- Recursive member: subsequent queries referencing the CTE itself
    SELECT column1, column2
    FROM cte_name
    WHERE conditions
)
-- Main query using the recursive CTE
SELECT *
FROM cte_name;


