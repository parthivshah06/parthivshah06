create database school ;
use school ;

create table student_
(
STUDENT_ID INT 	primary KEY,
STUDENT_NAME VARCHAR (23),
GENDER varchar (34),
Percentage INT ,
STD  INT ,
SEC  VARCHAR (45),
STREAM_  VARCHAR (23),
DOB  DATE  
);
SELECT * FROM  STUDENT_;

/* Q-1 To display all the records form STUDENT table. SELECT * FROM student */

SELECT * FROM STUDENT_ ;

/* Q-2 To display any name and date of birth from the table */

SELECT STUDENT_NAME ,DOB FROM STUDENT_ ;

/* Q-3 To display all students record where percentage is greater of equal to 80. */

SELECT * FROM  STUDENT_ where Percentage >=80 ;


/* Q-4  To display student name, stream and percentage where percentage of student is more than 80. */

select STUDENT_Name, Stream_, Percentage from student_ where Percentage > 80;

/* Q-5 To display all records of science students whose percentage is more than 75 form student table. */


select * from student_ where Stream_ = 'Science' and Percentage > 75 ;



