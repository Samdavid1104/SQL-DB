select * from Employee
Select * From Department
--Question 1:
--Display the employee name and salary of employees earning more than the average salary of all employees.
--Expected Columns:EmpName,Salary

Select Empname as [Employee Name],Salary From Employee
where salary >(Select avg(salary)from Employee)

--Question 2
--Display all employee details for employees working in departments located in Chennai.The department IDs should be identified using another query.
--Expected Columns:EmpID,EmpName,DeptID,Salary

select EmpID,Empname,DeptID,Salary from Employee 
where DeptID IN (select DeptID From Department
where City='Chennai')

--Question 3
--Create a CTE named HighSalaryEmployees containing employees whose salary is
--greater than £60,000. Display all rows sorted by salary in descending order.

with HighSalaryEmployees as(
    select Empname, Salary,
           row_number() over(order by Salary desc) as RWN
    from Employee
    where Salary > 60000
)
select *
from HighSalaryEmployees
order by Salary desc;


