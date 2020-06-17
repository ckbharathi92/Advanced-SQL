--The actual table - Occupation is as below:

--  NAME      OCCUPATION
--"Samantha"	"Doctor"
--"Julia"    	"Actor"
--"Maria"   	"Actor"
--"Meera"   	"Singer"
--"Ashley"  	"Professor"
--"Ketty"   	"Professor"
--"Christeen"	"Professor"
--"Jane"    	"Actor"
--"Jenny"   	"Doctor"
--"Priya"   	"Singer"

--PIVOT function with advanced SELECT to get the necessary output of 
--The query:

select  min(Doctor)    as doctor, 
		min(Actor)     as Actor, 
		min(singer)    as singer, 
		min(professor) as professor
from (

select case when occupation = 'Doctor'    then Name end as Doctor,
	   Case	when occupation = 'Actor'     then Name end as Actor,
	   Case	when occupation = 'Singer'    then Name end as Singer,
	   Case	when occupation = 'Professor' then Name end as Professor,
	   row_number() over(partition by occupation) as Rownum
	
from occupations ) as occupation
group by Rownum
order by doctor asc,  Actor asc, singer asc, professor asc;


--The output will be:

--"Jenny"       "Jane"  	"Priya" 	"Ashley"
--"Samantha"    "Maria" 	"Meera" 	"Ketty"
-- Null         "Julia"		 Null       "Christeen"