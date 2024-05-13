1.
    Create table Person (PersonId int, FirstName varchar(255), LastName varchar(255))
    Create table Address (AddressId int, PersonId int, City varchar(255), State varchar(255))
    Truncate table Person
    insert into Person (PersonId, LastName, FirstName) values ('1', 'Wang', 'Allen')
    Truncate table Address
    insert into Address (AddressId, PersonId, City, State) values ('1', '2', 'New York City', 'New York')


Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:
FirstName, LastName, City, State

ANSWER:

select p.FirstName, p.LastName, a.City, a.State from Person as p
left join Address as a on p.PersonId = a.PersonId;

2.
Create table If Not Exists Employee (Id int, Salary int)
    Truncate table Employee
    insert into Employee (Id, Salary) values ('1', '100')
    insert into Employee (Id, Salary) values ('2', '200')
    insert into Employee (Id, Salary) values ('3', '300')

Write a SQL query to get the second highest salary from the Employee table.

ANSWER:

select Salary from (select ROW_NUMBER() OVER (ORDER BY Salary DESC) AS ROW, Salary
                    from Employee)
as NumberedEmployee
WHERE ROW = 2;

3.
Create table If Not Exists Employee (Id int, Name varchar(255), Salary int, ManagerId int)
    Truncate table Employee
    insert into Employee (Id, Name, Salary, ManagerId) values ('1', 'Joe', '70000', '3')
    insert into Employee (Id, Name, Salary, ManagerId) values ('2', 'Henry', '80000', '4')
    insert into Employee (Id, Name, Salary, ManagerId) values ('3', 'Sam', '60000', 'None')
    insert into Employee (Id, Name, Salary, ManagerId) values ('4', 'Max', '90000', 'None')
The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.

ANSWER:

select e1.Name from Employee as e
join Employee as m m.Id = e.ManagerId
where e.Salary > m.Salary;

4.
Create table If Not Exists Person (Id int, Email varchar(255))
    Truncate table Person
    insert into Person (Id, Email) values ('1', 'a@b.com')
    insert into Person (Id, Email) values ('2', 'c@d.com')
    insert into Person (Id, Email) values ('3', 'a@b.com')

Write a SQL query to find all duplicate emails in a table named Person.

ANSWER:

select Email from Person
group by Email
HAVING count(*) > 1;
5.
Create table If Not Exists Customers (Id int, Name varchar(255))
Create table If Not Exists Orders (Id int, CustomerId int)
    Truncate table Customers
    insert into Customers (Id, Name) values ('1', 'Joe')
    insert into Customers (Id, Name) values ('2', 'Henry')
    insert into Customers (Id, Name) values ('3', 'Sam')
    insert into Customers (Id, Name) values ('4', 'Max')
    Truncate table Orders
    insert into Orders (Id, CustomerId) values ('1', '3')
    insert into Orders (Id, CustomerId) values ('2', '1')


Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

ANSWER:

select c.Name from Customers as c
left join Orders as o o.CustomerId = c.Id
where o.CustomerId is null;

6.

Create table If Not Exists courses (student varchar(255), class varchar(255))
    Truncate table courses
    insert into courses (student, class) values ('A', 'Math')
    insert into courses (student, class) values ('B', 'English')
    insert into courses (student, class) values ('C', 'Math')
    insert into courses (student, class) values ('D', 'Biology')
    insert into courses (student, class) values ('E', 'Math')
    insert into courses (student, class) values ('F', 'Computer')
    insert into courses (student, class) values ('G', 'Math')
    insert into courses (student, class) values ('H', 'Math')
    insert into courses (student, class) values ('I', 'Math')

There is a table courses with columns: student and class
Please list out all classes which have more than or equal to 5 students.

ANSWER:

select class from courses
group by class
having count(*) >= 5;