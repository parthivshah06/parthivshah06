CREATE DATABASE HR ;
USE HR ;

SELECT * FROM  EMPLOYEES2 ;

/*1. Display all information in the tables EMP and DEPT*/

SELECT * FROM  EMPLOYEES2 ;

/*2. Display only the hire date and employee name for each employee.*/

SELECT  HIRE_DATE , FIRST_NAME   FROM  EMPLOYEES2 ;

/*3. Display the ename concatenated with the job ID, separated by a comma and space, and 
name the column Employee and Title*/

 SELECT FIRST_NAME ||  '  , '   ||  JOB_ID FROM  EMPLOYEES2 ;
 
/* 4. Display the hire date, name and department number for all clerks*/

SELECT HIRE_DATE ,FIRST_NAME  ,DEPARTMENT_NO FROM EMPLOYEES2 ;

/* 5. Create a query to display all the data from the EMP table. Separate each column by a 
comma. Name the column THE OUTPUT */

SELECT EMPLOYEE_ID ||  ' , '  ||  FIRST_NAME ||  '  , '  ||  JOB_ID  ||  '  ,  '  || LAST_NAME ||  '  ,  ' || SALARY || DEPARTMENT_ID
AS "OUTPUT"   FROM  EMPLOYEES2 ;

/*6. Display the names and salaries of all employees with a salary greater than 2000*/

SELECT FIRST_NAME , SALARY FROM EMPLOYEES2 where SALARY > 2000 ;

/*7. Display the names and dates of employees with the column headers "Name" and "Start 
DatE*/

SELECT  FIRST_NAME , HIRE_DATE FROM  EMPLOYEES2 ;

/*8. Display the names and hire dates of all employees in the order they were hired.*/

SELECT FIRST_NAME,  HIRE_DATE  FROM   EMPLOYEES2  ORDER BY HIRE_DATE ;


/*9. Display the names and salaries of all employees in reverse salary order.*/

SELECT FIRST_NAME ,  SALARY FROM EMPLOYEES2  ORDER BY reverse(SALARY )  ;

/*10. Display 'ename" and "deptno" who are all earned commission and display salary in 
reverse order.*/

SELECT FIRST_NAME , DEPARTMENT_NO  FROM  EMPLOYEES2  order by reverse(SALARY)  ;

/*11. Display the last name and job title of all employees who do not have a manager*/

SELECT FIRST_NAME , JOB_ID FROM EMPLOYEES2 ;

/*12. Display the last name, job, and salary for all employees whose job is sales representative 
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000*/

SELECT LAST_NAME ,JOB_ID,SALARY FROM EMPLOYEES2 where (JOB_ID= 'SH_CLERK' OR JOB_ID = 'AC_ACCOUNT')
AND SALARY NOT IN (2500,3500,5000) ;

/* PART 2 */

/* 13) Display the maximum, minimum and average salary and commission earned. */ 

SELECT max(SALARY)  FROM EMPLOYEES2 ;
SELECT  min(SALARY) FROM EMPLOYEES2;
SELECT   AVG (SALARY )  FROM EMPLOYEES2;


/* 14) Display the department number, total salary payout and total commission payout for 
each department. */

SELECT DEPARTMENT_NO,SALARY,COMMISSION_PCT FROM EMPLOYEES2 ;

/*15) Display the department number and number of employees in each department. */

select DEPARTMENT_ID , count(EMPLOYEE_ID) as num_employees from  EMPLOYEES2 group by DEPARTMENT_ID ;


/*16 ) Display the department number and total salary of employees in each department.*/

SELECT  DEPARTMENT_NO , SALARY FROM  EMPLOYEES2 ;

/* 17) Display the employees name, department id and commission. If an Employee doesn't 
earn the commission, then display as 'No commission'. Name the columns appropriately*/

SELECT 
    FIRST_NAME AS "Employee Name",
    DEPARTMENT_ID AS "Department ID",
    CASE
        WHEN COMMISSION_PCT IS  NOT NULL THEN COMMISSION_PCT
        ELSE '  NOcommission'
        END AS "Commission"
         FROM EMPLOYEES2 ;
         
         
 /*18) Display the employee's name who doesn't earn a commission. Order the result set 
without using the column name */

SELECT * FROM EMPLOYEES2  where DEPARTMENT_ID  IS NULL ORDER  BY 1 ;
	

				/*19)		) Display the employee's name, salary and commission multiplied by 2. If an Employee 
				doesn't earn the commission, then display as 'No commission. Name the columns 
				appropriately	 */

  SELECT
    FIRST_NAME AS Employee_Name,
    Salary AS Employee_Salary,
    CASE
        WHEN COMMISSION_PCT IS NULL THEN 'No commission'
        ELSE COMMISSION_PCT
    END AS COMMISSION_PCT
    FROM employees2 ;
    
    
  /*  20) Display the employee's name, department id who have the first name same as another 
employee in the same department */
select  FIRST_NAME,DEPARTMENT_ID from EMPLOYEES2

where FIRST_NAME = FIRST_NAME 
and EMPLOYEE_ID != EMPLOYEE_ID 
order by DEPARTMENT_ID , FIRST_NAME ;



    
/*21) Display the sum of salaries of the employees working under each Manager*/

select MANAGER_ID  , SUM(SALARY )  FROM EMPLOYEES2 group by MANAGER_ID ;


/*22) Select the Managers name, the count of employees working under and the department 
ID of the manager.*/

SELECT  MANAGER_ID , COUNT (EMPLOYEE_ID) AS  EMP_COUNT , DEPARTMENT_ID FROM EMPLOYEES2 
 group by  MANAGER_ID,  DEPARTMENT_ID ;



/*23) Select the employee name, department id, and the salary. Group the result with the 
manager name and the employee last name should have second letter 'a! */






/*24) Display the average of sum of the salaries and group the result with the department id. 
Order the result with the department id */



/*25) Select the maximum salary of each department along with the department id*/

select  DEPARTMENT_ID , max (SALARY)  AS MAX_SALARY FROM EMPLOYEES2 group by DEPARTMENT_ID ;



/*26)Display the commission, if not null display 10% of salary, if null display a default value 1*/
select  EMPLOYEE_ID, 
case 
when COMMISSION_PCT is not null  then salary * 0.10
  ELSE 1 
  END AS COMMISSION_RESULT FROM EMPLOYEES2 order by EMPLOYEE_ID ;
  



/*PART 3 */
 
	/*(27). Write a query that displays the employee's last names only from the string's 2-5th 
position with the first letter capitalized and all other letters lowercase, Give each column an 
appropriate label. */

SELECT
    CONCAT(
        UPPER(SUBSTRING(LAST_NAME, 2, 1)),
        LOWER(SUBSTRING(LAST_NAME, 3, 1)),
        LOWER(SUBSTRING(LAST_NAME, 4, 1)),
        LOWER(SUBSTRING(LAST_NAME, 5, 1))
    ) AS Employee_Last_Name
FROM  employees2 ;

/*28). Write a query that displays the employee's first name and last name along with a " in 
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
month on which the employee has joined.*/


select concat (FIRST_NAME ,LAST_NAME  )  , (HIRE_DATE)   from employees2 ;


/*29). Write a query to display the employee's last name and if half of the salary is greater than 
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
1500 each. Provide each column an appropriate label.*/

SELECT
    LAST_NAME ,
    CASE
        WHEN SALARY * 0.5 > 10000 THEN SALARY * 1.1
        ELSE SALARY * 1.115
    END AS "New Salary",
    1500 AS "Bonus Amount"
FROM employees2 ;

/*30. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
department id, salary and the manager name all in Upper case, if the Manager name 
consists of 'z' replace it with '$!*/

SELECT 
    CONCAT(
        SUBSTRING(EMPLOYEE_ID, 1, 2), 
        '00',                          
        SUBSTRING(EMPLOYEE_ID, 3),     
        'E'                           
    ) AS modified_employee_id,
    UPPER(DEPARTMENT_ID) AS modified_department_id,
    SALARY,
    REPLACE(UPPER(FIRST_NAME), 'Z', '$!') AS modified_manager_name
FROM  employees2 ;

/*31. Write a query that displays the employee's last names with the first letter capitalized and 
all other letters lowercase, and the length of the names, for all employees whose name 
starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
employees' last names*/

SELECT 
    CONCAT(
        UPPER(LEFT(LAST_NAME, 1)), 
        LOWER(SUBSTRING(LAST_NAME, 2))
    ) AS "Employee Name",
    LENGTH(LAST_NAME) AS "Name Length"
FROM   employees2 
WHERE 
    last_name LIKE 'J%' OR
    last_name LIKE 'A%' OR
    last_name LIKE 'M%' 
ORDER BY 
    last_name  ;
    
/*32. Create a query to display the last name and salary for all employees. Format the salary to 
be 15 characters long, left-padded with $. Label the column SALARY*/

SELECT
    last_name ,
    LPAD(CONCAT('$', salary), 15, '$') AS "SALARY"
FROM  employees2 ;

/*33) Display the employee's name if it is a palindrome*/

SELECT FIRST_NAME
FROM employees2 
WHERE FIRST_NAME = REVERSE(FIRST_NAME);

/*34). Display First names of all employees with initcaps. */

SELECT CONCAT(UPPER(SUBSTRING(FIRST_NAME, 1, 1)), LOWER(SUBSTRING(FIRST_NAME, 2))) AS initcaps_first_name
FROM employees2 ;
    
/* 35) : Display the names of all employees except the lowest paid.*/   
SELECT FIRST_NAME,SALARY
FROM employees2 
WHERE SALARY > (
  SELECT MIN(SALARY)
  FROM employees2 );

/*36. Display the name of the employee whose salary is the lowest.*/

SELECT FIRST_NAME,SALARY  FROM employees2   ORDER BY SALARY  LIMIT 1;

/*.37) Display the names and department name of all employees working in the same city as 
Trenna. */


/*  38) 1. Display the names and job titles of all employees with the same job as Trenna.*/
SELECT FIRST_NAME, JOB_ID
FROM employees2 
WHERE JOB_ID = (SELECT JOB_ID FROM employees2  WHERE FIRST_NAME ='Donald' );

/*39  0. Extract first letter from First Name column and append it with the Last Name. Also add 
"@systechusa.com" at the end. Name the column as e-mail address. All characters should 
be in lower case. Display this along with their First Name. */

SELECT
    CONCAT(
        LOWER(LEFT(FIRST_NAME, 1)), 
        LOWER(LAST_NAME),
        '@systechusa.com'
    ) AS 'e-mail address' ,
    FIRST_NAME
FROM  employees2 ;



/*part 4 */

/*1. Write a query to display the last name, department number, department name for all 
employees.*/

select LAST_NAME, DEPARTMENT_ID  ,DEPARTMENT_NAME  from employees2 ;

/*2. Create a unique list of all jobs that are in department 4. Include the location of the 
department in the output.*/

select  distinct DEPARTMENT_ID,DEPARTMENT_NAME from employees2 ;