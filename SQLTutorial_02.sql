
select * from EmployeeDemographics 

select FirstName, LastName
from EmployeeDemographics 

select top 5 FirstName, LastName
from EmployeeDemographics 

select distinct EmployeeID 
from EmployeeDemographics

select count(LastName) as LastNameCount
from EmployeeDemographics

select MAX(Salary)  from EmployeeSalary es 

select MIN(Salary)  from EmployeeSalary es 

select AVG(Salary)  from EmployeeSalary es 



select * 
from EmployeeDemographics ed 
where FirstName <> 'Jim'

select * 
from EmployeeDemographics ed 
where Age <= 32
and Gender = 'Male'

select * 
from EmployeeDemographics ed 
where Age <= 32
or Gender = 'Male'

select * 
from EmployeeDemographics ed 
where LastName like 'S%o%'

select * 
from EmployeeDemographics ed 
where FirstName is NOT NULL 

select * 
from EmployeeDemographics ed 
where FirstName in ('Jim','Michael')

select *
from EmployeeDemographics ed 

select Gender, COUNT(Gender) as CountGender
from EmployeeDemographics ed 
where Age > 31
group by Gender
order by CountGender DESC

select *
from EmployeeDemographics ed 
order by Age, Gender DESC

select *
from EmployeeDemographics ed 
order by 4 DESC, 5 DESC












