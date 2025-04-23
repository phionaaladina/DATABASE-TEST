create database testdatabase;

use testdatabase;


create table tblstudent(
StudentID int primary key auto_increment ,
StudentName varchar(100),
Birthdate date,
Year varchar(50),
MobileNo varchar(15)
);


create table Finance(
StudentID int,
Tuition_Fee varchar(255),
Administration_Fee varchar(255),
Exams_Fee varchar(255),
Medical_fee varchar(255),
foreign key (StudentID) references tblstudent(StudentID)
);


INSERT INTO tblstudent (StudentID, StudentName, Birthdate, Year, MobileNo)
VALUES ('235', 'Jane', '1987-02-12', 'Y1S2', '0722245321'),
('26', 'Nicholas', '2002-07-22', 'Y1S1', '07204588674'),
('1', 'Cyrus', '1989-06-15', 'Y2S1', '0704231345'),
('2', 'Neema', '2008-11-29', 'Y2S1', '0733876987'),
('3', 'Caroline', '2002-10-18', 'Y1S1', '0732568448'),
('29', 'Judith', '2003-06-17', 'Y4S2', '0711234567'),
 ('127', 'Grace', '2000-01-14', 'Y1S2', '0733765987');
 
 
 
INSERT INTO Finance (StudentID, Tuition_Fee, Administration_Fee, Exams_Fee, Medical_fee)
VALUES 
(235, '30000', '5000', '3000', '4000'),
(26, '4000', '5000', '2000', '4000'),
(1, '34000', '5000', '3000', '4000'),
(2, '23000', '5000', '3000', '4000'),
(3, '20000', '5000', '3000', '4000'),
(29, '35000', '5000', '2000', '4000'),
(127, '28000', '5000', '3000', '4000');

-- ii) All students in Y1S1 with tuition
SELECT
    tblstudent.StudentName,
    Finance.Tuition_Fee
FROM
    tblstudent
JOIN
    Finance ON tblstudent.StudentID = Finance.StudentID
WHERE
    tblstudent.Year = 'Y1S1';
    

-- ii) name, id , year and tutiton for all who have paid greater than or equal to 30000
SELECT
    tblstudent.StudentID,
    tblstudent.StudentName,
    tblstudent.Year,
    Finance.Tuition_Fee
FROM
    tblstudent
JOIN
    Finance ON tblstudent.StudentID = Finance.StudentID
WHERE
    CAST(Finance.Tuition_Fee AS UNSIGNED) >= 30000;


-- iii) add new record 
INSERT INTO tblstudent ( StudentName, Birthdate, Year, MobileNo)
VALUES ( 'Dan', '2001-04-20', 'Y1S2', '0723456123');


-- iv) Change name 
SET SQL_SAFE_UPDATES = 0;

update tblstudent
set StudentName = 'Nelson'
where StudentID = '26';


-- vi)Highest and Lowest amount
SELECT
    MAX(Finance.Tuition_Fee) AS 'highest amount',
    MIN(Finance.Tuition_Fee) AS 'lowest amount'
FROM
    Finance;


