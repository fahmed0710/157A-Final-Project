CREATE TABLE ADDRESS(
	ADDRESS_ID INT PRIMARY KEY NOT NULL,
	STREET VARCHAR(100),
	CITY VARCHAR(50),
	STATE VARCHAR(50),
	ZIP_CODE VARCHAR(10)
);

CREATE TABLE CUSTOMER (
	CUSTOMER_ID INT PRIMARY KEY NOT NULL,
	EMPLOYEE_ID INT NOT NULL,
	FIRST_NAME VARCHAR(50),
	LAST_NAME VARCHAR(50),
	SSN VARCHAR(12) NOT NULL,
	ADDRESS_ID INT NOT NULL, 
	EMAIL_ADDRESS VARCHAR(100),
	PHONE_NUMBER VARCHAR(12),
	FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID)
);

CREATE TABLE CHECKING_ACCOUNT(
	ACCOUNT_NUMBER INT PRIMARY KEY NOT NULL,
	CUSTOMER_ID INT NOT NULL,
	ROUTING_NUMBER INT NOT NULL,
	BALANCE DECIMAL(10, 2) NOT NULL,
	WITHDRAWAL_LIMIT DECIMAL(10, 2),
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
	CONSTRAINT CHECK_BALANCE CHECK (BALANCE >= 0)
);

CREATE TABLE SAVINGS_ACCOUNT(
	ACCOUNT_NUMBER INT PRIMARY KEY NOT NULL,
	CUSTOMER_ID INT NOT NULL,
	ROUTING_NUMBER INT NOT NULL,
	BALANCE DECIMAL(10, 2) NOT NULL,
	MINIMUM_BALANCE DECIMAL(10, 2),
	INTEREST_RATE DECIMAL(5, 2),
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);

CREATE TABLE EMPLOYEE (
	EMPLOYEE_ID INT PRIMARY KEY NOT NULL,
	FIRST_NAME VARCHAR(50),
	LAST_NAME VARCHAR(50),
	ROLE VARCHAR(20),
	FOREIGN KEY (ROLE) REFERENCES ROLE_SALARY(ROLE)
);

CREATE TABLE ROLE_SALARY (
	ROLE VARCHAR(20) PRIMARY KEY NOT NULL,
	SALARY  INT
);

CREATE TABLE CREDIT_CARD (
	CREDIT_CARD_NUMBER INT PRIMARY KEY NOT NULL,
	CUSTOMER_ID INT NOT NULL,
	CVC VARCHAR(4) NOT NULL,
	EXPIRATION_DATE DATE NOT NULL,
	BALANCE DECIMAL(10, 2) NOT NULL,
	SPENDING_LIMIT DECIMAL(10, 2),
	INTEREST_RATE DECIMAL(5, 2),
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);

CREATE TABLE TRANSACTION_HISTORY(
	TRANSACTION_ID INT PRIMARY KEY,
	ACCOUNT_NUMBER INT NOT NULL,
	CUSTOMER_ID INT NOT NULL,
	TRANSACTION_AMOUNT DECIMAL(10, 2) NOT NULL,
	TRANSACTION_DATE DATE NOT NULL,
	DEPOSIT_LIMIT INT,
	WITHDRAWAL_LIMIT INT,
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);

CREATE TABLE LOANS (
	LOAN_NUMBER INT PRIMARY KEY NOT NULL,
	CUSTOMER_ID INT,
	LOAN_AMOUNT DECIMAL(10, 2),
	PAYMENT_REMAINING DECIMAL(10, 2),
	MONTHLY_PAYMENT_AMOUNT DECIMAL(10, 2),
	INTEREST_RATE DECIMAL(5, 2),
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);

/*
	Insert data into the tables
*/

INSERT INTO ADDRESS(ADDRESS_ID, STREET, CITY, STATE, ZIP_CODE) 
	VALUES(1111, '495 Town Center', 'Columbia', 'South Carolina', '29229');
INSERT INTO CUSTOMER(CUSTOMER_ID, FIRST_NAME, LAST_NAME, SSN, ADDRESS_ID, EMAIL_ADDRESS, PHONE_NUMBER)
	VALUES(1, 'Harley', 'Marks', '219-89-1901', 1111, 'harleymarks@gmail.com', '803-462-6722');
INSERT INTO CHECKING_ACCOUNT(ACCOUNT_NUMBER, CUSTOMER_ID, ROUTING_NUMBER, BALANCE, WITHDRAWAL_LIMIT)
	VALUES(57665350, 1, 137683604, 1207.53, 300.00);	
INSERT INTO SAVINGS_ACCOUNT(ACCOUNT_NUMBER, CUSTOMER_ID, ROUTING_NUMBER, BALANCE, MINIMUM_BALANCE, INTEREST_RATE)
	VALUES(80297011, 1, 446388470, 5432.10, 5.00, 0.39);	
INSERT INTO EMPLOYEE(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ROLE)
	VALUES(11, 'Harley', 'Marks', 'Teller');
INSERT INTO ROLE_SALARY(ROLE, SALARY)
	VALUES('Teller', 27000);	
INSERT INTO CREDIT_CARD(CREDIT_CARD_NUMBER, CUSTOMER_ID, CVC, EXPIRATION_DATE, BALANCE, SPENDING_LIMIT, INTEREST_RATE)
	VALUES(2149747936175722, 1, '403', '2028-11', 800.00, 2000.00, 2.5);	
INSERT INTO TRANSACTION_HISTORY(TRANSACTION_ID, ACCOUNT_NUMBER, CUSTOMER_ID, TRANSACTION_AMOUNT, TRANSACTION_DATE, DEPOSIT_LIMIT, WITHDRAWAL_LIMIT)
	VALUES(011, 57665350, 1, 6.07, '2023-05-11' ,10000, 300);	
INSERT INTO LOANS(LOAN_NUMBER, CUSTOMER_ID, LOAN_AMOUNT, PAYMENT_REMAINING, MONTHLY_PAYMENT_AMOUNT, INTEREST_RATE)
	VALUES(101, 1, 4000.00, 2200.00, 160.00, 7);
	
INSERT INTO ADDRESS(ADDRESS_ID, STREET, CITY, STATE, ZIP_CODE) 
	VALUES(2222, '242 E Hunting Park Ave', 'Philadelphia', 'Pennsylvania', '19124');
INSERT INTO CUSTOMER(CUSTOMER_ID, FIRST_NAME, LAST_NAME, SSN, ADDRESS_ID, EMAIL_ADDRESS, PHONE_NUMBER)
	VALUES(2, 'Theorn', 'Macejkovic', '575-99-9252', 2222, 'theronmac@gmail.com', '215-329-7600');
INSERT INTO CHECKING_ACCOUNT(ACCOUNT_NUMBER, CUSTOMER_ID, ROUTING_NUMBER, BALANCE, WITHDRAWAL_LIMIT)
	VALUES(00937280, 2, 043053690, 2024.53, 300.00);	
INSERT INTO SAVINGS_ACCOUNT(ACCOUNT_NUMBER, CUSTOMER_ID, ROUTING_NUMBER, BALANCE, MINIMUM_BALANCE, INTEREST_RATE)
	VALUES(46768562, 2, 746312023, 17094.38, 5.00, 0.39);	
INSERT INTO CREDIT_CARD(CREDIT_CARD_NUMBER, CUSTOMER_ID, CVC, EXPIRATION_DATE, BALANCE, SPENDING_LIMIT, INTEREST_RATE)
	VALUES(342227075085551, 2, '617', '2028-8', 459.23, 2000.00, 2.5);	
INSERT INTO TRANSACTION_HISTORY(TRANSACTION_ID, ACCOUNT_NUMBER, CUSTOMER_ID, TRANSACTION_AMOUNT, TRANSACTION_DATE, DEPOSIT_LIMIT, WITHDRAWAL_LIMIT)
	VALUES(021, 46768562, 2, 530.00, '2023-05-12', 10000, 300);	
INSERT INTO TRANSACTION_HISTORY(TRANSACTION_ID, ACCOUNT_NUMBER, CUSTOMER_ID, TRANSACTION_AMOUNT, TRANSACTION_DATE, DEPOSIT_LIMIT, WITHDRAWAL_LIMIT)
	VALUES(022, 00937280, 2, 21.76, '2023-05-11', 10000, 300);	
INSERT INTO LOANS(LOAN_NUMBER, CUSTOMER_ID, LOAN_AMOUNT, PAYMENT_REMAINING, MONTHLY_PAYMENT_AMOUNT, INTEREST_RATE)
	VALUES(201, 2, 500.00, 315.75, 30.00, 7);
	
INSERT INTO ADDRESS(ADDRESS_ID, STREET, CITY, STATE, ZIP_CODE) 
	VALUES(3333, '843 W Northern Ave', 'Pueblo', 'Colarado', '81004');
INSERT INTO CUSTOMER(CUSTOMER_ID, FIRST_NAME, LAST_NAME, SSN, ADDRESS_ID, EMAIL_ADDRESS, PHONE_NUMBER)
	VALUES(3, 'Jaden', 'Windler', '156-23-3178', 3333, 'jaden.windler@yahoo.com', '719-553-2790');
INSERT INTO CHECKING_ACCOUNT(ACCOUNT_NUMBER, CUSTOMER_ID, ROUTING_NUMBER, BALANCE, WITHDRAWAL_LIMIT)
	VALUES(20254663, 3, 843577651, 349.21, 300.00);	
INSERT INTO SAVINGS_ACCOUNT(ACCOUNT_NUMBER, CUSTOMER_ID, ROUTING_NUMBER, BALANCE, MINIMUM_BALANCE, INTEREST_RATE)
	VALUES(48227886, 3, 367137328, 2123.12, 5.00, 0.39);	
INSERT INTO EMPLOYEE(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ROLE)
	VALUES(33, 'Jaden', 'Windler', 'Janitor');
INSERT INTO ROLE_SALARY(ROLE, SALARY)
	VALUES('Janitor', 21000);	
INSERT INTO CREDIT_CARD(CREDIT_CARD_NUMBER, CUSTOMER_ID, CVC, EXPIRATION_DATE, BALANCE, SPENDING_LIMIT, INTEREST_RATE)
	VALUES(4916770390659194, 3, '569', '2028-6', 1000.00, 4000.00, 2.5);	
INSERT INTO TRANSACTION_HISTORY(TRANSACTION_ID, ACCOUNT_NUMBER, CUSTOMER_ID, TRANSACTION_AMOUNT, TRANSACTION_DATE, DEPOSIT_LIMIT, WITHDRAWAL_LIMIT)
	VALUES(031, 20254663, 3, 15.34, '2023-05-15' ,10000, 300);	
INSERT INTO TRANSACTION_HISTORY(TRANSACTION_ID, ACCOUNT_NUMBER, CUSTOMER_ID, TRANSACTION_AMOUNT, TRANSACTION_DATE, DEPOSIT_LIMIT, WITHDRAWAL_LIMIT)
	VALUES(032, 20254663, 3, 345.33, '2023-05-13' ,10000, 300);	

/*
	Sample queries
*/
SELECT * FROM TRANSACTION_HISTORY WHERE TRANSACTION_DATE='2023-05-11';
SELECT * FROM EMPLOYEE WHERE ROLE='Janitor';
SELECT * FROM CHECKING_ACCOUNT WHERE BALANCE > 100;
