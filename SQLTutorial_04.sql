/*Create, Retrieve, Update, Delete*/

select *
from EmployeeDemographics ed

INSERT into EmployeeDemographics values 
(null, 'Holly', 'Flax', null, null)

UPDATE EmployeeDemographics
set EmployeeID  = 1012
where FirstName = 'Holly' and LastName = 'Flax'

UPDATE EmployeeDemographics 
set Age = 31, Gender = 'Female'
where FirstName = 'Holly' and LastName = 'Flax'

DELETE from EmployeeDemographics 
WHERE EmployeeID = 1012


/*ALIAS*/
select FirstName + '' + LastName as FullName
from EmployeeDemographics ed

select AVG(Age) AverageAge 
from EmployeeDemographics ed

select Demo.EmployeeID, Sal.Salary 
from EmployeeDemographics as Demo
join EmployeeSalary as Sal
on Demo.EmployeeID = Sal.EmployeeID 
  

/*PARTITION BY*/
select ed.FirstName, ed.LastName, ed.LastName, es.Salary 
, COUNT(Gender) over (PARTITION BY Gender) as TotalGender 
from EmployeeDemographics ed
join EmployeeSalary es on ed.EmployeeID  = es.EmployeeID 

select ed.FirstName, ed.LastName, ed.LastName, es.Salary 
, COUNT(Gender)
from EmployeeDemographics ed
join EmployeeSalary es on ed.EmployeeID  = es.EmployeeID 
group by ed.FirstName, ed.LastName, ed.LastName, es.Salary

select Gender , COUNT(Gender)
from EmployeeDemographics ed
join EmployeeSalary es on ed.EmployeeID  = es.EmployeeID 
GROUP by Gender 


/*CTE: Common Table Expression*/
with CTE_Employee as (
	select ed.FirstName, ed.LastName, ed.Gender, es.Salary
	, COUNT(ed.Gender) over (PARTITION By Gender) as TotalGender
	, AVG(es.Salary) over (PARTITION By Gender) as AvgSalary
	from EmployeeDemographics ed 
	join EmployeeSalary es 
	on ed.EmployeeID = es.EmployeeID
	where es.Salary > 45000
)
select * from CTE_Employee



/*Temp Tables*/

CREATE table #temp_Employee (
 EmployeeID int,
 JobTitle varchar(100),
 Salary int
 )
 
INSERT into #temp_Employee values 
(1001,'HR',45000)

select * from #temp_Employee

INSERT into #temp_Employee
select * from EmployeeSalary es 


DROP TABLE IF EXISTS #temp_Employee2

CREATE table #temp_Employee2 (
	JobTitle varchar(50),
	EmployeesPerJob int,
	AvgAge int,
	AvgSalary int
)

INSERT into #temp_Employee2
select es.JobTitle , COUNT(es.JobTitle), AVG(ed.Age), AVG(es.Salary)
from EmployeeDemographics ed 
join EmployeeSalary es 
on ed.EmployeeID = es.EmployeeID 
group by es.JobTitle 
 
select * from #temp_Employee2


/*String Functions*/
--Drop Table IF EXISTS EmployeeErrors;


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

select * from EmployeeErrors ee 

select EmployeeID, TRIM(EmployeeID) as IDTRIM from EmployeeErrors ee 

select EmployeeID, LTRIM(EmployeeID) as IDTRIM from EmployeeErrors ee 

select EmployeeID, RTRIM(EmployeeID) as IDTRIM from EmployeeErrors ee 


select LastName , REPLACE(LastName,'- Fired', '')  as LastNameFixed from EmployeeErrors ee 

select FirstName , SUBSTRING(FirstName,1,3)  as LastNameFixed from EmployeeErrors ee 

select ee.FirstName, ed.FirstName  
from EmployeeErrors ee 
join EmployeeDemographics ed 
on SUBSTRING(ee.FirstName,1,3) = SUBSTRING(ed.FirstName,1,3) 

select FirstName , LOWER(FirstName) from EmployeeErrors ee 

select FirstName , UPPER(FirstName) from EmployeeErrors ee 






