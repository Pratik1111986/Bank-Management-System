Alter table bank_details1 add constraint FOREIGN KEY (Department_id) REFERENCES Departments(Department_id);
alter table employees add constraint foreign key (department_id) references departments(department_id);
alter table employees add constraint foreign key (job_id) references job_details(job_id);
alter table job_details add constraint foreign key(department_id)references departments(department_id);
alter table customers add constraint foreign key(branch_code)references bank_details1(branch_code);
alter table job_details add constraint foreign key(Branch_code)references bank_details1(BRANCH_CODE);
alter table job_details modify column Branch_code int;
alter table bank_details1 modify column branch_code int;
alter table bank_details1 add constraint primary key (branch_code);
alter table customers add constraint foreign key(employee_id)references employees(employee_id);
alter table customers modify column Account_No int;
select * from job_details;
select * from bank_details1;
select * from employees;
select * from customers;
select * from account_type;
select * from departments;
 
alter table customers add constraint primary key(account_no);
alter table departments add constraint foreign key(account_no)references account_type(account_no);

-- Find an employee’s whose id is 52 and branch name is icicp

select * from employees inner join bank_details1 on employees.Department_id = bank_details1.department_id where employees.Employee_id=52 and bank_details1.branch_name='icic_p';

-- Count the number of employees working in the loan department and show its opening dates and address

select * from bank_details1 inner join employees inner join account_type on bank_details1.department_id=employees.Department_id where employees.Department_id='8';
Select * from Account_type;
select 'type_acc ount' from account_type where type_account = 'Loan';
select opening_date,address,count(employees.Employee_id)from employees
inner join customers on employees.employee_id = customers.employee_id
inner join account_type on customers.account_no = account_type.account_no
inner join bank_details1 on customers.branch_code= bank_details1.branch_code
where employees.Employee_id = 8
group by account_type.opening_date,bank_details1.address;

--	Find details department name, address, branch code, dept _id, city of the account no 18190. 

 
 select * from customers inner join bank_details1 on customers.Branch_code=bank_details1.BRANCH_CODE
inner join departments on departments.Department_id=bank_details1.department_id where departments.Account_no=18190;

--	Find department id, department name, job id whose only work in LoanHR, admin.

select * from employees inner join departments on employees.Department_id=departments.Department_id where departments.Department_name in ('loan','HR','admin');

--	Create a view with that show address, branch name, department name, first name. phone no. 

create view A1 as select
departments.department_name ,employees.First_name,employees.Phone_no,bank_details1.address,bank_details1.branch_name
 from departments,employees,bank_details1;

select * from a1;












