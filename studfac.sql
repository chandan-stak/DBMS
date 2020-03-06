create database StudentFaculty;
use StudentFaculty;
CREATE TABLE student (
    snum INT,
    sname VARCHAR(30),
    major VARCHAR(30),
    lvl VARCHAR(30),
    age INT,
    PRIMARY KEY (snum)
);
CREATE TABLE faculty (
    fid INT,
    fname VARCHAR(30),
    deptid INT,
    PRIMARY KEY (fid)
);
CREATE TABLE class (
    cname VARCHAR(30),
    meets_at TIMESTAMP,
    room VARCHAR(30),
    fid INT,
    PRIMARY KEY (cname),
    FOREIGN KEY (fid)
        REFERENCES faculty (fid)
);
alter table class modify meets_at time;

CREATE TABLE enrolled (
    snum INT,
    cname VARCHAR(30),
    PRIMARY KEY (snum , cname),
    FOREIGN KEY (snum)
        REFERENCES student (snum),
    FOREIGN KEY (cname)
        REFERENCES class (cname)
);

insert into student values(1,'john','CS','Sr',19),
(2,'Smith','CS','Jr',20),
(3,'Jacob','CV','Sr',20),
(4,'Tom','CS','Jr',20);

insert into faculty values(11,'Harish',1000),
(12,'MV',1000),
(13,'Mira',1001),
(14,'Shiva',1002),
(15,'Nupur',1000);

insert into class values('class1', '10:15:16', 'R1', 14),
('class10', '10:15:16', 'R128', 14),
('class2', '10:15:20', 'R2', 12),
('class3', '10:15:25', 'R3', 12),
('class4', '20:15:20', 'R4', 14),
('class5', '20:15:20', 'R3', 15),
('class6', '13:20:20', 'R2', 14),
('class7', '10:10:10', 'R3', 14);

 insert into enrolled values (1, 'class1'),
 (2, 'class1'),
 (3, 'class3'),
 (4, 'class3'),
 (5, 'class4'),
 (1, 'class5'),
 (2, 'class5'),
 (3, 'class5'),
 (4, 'class5'),
 (5, 'class5');

SELECT 
    *
FROM
    class;
SELECT 
    *
FROM
    student;

insert into student values(5,'Rahul','CS','Jr',20);

