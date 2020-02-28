create database sp;
use sp;

create table supplier(
sid int,
sname varchar(30),
city varchar(30)
);

create table parts(
pid int,
pname varchar(30),
color varchar(30)
);
alter table parts add primary key(pid);
alter table supplier add primary key(sid);
create table catalog(
sid int,
pid int,
cost int,
foreign key(sid) references supplier(sid),
foreign key(sid) references supplier(sid)
);
alter table catalog add primary key(sid,pid);
insert into supplier values
(10001,'Acme Widget','Bangalore'),
(10002,'Johns','Kolakata'),
(10003,'Vimal',',Mumbai'),
(10004,'Reliance','Delhi');

insert into parts values
(20001,'Book','Red'),
(20002,'Pen','Red'),
(20003,'Pencil','Green'),
(20004,'Mobile','Green'),
(20005,'Charger','Black');

insert into catalog values
(10001,'20001','10'),
(10001,'20002','10'),
(10001,'20003','30'),
(10001,'20004','10'),
(10001,'20005','10'),
(10002,'20001','10'),
(10002,'20002','20'),
(10003,'20003','30'),
(10004,'20003','40');

select distinct sid from catalog,parts where catalog.pid=parts.pid and parts.color='red' or parts.color='green';
select distinct supplier.sid from catalog,parts,supplier where supplier.sid=catalog.sid and catalog.pid=parts.pid and parts.color='red' or supplier.city='Banglore';
select distinct c1.sid,c2.sid from catalog c1,catalog c2 where c1.cost>c2.cost and c1.sid!=c2.sid and c1.cost!=c2.cost and c1.pid=c2.pid;