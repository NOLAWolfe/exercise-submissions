--2.1 SELECT
--Task  Select all records from the Employee table.
SELECT * FROM EMPLOYEE;

--Task  Select all records from the Employee table where last name is King.
SELECT * FROM EMPLOYEE WHERE LASTNAME = 'King';

--Task  Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
SELECT * FROM EMPLOYEE WHERE (FIRSTNAME = 'Andrew') AND (REPORTSTO IS NULL);

--2.2 ORDER BY
--Task  Select all albums in Album table and sort result set in descending order by title.
SELECT * FROM ALBUM ORDER BY(TITLE) DESC;

--Task  Select first name from Customer and sort result set in ascending order by city
SELECT FIRSTNAME FROM CUSTOMER ORDER BY(CITY) ASC;

--2.3 INSERT INTO
--Task  Insert two new records into Genre table
INSERT INTO GENRE 
VALUES (26, 'Instrumental Rock');
INSERT INTO GENRE table
INSERT INTO EMPLOYEE
VALUES (9, 'Cunningham','Paul','IT Staff',6,NULL,NULL,'12345 Road St','New York','NY','USA','54321','19194201234','19194200987','paul@chinookcorp.com');
INSERT INTO EMPLOYEE
VALUES (10, 'Cunningham','Michelle','Sales Support Agent',2,NULL,NULL,'12345 Road St','New York','NY','USA','54321','19194201234','19194200987','michelle@chinookcorp.com');
--SELECT * FROM EMPLOYEE;

--Task  Insert two new records into Customer table
INSERT INTO CUSTOMER
VALUES (27, 'KPOP');
--SELECT * FROM GENRE;

--Task  Insert two new records into Employee 
VALUES(60, 'Jeanne','Yeet',NULL,'45 Lane Ave','Indianapolis','IN','USA','46062','13172345678',NULL,'jeanne@gmail.com',4);
INSERT INTO CUSTOMER
VALUES(61, 'Jon','Yote',NULL,'47 Lane Ave','Indianapolis','IN','USA','46062','13172348765',NULL,'jon@gmail.com',4);
--SELECT * FROM CUSTOMER;

--2.4 UPDATE
--Task  Update Aaron Mitchell in Customer table to Robert Walter
UPDATE CHINOOK.CUSTOMER SET FIRSTNAME = 'Robert', LASTNAME = 'Walter' WHERE FIRSTNAME = 'Aaron' AND LASTNAME = 'Mitchell';

--Task  Update name of artist in the Artist table Creedence Clearwater Revival to CCR
UPDATE CHINOOK.ARTIST SET NAME = 'CCR' WHERE NAME = 'Creedence Clearwater Revival';

--2.5 LIKE
--Task  Select all invoices with a billing address like T% 
SELECT * FROM INVOICE WHERE BILLINGADDRESS LIKE 'T%';

--2.6 BETWEEN
--Task  Select all invoices that have a total between 15 and 50
SELECT * FROM INVOICE WHERE TOTAL BETWEEN 15 AND 50;

--Task  Select all employees hired between 1st of June 2003 and 1st of March 2004
SELECT * FROM EMPLOYEE WHERE HIREDATE BETWEEN '01-JUNE-03' AND '01-MARCH-04';

--2.7 DELETE
--Task  Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
ALTER TABLE CUSTOMER
DROP CONSTRAINT FK_CUSTOMERSUPPORTREPID;
/
ALTER TABLE CUSTOMER
ADD CONSTRAINT FK_CUSTOMERSUPPORTREPID
FOREIGN KEY (SUPPORTREPID) REFERENCES EMPLOYEE(EMPLOYEEID) ON DELETE CASCADE;
/
ALTER TABLE INVOICE
DROP CONSTRAINT FK_INVOICECUSTOMERID;
/
ALTER TABLE INVOICE
ADD CONSTRAINT FK_INVOICECUSTOMERID
FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID) ON DELETE CASCADE;
/
ALTER TABLE INVOICELINE
DROP CONSTRAINT FK_INVOICELINEINVOICEID;
/
ALTER TABLE INVOICELINE
ADD CONSTRAINT FK_INVOICELINEINVOICEID
FOREIGN KEY (INVOICEID) REFERENCES INVOICE(INVOICEID) ON DELETE CASCADE;
/
DELETE
FROM CUSTOMER
WHERE FIRSTNAME = 'Robert' AND LASTNAME = 'Walter';
/
--SQL Functions
--In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
--3.1 System Defined Functions
--Task  Create a function that returns the current time.
SELECT TO_CHAR(CURRENT_DATE, 'MM-DD-YYYY HH24:MI:SS') FROM DUAL;

--Task  create a function that returns	 the length of name in MEDIATYPE table
--SELECT * FROM MEDIATYPE;
--SELECT NAME FROM MEDIATYPE
SELECT LENGTH(NAME) FROM MEDIATYPE;

--3.2 System Defined Aggregate Functions
--Task  Create a function that returns the average total of all invoices
--SELECT * FROM INVOICE;
SELECT ROUND(AVG(TOTAL),2) FROM INVOICE;

--Task  Create a function that returns the most expensive track
--SELECT MAX(UNITPRICE) FROM TRACK;
SELECT * FROM TRACK WHERE UNITPRICE = (SELECT MAX(UNITPRICE) FROM TRACK);

--3.3 User Defined Scalar Functions
--Task  Create a function that returns the average price of invoiceline items in the invoiceline table
SELECT ROUND(AVG(UNITPRICE),2) FROM INVOICELINE;

--3.4 User Defined Table Valued Functions
--Task  Create a function that returns all employees who are born after 1968.
--SELECT * FROM EMPLOYEE;
SELECT LASTNAME, FIRSTNAME FROM EMPLOYEE
WHERE BIRTHDATE > DATE '1968-12-31';

--4.0 Stored Procedures
-- In this section you will be creating and executing stored procedures. You will be creating various types of stored procedures that take input and output parameters.
--4.1 Basic Stored Procedure
--Task  Create a stored procedure that selects the first and last names of all the employees.
--4.2 Stored Procedure Input Parameters
--Task  Create a stored procedure that updates the personal information of an employee.
--Task  Create a stored procedure that returns the managers of an employee.
--4.3 Stored Procedure Output Parameters
--Task  Create a stored procedure that returns the name and company of a customer.
--
--5.0 Transactions
--In this section you will be working with transactions. Transactions are usually nested within a stored procedure.
--Task  Create a transaction that given a invoiceId will delete that invoice (There may be constraints that rely on this, find out how to resolve them).
-- 
--
--6.0 Triggers
--In this section you will create various kinds of triggers that work when certain DML statements are executed on a table.
--6.1 AFTER/FOR
--Task - Create an after insert trigger on the employee table fired after a new record is inserted into the table.
--Task  Create an after update trigger on the album table that fires after a row is inserted in the table
--Task  Create an after delete trigger on the customer table that fires after a row is deleted from the table.
--
--7.0 JOINS
--In this section you will be working with combining various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.
--7.1 INNER
--Task  Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
--7.2 OUTER
--Task  Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
--7.3 RIGHT
--Task  Create a right join that joins album and artist specifying artist name and title.
--7.4 CROSS
--Task  Create a cross join that joins album and artist and sorts by artist name in ascending order.
--7.5 SELF
--Task  Perform a self-join on the employee table, joining on the reportsto column.
--
--DUE 5pm Monday, Dec. 10
--Upload a .sql file to your branch in exercise-submissions with answers to each task clearly marked with question number and prompt. 


