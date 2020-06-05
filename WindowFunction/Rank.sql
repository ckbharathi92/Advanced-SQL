# Window Function
# Rank


with Test as (
select distinct patientid, productid,min(dateofconsultation) as dateofconsultation  from patients group by patientid, productid
) , 

SOURCE AS (
	SELECT *, 
			rank() OVER(
				PARTITION BY patientid
				order by dateofconsultation
			) AS record_num 
	FROM test
)

SELECT patientid, productid, dateofconsultation FROM source WHERE record_num = 2;