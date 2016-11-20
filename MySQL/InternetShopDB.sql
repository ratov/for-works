
								/*InternetShopDB*/
CREATE DATABASE InternetShopDB;

use InternetShopDB;

CREATE TABLE IF NOT EXISTS Customers (
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FName VARCHAR(20),
	MName VARCHAR(20),
	LName VARCHAR(20),
	Address VARCHAR(50),
	City VARCHAR(20),
	Phone char(12),
	DateInSystem TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
/*Меняем таблицу Customers (если надо)*/
ALTER TABLE Customers ADD PRIMARY KEY(ID)

CREATE TABLE IF NOT EXISTS Employees (
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FName VARCHAR(20) NOT NULL,
	MName VARCHAR(20),
	LName VARCHAR(20) NOT NULL,
	Post VARCHAR(25) NOT NULL,
	Salary FLOAT NOT NULL,
	PriorSalary FLOAT
);

CREATE TABLE IF NOT EXISTS EmployeesInfo (
	ID INT NOT NULL,
	MaritalStatus VARCHAR(20) NOT NULL,
	BirthDate date NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone char(12) NOT NULL
);
/*Меняем таблицу EmployeesInfo (если надо)*/
ALTER TABLE EmployeesInfo ADD UNIQUE(ID);
/*Меняем таблицу EmployeesInfo и связываем ее
  с таблицей Employees по внешнему ключу
*/
ALTER TABLE EmployeesInfo ADD FOREIGN KEY (ID) REFERENCES Employees(ID)
ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS Products (
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL
);				
		
CREATE TABLE IF NOT EXISTS ProductDetails (
	ID INT NOT NULL,
	Color CHAR(20),
	Description CHAR(255) NULL
);
/*Меняем таблицу ProductDetails (если надо)*/
ALTER TABLE ProductDetails ADD UNIQUE(ID);
/*
	Соединяем таблицы Products и ProductDetails
*/
ALTER TABLE ProductDetails ADD
FOREIGN KEY (ID) REFERENCES Products(ID)
ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS Stocks (
	ProductIT INT NOT NULL,
	Qty INT DEFAULT 0
);
/*В таблицы Stocks изменил поле ProductIT на ProductID*/
ALTER TABLE Stocks CHANGE ProductIT ProductID INT NOT NULL;
-----------------------------------------------------------
ALTER TABLE Stocks ADD UNIQUE(ProductID);
ALTER TABLE Stocks ADD FOREIGN KEY(ProductID)
REFERENCES Products(ID) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS OrderDetails (
	OrderID INT NOT NULL,
	LineItem INT NOT NULL,
	ProductID INT NULL,
	Qty INT NOT NULL,
	Price float NOT NULL,
	TotalPrice float
);

CREATE TABLE IF NOT EXISTS Orders (
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	CustomerID INT,
	EmployeeID INT,
	OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
/*
	Меняем таблицу Orders
*/
ALTER TABLE Orders ADD PRIMARY KEY (ID);

/*
	Связываем таблицу Orders с таблицей Customers
*/
ALTER TABLE Orders ADD FOREIGN KEY(CustomerID) REFERENCES Customers(ID)
ON DELETE SET NULL;

/*
	Связываем таблицу EmployeeID с родительской таблицей Employees
*/
ALTER TABLE Orders ADD FOREIGN KEY(EmployeeID) REFERENCES Employees(ID)
ON DELETE SET NULL;

ALTER TABLE OrderDetails ADD PRIMARY KEY (OrderId, LineItem);

ALTER TABLE OrderDetails ADD FOREIGN KEY(OrderId)
REFERENCES Orders(ID) ON DELETE CASCADE;

ALTER TABLE OrderDetails ADD FOREIGN KEY(ProductID)
REFERENCES Products(ID) ON DELETE SET NULL;


/*
	Создать ограничение на корректность ввода номера телефона
*/
ALTER TABLE Customers ADD
CHECK (Phone LIKE '([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

ALTER TABLE EmployeesInfo ADD
CHECK (Phone LIKE '([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

ALTER TABLE EmployeesInfo ADD
CHECK (BirthDate BETWEEN DATEADD(YEAR, -50, GETDATE()) AND DATEADD(YEAR, -18, GETDATE());