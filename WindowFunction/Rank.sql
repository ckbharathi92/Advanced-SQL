# Window Function
# Rank
# CTE


with distinctdetails as (
select distinct patientid, 
                productid,
                min(dateofconsultation) as dateofconsultation  
                from patients 
                group by patientid, productid
) , 

Source AS (
	SELECT patientid, 
            productid,
            dateofconsultation, 
			Rank() OVER(
				PARTITION BY patientid
				order by dateofconsultation
			) AS RankNum 
	FROM distinctdetails
)

SELECT  patientid, 
        productid, 
        dateofconsultation 
        FROM source 
        WHERE RankNum = 2;