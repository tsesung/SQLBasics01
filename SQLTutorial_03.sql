/*JOINS*/

select * from EmployeeDemographics ed 

select * from EmployeeSalary es 

select * 
from EmployeeDemographics ed 
inner join EmployeeSalary es 
	on ed.EmployeeID  = es.EmployeeID 
	
select * 
from EmployeeDemographics ed 
full outer join EmployeeSalary es 
	on ed.EmployeeID  = es.EmployeeID 
	
select * 
from EmployeeDemographics ed 
left outer join EmployeeSalary es 
	on ed.EmployeeID  = es.EmployeeID 
	
select ed.EmployeeID, FirstName, LastName, JobTitle, Salary	 
from EmployeeDemographics ed 
right outer join EmployeeSalary es 
	on ed.EmployeeID  = es.EmployeeID 

select ed.EmployeeID, FirstName, LastName, JobTitle, Salary	 
from EmployeeDemographics ed 
inner join EmployeeSalary es 
	on ed.EmployeeID  = es.EmployeeID 


select ed.EmployeeID, FirstName, LastName, Salary
from EmployeeDemographics ed 
inner join EmployeeSalary es 
	on ed.EmployeeID  = es.EmployeeID 
where FirstName <> 'Michael'
order by Salary DESC

select es.JobTitle, AVG(Salary)
from EmployeeDemographics ed 
inner join EmployeeSalary es 
	on ed.EmployeeID  = es.EmployeeID 
where es.JobTitle = 'Salesman'
GROUP BY es.JobTitle 


/*UNIONS*/
--Table 3 Query:
Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

--Table 3 Insert:
Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

select * from WareHouseEmployeeDemographics whed 

select * from EmployeeDemographics ed 
union
select * from WareHouseEmployeeDemographics whed 

select EmployeeID, FirstName, Age  from EmployeeDemographics ed 
union
select EmployeeID, JobTitle, Salary from EmployeeSalary es 


/*CASE*/
select EmployeeID, FirstName, Age  
,CASE 
	when Age > 30 then 'Old'
	else 'Young'
END
from EmployeeDemographics ed 

select FirstName, LastName, JobTitle, Salary
,CASE
	when JobTitle = 'Salesman' then Salary + (Salary * 0.10)
	when JobTitle = 'Accountant' then Salary + (Salary * 0.05)
	when JobTitle = 'HR' then Salary + (Salary * 0.01)
	else Salary + (Salary * 0.03)
END as SalaryAfterRaise
from EmployeeDemographics ed 
join EmployeeSalary es on ed.EmployeeID  = es.EmployeeID 


/*HAVING*/
select JobTitle, count(JobTitle)
from EmployeeDemographics ed 
join EmployeeSalary es on ed.EmployeeID  = es.EmployeeID 
group by JobTitle
having count(JobTitle) > 1

select JobTitle, AVG(Salary)
from EmployeeDemographics ed 
join EmployeeSalary es on ed.EmployeeID  = es.EmployeeID 
group by JobTitle
having AVG(Salary) > 45000
order by AVG(Salary)





