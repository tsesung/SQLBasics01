/*Store Procedures*/

CREATE PROCEDURE Temp_Employee 
AS
DROP TABLE IF EXISTS #temp_employee

CREATE table #temp_employee (
	JobTitle varchar(100),
	EmployeesPerJob int,
	AvgAge int,
	AvgSalary int
)

INSERT into #temp_employee
select es.JobTitle , COUNT(es.JobTitle), AVG(ed.Age), AVG(es.Salary)
from EmployeeDemographics ed 
join EmployeeSalary es 
on ed.EmployeeID = es.EmployeeID 
where es.JobTitle = @JobTitle
group by es.JobTitle 

select * from #temp_employee

exec Temp_Employee

exec Temp_Employee @JobTitle = 'Salesman' 