/*
Select Statement * , TOP , Distinct , Count , As , Max , Min , Avg , Joins , Case , Where , orderby , groupby etc.
*/


select *
from EmployeeDemographics

select top 5 *
from EmployeeDemographics

select distinct(EmployeeID)
from EmployeeDemographics

select count(LastName) as LastNameCount
from EmployeeDemographics

select *
from EmployeeSalary

select max(Salary) as MaxSalary
from EmployeeSalary

select min(Salary) as MinSalary
from EmployeeSalary

select avg(Salary) as AvgSalary
from EmployeeSalary


select *
from EmployeeDemographics
where FirstName = 'Jim'

select *
from EmployeeDemographics
where age > 30

select *
from EmployeeDemographics
where Age < 32

select *
from EmployeeDemographics
where Age < 32 and Gender = 'Male'

select *
from EmployeeDemographics
where Age < 32 or Gender = 'Male'

select *
from EmployeeDemographics
where LastName like 'S%'

select *
from EmployeeDemographics
where LastName like '%R'

select *
from EmployeeDemographics
where LastName like '%r%'

select *
from EmployeeDemographics
where LastName is null

select *
from EmployeeDemographics
where LastName is not null


select *
from EmployeeDemographics
where FirstName IN ('Jim','Michael')



select Gender , Age , count(Gender) as TotalGender
from EmployeeDemographics
where Age > 31
group by Gender , Age
order by TotalGender Desc

select *
from master.dbo.EmployeeDemographics
inner join master.dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


select *
from master.dbo.EmployeeDemographics
FULL Outer Join master.dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


select *
from master.dbo.EmployeeDemographics
Left Outer Join master.dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

select *
from master.dbo.EmployeeDemographics
Right Outer Join master.dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


select EmployeeDemographics.EmployeeID , FirstName , LastName, Jobtitle , Salary 
from master.dbo.EmployeeDemographics
right outer join master.dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


select EmployeeDemographics.EmployeeID , FirstName , LastName, Jobtitle , Salary 
from master.dbo.EmployeeDemographics
left outer join master.dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
where FirstName <> 'Michael'
order by Salary Desc


select JobTitle ,  avg(Salary) as AvgSalary
from master.dbo.EmployeeDemographics
inner join master.dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
where JobTitle = 'Salesman'
group by JobTitle


select EmployeeID ,FirstName,Age 
from EmployeeDemographics
UNION
select EmployeeID,JobTitle,Salary 
from EmployeeSalary
order by EmployeeID


select FirstName , LastName , JobTitle , Salary,
CASE
    when JobTitle = 'Salesman' then Salary + (Salary *.10)
    when JobTitle = 'Accountant' then Salary + (Salary *.05)
    when JobTitle = 'HR' then Salary + (Salary * .000001)
    else Salary + (Salary *.03)
END as SalaryAfterRaise
from EmployeeDemographics
join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID



select FirstName , LastName , Age,
CASE
    when Age > 30 then 'Old'
    else 'young'
END
from EmployeeDemographics
where Age is not NULL
order by Age


select JobTitle , count(JobTitle)
from EmployeeDemographics
Join EmployeeSalary
    on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
having count(JobTitle) > 1

select JobTitle , avg(Salary)
from EmployeeDemographics
Join EmployeeSalary
    on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
having avg(Salary) > 45000
order by avg(Salary)


UPDATE EmployeeDemographics
SET EmployeeID = 1012
where FirstName = 'Kevin' and LastName = 'Malone'

UPDATE EmployeeDemographics
SET Age = 34 , Gender = 'Female'
where FirstName = 'Kevin' and LastName = 'Malone'

delete from EmployeeDemographics
where EmployeeID = 1005

select *
from EmployeeDemographics


select FirstName + ' ' + LastName as FullName
from EmployeeDemographics







