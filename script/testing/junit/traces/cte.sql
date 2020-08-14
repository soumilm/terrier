with cte(x) as (select 1) select x FROM cte;
with cte as (select 1) select * FROM cte;
with cte as (select 1 as "x") select * FROM cte;
with cte(y) as (select 1 as "x") select y FROM cte;
WITH cte(x) AS (WITH cte2(y) AS (SELECT 1) SELECT y FROM cte2) SELECT x FROM cte;
WITH cte(x) AS (SELECT 1), cte2(y) AS (SELECT 2) SELECT * FROM cte INNER JOIN cte2 ON cte.x+1 = cte2.y;
CREATE TABLE tree (node INTEGER, parent INTEGER);
INSERT INTO tree VALUES (1,NULL), (10, 1), (11, 1), (100, 10), (101, 10), (110, 11), (111, 11);
WITH RECURSIVE cte(x) AS (SELECT 1 UNION ALL SELECT tree.node FROM tree INNER JOIN cte ON tree.parent=cte.x) SELECT * FROM cte;