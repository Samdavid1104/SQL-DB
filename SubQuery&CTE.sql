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
select * from HighSalaryEmployees
order by Salary desc

--Question 4
--Create a CTE named DepartmentSalarySummary that calculates the number of employees, total salary and average salary for each department. 
--Display only departments whose average salary is greater than £55,000. Use only the Employee table and display DeptID

WITH DepartmentSalarySummary AS(
    SELECT
        DeptID,
        COUNT(EmpID) AS Number_of_Employees,
        SUM(Salary) AS Total_Salary,
        AVG(Salary) AS Average_Salary FROM Employee
        GROUP BY DeptID
)
SELECT
    DeptID,
    Number_of_Employees,
    Total_Salary,
    Average_Salary
FROM DepartmentSalarySummary
WHERE Average_Salary > 55000;

--Question 5
--Display employees whose salary is greater than the average salary of their own department.
--Expected Columns:EmpName,DeptID,Salary

Select Empname,DeptID,avg(Salary)as Average_Salary From Employee e 
where salary >(select Avg(salary) from Employee
where DeptID= e.DeptID)
group by EmpName,DeptID

Question 6
--Create a CTE that ranks employees within each department based on salary. 
--Display the second-highest-paid employee from each department along with the department name

With second_highest_paid as(
    select e.Empname AS [Employee Name],
    d.DeptName As [Department Name],
    e.Salary AS Salary,
    Dense_Rank()over(Partition by d.DeptName order by e.Salary DESC)as RNK
    From Employee e join Department d on e.DeptID=d.DeptID
)
select [Employee Name],[Department Name],Salary From second_highest_paid
where RNK =2 


 