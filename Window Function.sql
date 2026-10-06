select * from Employee

--Question 1 – ROW_NUMBER()
--Display the following columns:EmpName,DeptID,Salary,Row Number
--Conditions:Assign a unique row number to employees within each department.
--Highest salary should get Row Number 1.
--Sort the final result by DeptID and Row Number.

with CTE as(
    Select Empname,DeptID,Salary,Row_Number()over (partition by DeptID order by Salary Desc) as RN
    from Employee
)
select * from CTE 
order by DeptID,RN

--Question 2 – RANK()
--Display:EmpName,DeptID,Salary,Salary Rank
--Conditions:Rank employees within each department based on salary.
--Employees with the same salary should receive the same rank.
--Show the highest salary first.

with CTE as (
    select EmpName,DeptID,Salary,Rank()over(partition by DeptID order by Salary Desc) as Sal_Rank
    from Employee
)
select EmpName,DeptID,Salary,Sal_Rank From CTE 
order by DeptID,Salary Desc

--Question 3 – DENSE_RANK()
--Display:EmpName,DeptID,Salary,Dense Rank
--Conditions:Rank employees by salary within each department.
--Employees with equal salaries should have the same rank.
--No gaps should appear in the ranking.

with CTE as (
    select EmpName,DeptID,Salary,Dense_Rank()over (partition by DeptID order by salary desc) as [Dense Rank]
    from Employee
)
select EmpName,DeptID,Salary,[Dense Rank] from CTE
order by DeptID,Salary Desc

--Question 4 – Second Highest Salary
--Display all employees who earn the second highest salary in each department.
--Expected Columns:EmpName,DeptID,Salary

With Second_Highest_Salary as (
    select EmpName,DeptID,Salary,Dense_Rank()over(partition by DeptID order by Salary Desc) as RNK
    from Employee
)
select EmpName,DeptID,Salary from Second_Highest_Salary 
Where RNK =2

--Question 5 – Top 3 Salaries
--Display the top 3 highest-paid employees from each department.
--Expected Columns:EmpName,DeptID,Salary

with TOP_3_Salaries as (
    select EmpName,DeptID,Salary,Row_Number()over(partition by DeptID order by Salary Desc) as RNK
    from Employee
)
select EmpName,DeptID,Salary from TOP_3_Salaries
where RNK <=3