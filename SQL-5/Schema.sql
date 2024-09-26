CREATE TABLE Salary
	(emp_id int(5),
     emp_name varchar (20),
     base_salary int(10),
     primary key (emp_id));
     
CREATE TABLE Income
	(id int(5),
     income varchar(10),
	 percentage int (5),
     primary key (id));
     
CREATE Table Deduction
	(id int(5),
     deduction varchar(10),
     percentage int(5),
     primary key (id));
     
INSERT INTO Salary(emp_id,emp_name,base_salary) VALUES 
	(1,"Rohan",5000),
    (2,"Alex",6000),
    (3,"Maryam",7000);
    
INSERT INTO Income(id,income,percentage) VALUES
	(1,"Basic",100),
    (2,"Allowance",4),
    (3,"others",6);
    
INSERT INTO Deduction(id,deduction,percentage) VALUES
	(1,"Insurance",5),
    (2,"Health",6),
    (3,"House",4);
     