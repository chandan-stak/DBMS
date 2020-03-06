create database sp;
use sp;

CREATE TABLE supplier (
    sid INT,
    sname VARCHAR(30),
    city VARCHAR(30)
);

CREATE TABLE parts (
    pid INT,
    pname VARCHAR(30),
    color VARCHAR(30)
);
alter table parts add primary key(pid);
alter table supplier add primary key(sid);
CREATE TABLE catalog (
    sid INT,
    pid INT,
    cost INT,
    FOREIGN KEY (sid)
        REFERENCES supplier (sid),
    FOREIGN KEY (sid)
        REFERENCES supplier (sid)
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

SELECT DISTINCT
    sid
FROM
    catalog,
    parts
WHERE
    catalog.pid = parts.pid
        AND parts.color = 'red'
        OR parts.color = 'green';
SELECT DISTINCT
    supplier.sid
FROM
    catalog,
    parts,
    supplier
WHERE
    supplier.sid = catalog.sid
        AND catalog.pid = parts.pid
        AND parts.color = 'red'
        OR supplier.city = 'Banglore';
SELECT DISTINCT
    c1.sid, c2.sid
FROM
    catalog c1,
    catalog c2
WHERE
    c1.cost > c2.cost AND c1.sid != c2.sid
        AND c1.cost != c2.cost
        AND c1.pid = c2.pid;

SELECT 
    sname
FROM
    supplier
WHERE
    sid IN (SELECT 
            sid
        FROM
            catalog
        WHERE
            cost IN (SELECT 
                    MAX(cost)
                FROM
                    catalog
                GROUP BY (pid))); 