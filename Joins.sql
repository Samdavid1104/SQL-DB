--Question 1 – INNER JOIN Display the following details:
--Employee Name ,Department Name 
--Conditions:Show only employees who belong to a department & Sort by Employee Name.

select e.EmpName as [Employee Name],d.DeptName as [Department Name] From Employee e join Department d on e.DeptID =D.DeptID
order by e.EmpName

--Question 2 – INNER JOIN + WHERE Display:
--Employee Name,Department Name,Salary Conditions
--Show employees working in Chennai,Consider only employees earning more than £60,000, Sort by Salary (DESC).

select e.EmpName as [Employee Name],d.DeptName as [Department Name],e.Salary From Employee e join Department d on e.DeptID =D.DeptID
where e.City='Chennai' and e.Salary >60000
order by e.Salary Desc

--Question 3 – LEFT JOIN Display: 
--Employee Name,Department Name 
--Conditions:Show all employees, even if they are not assigned to any department, Sort by Employee Name.

select e.EmpName as [Employee Name],d.DeptName as [Department Name] From Employee e Left join Department d on e.DeptID =D.DeptID
order by e.EmpName

--Question 4 – RIGHT JOIN Display: 
--Employee Name,Department Name 
--Conditions:Show all departments, even if no employees belong to them,Sort by Department Name.

Select e.Empname as [Employee Name],d.DeptName as [Department Name] from Employee e Right Join Department d on e.DeptID =d.DeptID
order by d.DeptName 

--Question 5 – JOIN + Aggregation
--Find:Department Name,Number of Employees,Total Salary,Average Salary 
--Conditions:Consider employees earning more than £50,000,Display only departments having at least 2 employees,Sort by Total Salary (DESC).

Select 
d.DeptName as [Department Name],
count(e.EmpName) as [Number Of Employees],
sum(e.Salary) as [Total Salary],
Avg(e.Salary) as [Average Salary]from Employee e Right Join Department d on e.DeptID =d.DeptID
where e.Salary >50000
Group by d.DeptName
having count(e.Empname) >=2 
order by sum(salary) Desc



