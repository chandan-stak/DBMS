create database BANK;
use BANK;
CREATE TABLE Branch (
    branchname VARCHAR(30),
    branchcity VARCHAR(30),
    assets REAL,
    PRIMARY KEY (branchname)
);
CREATE TABLE BankAccount (
    accno INTEGER,
    branchname VARCHAR(30),
    balanace REAL,
    PRIMARY KEY (accno),
    FOREIGN KEY (branchname)
        REFERENCES Branch (branchname)
);
CREATE TABLE BankCustomer (
    customername VARCHAR(20),
    customerstreet VARCHAR(20),
    customercity VARCHAR(20),
    PRIMARY KEY (customername)
);
CREATE TABLE Depositer (
    customername VARCHAR(20),
    accno INTEGER,
    PRIMARY KEY (customername , accno),
    FOREIGN KEY (customername)
        REFERENCES BankCustomer (customername),
    FOREIGN KEY (accno)
        REFERENCES BankAccount (accno)
);
CREATE TABLE Loan (
    loannumber INT,
    branchname VARCHAR(30),
    amount REAL,
    PRIMARY KEY (loannumber),
    FOREIGN KEY (branchname)
        REFERENCES Branch (branchname)
);
insert into Branch
values('SBI_Chamrajpet','Bangalore',50000),
('SBI_ResidencyRoad','Bangalore',10000),
('SBI_ShivajiRoad','Bombay',20000),
('SBI_ParliamentRoad','Delhi',10000),
('SBI_Jantarmantar','Delhi',20000);
insert into Loan 
values(1,'SBI_Chamrajpet',1000),
(2,'SBI_ResidencyRoad',2000),
(3,'SBI_ShivajiRoad',3000),
(4,'SBI_ParliamentRoad',4000),
(5,'SBI_Jantarmantar',5000);
insert into BankAccount 
values(1,'SBI_Chamrajpet',2000),
(2,'SBI_ResidencyRoad',2000),
(3,'SBI_ShivajiRoad',2000),
(4,'SBI_ParliamentRoad',2000),
(5,'SBI_Jantarmantar',2000),
(6,'SBI_ShivajiRoad',2000),
(8,'SBI_ResidencyRoad',2000),
(9,'SBI_ParliamentRoad',2000),
(10,'SBI_ResidencyRoad',2000),
(11,'SBI_Jantarmantar',2000);
insert into BankCustomer
values('Avinash','Bull_Temple_Road','Bangalore'),
('Dinesh','Bannergatta_Road','Bangalore'),
('Mohan','NationalCollege_Road','Bangalore'),
('Nikhil','Akbar_Road','Delhi'),
('Ravi','Prithviraj_Road','Delhi');
insert into Depositer
values('Avinash',1),
('Dinesh',2),
('Nikhil',4),
('Ravi',5),
('Avinash',8),
('Nikhil',9),
('Dinesh',10),
('Nikhil',11);

select * from Branch;
select * from BankAccount;
select * from BankCustomer;
select * from Loan;
select * from Depositer;

select C.customername from BankCustomer C
		where exists(select D.customername,count(D.customername) 
		from Depositer D, BankAccount BA 
				where D.accno = BA.accno and D.customername = C.customername 
				and BA.branchname = 'SBI_ResidencyRoad' group by D.customername 
						having count(D.customername)>=2);
					
select BC.customername from BankCustomer BC 
		where not exists(select branchname from Branch 
		where branchcity = 'Delhi' NOT IN
				(select BA.branchname from Depositer D, BankAccount BA
						where D.accno = BA.accno and D.customername = BC.customername));
					
delete from BankAccount
		where branchname in
		(select branchname from Branch 
				where branchcity = 'Bombay');
                