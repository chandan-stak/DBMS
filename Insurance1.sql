create database INSURANCE;
use INSURANCE;
CREATE TABLE PERSON (
    driver_id VARCHAR(100),
    name VARCHAR(100),
    address VARCHAR(100)
);
alter table PERSON add primary key(driver_id);
CREATE TABLE CAR (
    reg_num VARCHAR(100),
    model VARCHAR(100),
    year INT,
    PRIMARY KEY (reg_num)
);
CREATE TABLE OWNS (
    driver_id VARCHAR(100),
    reg_num VARCHAR(100),
    PRIMARY KEY (driver_id , reg_num),
    FOREIGN KEY (driver_id)
        REFERENCES PERSON (driver_id),
    FOREIGN KEY (reg_num)
        REFERENCES CAR (reg_num)
);
CREATE TABLE ACCIDENT (
    report_num INT,
    accident_date DATE,
    location VARCHAR(100),
    PRIMARY KEY (report_num)
);
CREATE TABLE PARTICIPATED (
    driver_id VARCHAR(100),
    reg_num VARCHAR(100),
    report_num INT,
    damage_amount INT
);
alter table PARTICIPATED add foreign key(driver_id) references PERSON(driver_id);
alter table PARTICIPATED add foreign key(reg_num) references CAR(reg_num);
alter table PARTICIPATED add foreign key(report_num) references ACCIDENT(report_num);
alter table PARTICIPATED add primary key(driver_id,reg_num,report_num);
desc PARTICIPATED;
insert into PERSON values('A01','Richard','Srinivas nagar'),('A02','Pradeep','Rajaji nagar'),('A03','Smith','Ashok nagar'),
('A04','Venu','NR colony'),('A05','Jhon','Hanumanth nagar');
insert into CAR values('KA052250','Indica',1990),('KA031181','Lancer',1957),('KA095477','Toyota',1998),
('KA053408','Honda',2008),('KA041702','Audi',2005);
insert into OWNS values('A01','KA052250'),('A02','KA053408'),('A03','KA031181'),
('A04','KA095477'),('A05','KA041702');
insert into ACCIDENT values(11,'2003-01-01','Mysore Road');
insert into ACCIDENT values(12,'2004-02-02','South end circle');
insert into ACCIDENT values(13,'2003-01-21','Bull temple road');
insert into ACCIDENT values(14,'2017-02-17','Mysore Road');
insert into ACCIDENT values(15,'2005-03-04','Kanakapura Road');
insert into PARTICIPATED values('A01','KA052250',11,10000),('A02','KA053408',12,50000),('A03','KA095477',13,25000),
('A04','KA031181',14,3000),('A05','KA041702',15,5000);
UPDATE ACCIDENT 
SET 
    accident_date = '2008-02-17'
WHERE
    report_num = 14;
SELECT 
    *
FROM
    PARTICIPATED;

UPDATE PARTICIPATED 
SET 
    damage_amount = '25000'
WHERE
    reg_num = 'KA053408' AND report_num = 12;
insert into ACCIDENT values(16,'2010-05,22','Hebbal');

SELECT 
    *
FROM
    PARTICIPATED;
SELECT 
    COUNT(DISTINCT driver_id) CNT
FROM
    PARTICIPATED,
    ACCIDENT
WHERE
    PARTICIPATED.report_num = ACCIDENT.report_num
        AND accident_date LIKE '2008%';
SELECT 
    COUNT(PARTICIPATED.reg_num) count
FROM
    PARTICIPATED,
    CAR,
    ACCIDENT
WHERE
    PARTICIPATED.report_num = ACCIDENT.report_num
        AND CAR.reg_num = PARTICIPATED.reg_num
        AND model = 'Audi';

SELECT 
    NAME
FROM
    PERSON
WHERE
    DRIVER_ID IN (SELECT 
            DRIVER_ID
        FROM
            PARTICIPATED
        WHERE
            DAMAGE_AMOUNT > (SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED));  



