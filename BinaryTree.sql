-- Ordering the Binary tree from a table
-- In the below table N represents the node value and P represents whether or not it is a parent

-- Table Tree

--  N       P
--  1	    2
--  3   	2
--  6   	8
--  9   	8
--  2   	5
--  8   	5
--  5	    NULL

select 
case 
	 when P is null then concat(N, ' ', 'Root') 
	 when N in (select P from tree) then concat(N, ' ', 'Inner') else concat(N, ' ', 'Leaf') 
end as node
from tree 
order by N ;

-- The output of the query:
--  "1 Leaf"
--  "2 Inner"
--  "3 Leaf"
--  "5 Root"
--  "6 Leaf"
--  "8 Inner"
--  "9 Leaf"