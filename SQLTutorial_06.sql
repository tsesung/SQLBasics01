/*Subqueries*/

select * from EmployeeSalary es 

select EmployeeID, Salary, (select AVG(Salary) from EmployeeSalary es2) as AllAvgSalary
from EmployeeSalary es 

select EmployeeID, JobTitle, Salary
, AVG(Salary) over (PARTITION By JobTitle) as AllAvgSalary
from EmployeeSalary es 

select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
from EmployeeSalary es 
group by EmployeeID, Salary 
order by 1,2

select a.EmployeeID, a.AllAvgSalary 
from (
select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary from EmployeeSalary es 
) a

select EmployeeID, JobTitle, Salary 
from EmployeeSalary es 
WHERE EmployeeID in (
	SELECT EmployeeID from EmployeeDemographics ed
	where ed.Age > 30
)

