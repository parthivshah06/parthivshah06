CREATE DATABASE  WORKER_ ;
USE WORKER_;

CREATE TABLE  WORKER 
(
WORKER_ID INT  ,
WORKER_NAME VARCHAR(24) ,
WORKER_LNAME VARCHAR (23),
WORKER_SALARY INT ,
JOINIG_DATE  VARCHAR  (34),
DEPARTMENT  VARCHAR (34)
);
SELECT * FROM WORKER ;

INSERT INTO WORKER (WORKER_ID, WORKER_NAME, WORKER_LNAME, WORKER_SALARY, JOINIG_DATE, DEPARTMENT)
VALUES (1, "MONIKA","ARORA",100000,"2/10/2014","HR");
INSERT INTO WORKER VALUES (2,"NIHARIKA","VERMA",80000,"6/11/2014","ADMIN") ;
INSERT INTO WORKER VALUES (3,"VISHAL","SINGHAL",300000,"3/5/2014","HR") ;
INSERT INTO WORKER VALUES (4,"AMITABH","SINGH ",500000,"3/3/2014","ADMIN");
INSERT INTO WORKER VALUES (5,"VIVEK","BHATI",500000,"12/2/2014","ADMIN");
INSERT INTO WORKER VALUES (6,"VIPUL","DIWAN",200000,"2/2/2014","ACCOUNT");
INSERT INTO WORKER VALUES (7,"SATISH","KUMAR",75000,"12/5/2014","ACCOUNT");
INSERT INTO WORKER VALUES (8,"GEETIKA","CHAUHAN",900000,"1/2/2014","ADMIN");

/* Q-1 Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME 
Ascending and DEPARTMENT Descending. */

select * from worker order by worker_name asc ;
select * from worker order by  department desc ;

/* Q-2 Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” 
from the Worker table. */

select * from worker where worker_name = "vipul"  or  worker_name = "satish" ;

/* Q-3 Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and 
contains six alphabets */

select * from worker where  worker_name  like '_%_%_%_%_h%' ;

/* Q-4 Write an SQL query to print details of the Workers whose SALARY lies between 1. */

select * from worker where worker_salary   between 0 and 100000 ;

/* Q-5 Write an SQL query to fetch duplicate records having matching data in some fields of a table. */




/* Q-6 Write an SQL query to show the top 6 records of a table.  */

select * from worker limit 6 ;

/* Q-7 Write an SQL query to fetch the departments that have less than five people in them. */

select count (worker_id ),department from worker  group by department having count (worker_id) < 5 ;

/* Q-8 Write an SQL query to sh ow all departments along with the number of people in there. */

select count(WORKER_ID) , DEPARTMENT from worker group by DEPARTMENT having count(WORKER_ID) ;

/* Q-9 Write an SQL query to print the name of employees having the highest salary in each 
department. */

select  max(worker_salary) from worker ;


