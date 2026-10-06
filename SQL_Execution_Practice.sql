--Logically think of a query on the above table created , that single query should contain where , group by, having , order by ----
--Note : Query should be meaningful and you must be able to understand order of execution--

--Display a Department Id ,average salary of employee where City is chennai and and average salary is > than 650000.From this we need atlease depatrmrnt more than 2 employee.Sort the reults by average[...]
select * from Employee

select [DeptID]as Department_ID,avg(Salary)as Average_Salary from Employee
where City='Chennai' 
group by DeptID having avg(salary)>650000 and count(Empname)>2
order by Average_Salary DESC

--Using the Employee and Department table
select * from Employee
select * from Department

--Department,Number of employees,Average salary,Total bonus--
--Conditions:
--Consider only employees from Chennai or Bengaluru
--Ignore employees whose Bonus is NULL
--Show only departments with at least 3 employees
--Show only departments where the average salary is greater than 65000
--Sort by total bonus in descending order

select d.DeptName as Department,Count(e.EmpName)as NoOfEmployees,Avg(e.Salary)as AverageSalary,sum(e.Bonus) as TotalBonus from Employee e join Department d on e.DeptID =d.DeptID 
where (e.City ='Chennai'or e.City='Bangalore')  and e.Bonus Is Not Null
group by d.DeptName
having count(e.Empname)>=3 and avg(e.salary)> 65000
order by sum(e.Bonus) Desc;




