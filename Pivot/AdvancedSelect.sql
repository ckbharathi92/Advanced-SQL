--Advanced SELECT to fetch the company code, founder, number of lead managers, 
--senior managers, managers, employers under a certain founder and company code


select  c.company_code, 
		c.founder,
		count(distinct lm.lead_manager_code) as lm,
		count(distinct (sm.senior_manager_code)) as sm,
		count(distinct man.manager_code) as man,
		count(distinct emp.employee_code) as emp
		
from company as c, 
	 lead_manager as lm, 
	 senior_manager as sm, 
	 manager as man, 
	 employee as emp

where c.company_code = lm.company_code
and	  lm.lead_manager_code = sm.lead_manager_code
and	  sm.senior_manager_code = man.senior_manager_code
and   man.manager_code = emp.manager_code

group by c.company_code, c.founder	;


--"C1"	"Monika"	1	2	1	2
--"C2"	"Samantha"	1	1	2	2

