--Assignment – SQL Queries
create database Intel_Assgn
use Intel_Assgn
CREATE TABLE studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
INSERT INTO studies values
('ANAND','SABHARI','PGDCA',4500 ),
('ALTAF','COIT','DCA',7200 ),
('JULIANA','BDPS','MCA',22000 ),
('KAMALA','PRAGATHI','DCA',5000 ),
('MARY','SABHARI','PGDCA ',4500 ),
('NELSON','PRAGATHI','DAP',6200 ),
('PATRICK','PRAGATHI','DCAP',5200 ),
('QADIR','APPLE','HDCA',14000 ),
('RAMESH','SABHARI','PGDCA',4500 ),
('REBECCA','BRILLIANT','DCAP',11000 ),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000 ),
('VIJAYA','BDPS','DCA',48000);
CREATE TABLE software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2), DCOST int, SOLD int)
SELECT * FROM software
INSERT INTO software values
('MARY','README','CPP',300, 1200, 84), 
('ANAND','PARACHUTES','BASIC',399.95, 6000, 43 ),
('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 ),
('JULIANA','INVENTORY','COBOL',3000, 3500, 0 ),
('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
('MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4), 
('MARY','CODE GENERATOR','C',4500, 20000, 23),
('PATTRICK','README','CPP',300, 1200, 84),
('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 ),
('QADIR','VACCINES','C',1900, 3100, 21 ),
('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4),
('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
('REMITHA','PC UTILITIES','C',725, 5000, 51 ),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
('VIJAYA','TSR EDITOR','C',900, 700, 6);
CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)
insert into programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 ),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 ),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 ),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 ),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 ),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 ),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 ),
( 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 ),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 ),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 ),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 ),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 ),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);

SELECT * FROM programmer
SELECT * FROM studies
SELECT * FROM software
SELECT * FROM programmer
--1. Find out the selling cost AVG for packages developed in Pascal. 
SELECT AVG(SCOST) AS 'AVERAGE selling cost'FROM software  WHERE DEVELOPIN ='PASCAL';
 
--2. Display Names, Ages of all Programmers. 
SELECT PNAME AS NAMES, DATEDIFF(YEAR,DOB,GETDATE()) AS AGES FROM programmer
 

--3. Display the Names of those who have done the DAP Course. 
SELECT PNAME AS NAMES,COURSE FROM studies where COURSE = 'DAP';
 
--4. Display the Names and Date of Births of all Programmers Born in January. 
select PNAME AS  NAMES,DOB FROM programmer where month(DOB)=1
 
--5. What is the Highest Number of copies sold by a Package? 
select max(SOLD) AS 'Highest no of copies' from software
 

--6. Display lowest course Fee. 
Select min(COURSE_FEE) from studies
  

--7. How many programmers done the PGDCA Course? 
SELECT COUNT(PNAME) FROM STUDIES WHERE COURSE='PGDCA';
 
--8. How much revenue has been earned thru sales of Packages Developed in C.

select sum(SCOST*sold) as Revenue from software where DEVELOPIN = 'c';
 
--9. Display the Details of the Software Developed by Ramesh. 
select * from software where PNAME='RAMESH'
 
--10. How many Programmers Studied at Sabhari? 
SELECT COUNT(*) FROM studies where INSTITUTE='SABHARI'
 
--11. Display details of Packages whose sales crossed the 2000 Mark. 
select TITLE , SUM(SCOST*SOLD) AS revenue from software group by TITLE HAVING SUM(SCOST*SOLD) >=2000
 
--12. Display the Details of Packages for which Development Cost have been recovered. 
SELECT * FROM SOFTWARE WHERE (SCOST*SOLD )>DCOST
 
--13. What is the cost of the costliest software development in Basic? 
SELECT MAX(DCOST) FROM SOFTWARE WHERE DEVELOPIN='BASIC'
 
---14. How many Packages Developed in DBASE?
SELECT COUNT(1) FROM SOFTWARE WHERE DEVELOPIN='DBASE'
 
--15. How many programmers studied in Pragathi? 
SELECT COUNT(*) FROM STUDIES WHERE INSTITUTE='PRAGATHI'
 

--16. How many Programmers Paid 5000 to 10000 for their course? 
SELECT COUNT(*) FROM STUDIES WHERE COURSE_FEE BETWEEN 5000 AND 10000
 
--17. What is AVG Course Fee 
SELECT AVG(COURSE_FEE) AS COURSE_FEE FROM studies
 

--18. Display the details of the Programmers Knowing C.
SELECT * FROM programmer WHERE PROF1 ='C' OR PROF2 = 'C'
 
--19. How many Programmer s know either COBOL or PASCAL. 
SELECT COUNT(*) FROM programmer WHERE  PROF1 = 'COBOL' OR PROF1='PASCAL' OR PROF2 =  'COBOL'OR  PROF2='PASCAL'
  
--20. How many Programmers Don’t know PASCAL and C 
SELECT COUNT(*) FROM programmer WHERE  PROF1 != 'C' AND PROF1 != 'PASCAL' AND PROF2 !=  'C'AND  PROF2 !='PASCAL'
 
--21. How old is the Oldest Male Programmer. 
SELECT MAX(DATEDIFF(YY,DOB,GETDATE())) AS AGE FROM programmer
 
--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order
SELECT PNAME,DATEDIFF(YY,DOJ,GETDATE()) AS  EXPERIENCE  FROM programmer ORDER BY PNAME DESC
 
--24. Who are the Programmers who celebrate their Birthday’s During the CurrentMonth? 
SELECT PNAME, MONTH(DOB) FROM programmer WHERE MONTH(DOB)=MONTH(GETDATE())
 
--25. How many Female Programmers are there? 
SELECT COUNT(GENDER) FROM programmer where GENDER ='F'
 
--26. What are the Languages studied by Male Programmers. 
select PNAME,PROF1,PROF2 from programmer where GENDER='M'
 
--27. What is the AVG Salary? 
select AVG(SALARY) FROM programmer
 
--28. How many people draw salary 2000 to 4000? 
select * from programmer where SALARY>=2000 and SALARY<=4000
 
--29. Display the details of those who don’t know Clipper, COBOL or PASCAL. 
select * from programmer where PROF1!='CLIPPER' AND PROF1!='COBOL' AND PROF1!='PASCAL'  AND 
PROF2!='CLIPPER' AND PROF2!='COBOL' AND PROF2!='PASCAL';
 
--30. Display the Cost of Package Developed By each Programmer. 
SELECT PNAME, (DCOST*SOLD) AS 'COST OF PACKAGE' FROM software
 
--31. Display the sales values of the Packages Developed by the each Programmer. 

SELECT PNAME, (SCOST*SOLD) AS 'COST OF PACKAGE' FROM software
 
--32. Display the Number of Packages sold by Each Programmer. 
SELECT COUNT(TITLE) FROM software
 
--33. Display the sales cost of the packages Developed by each Programmer Language wise. 
SELECT  SCOST,DEVELOPIN FROM SOFTWARE 
 
--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy. 
SELECT DEVELOPIN, AVG(DCOST) AS 'AVG Development Cost',AVG(SCOST) AS 'AVG Selling Cost',AVG(SOLD) AS 'AVG Price per Copy'FROM software GROUP BY DEVELOPIN;
 
--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 
SELECT PNAME,MAX(DCOST) AS costliest,MIN(DCOST) AS cheapest FROM software GROUP BY PNAME;
 
--36. Display each institute name with number of Courses, Average Cost per Course. 
select institute, count(course) as 'no of course',avg(COURSE_FEE) as 'Average Cost per Course'from studies group by INSTITUTE
 
--37. Display each institute Name with Number of Students. 
select institute, count(PNAME) as 'NUMBER OF STUDENT' from studies group by INSTITUTE
 
--38. Display Names of Male and Female Programmers. Gender also. 
SELECT PNAME,GENDER FROM programmer
 

--39. Display the Name of Programmers and Their Packages. 
SELECT PNAME AS NAME,SALARY*12 AS PACKAGES  FROM programmer
 
--40. Display the Number of Packages in Each Language Except C and C++. 
SELECT COUNT(SALARY*12) AS 'Number of Packages' FROM programmer 
where PROF1 != 'c' or PROF1 !='c++' and PROF2!='c' or PROF2!='c++';

 

--41. Display the Number of Packages in Each Language for which Development Cost isless than 1000.
SELECt pname AS 'Number of Packages',developin,dcost FROM software where dcost<= 1000;
					or
SELECt count (pname) AS 'Number of Packages' FROM software where dcost<= 1000;
 



