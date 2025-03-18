CREATE DATABASE ConstructionMaterialsDB

CREATE TABLE Categories(
[categorie_id] INT PRIMARY KEY IDENTITY(1,1),
[name] VARCHAR(100) UNIQUE
);

CREATE TABLE Products(
[product_id] INT PRIMARY KEY IDENTITY(1,1),
[name] VARCHAR(100) UNIQUE,
[price] DECIMAL(10,2),
[categorie_id] INT FOREIGN KEY REFERENCES Categories([categorie_id])
);

CREATE TABLE Suppliers(
[supplier_id] INT PRIMARY KEY IDENTITY(1,1),
[name] VARCHAR(100) UNIQUE,
[contact_info] VARCHAR(200)
);

CREATE TABLE Customers(
[customer_id] INT PRIMARY KEY IDENTITY(1,1),
[name] VARCHAR(100),
[phone] VARCHAR(20) UNIQUE
);

CREATE TABLE Orders(
[order_id] INT PRIMARY KEY IDENTITY(1,1),
[customer_id] INT FOREIGN KEY REFERENCES Customers([customer_id]),
[order_date] DATETIME,
[total_price] DECIMAL(10,2)
);

CREATE TABLE OrderDetails(
[orderDetail_id] INT PRIMARY KEY IDENTITY(1,1),
[order_id] INT FOREIGN KEY REFERENCES Orders([order_id]),
[product_id] INT FOREIGN KEY REFERENCES Products([product_id]),
[quantity] INT
);

CREATE TABLE SupplierProducts(
[supplierProduct_id] INT PRIMARY KEY IDENTITY(1,1),
[supplier_id] INT FOREIGN KEY REFERENCES Suppliers([supplier_id]),
[product_id] INT FOREIGN KEY REFERENCES Products([product_id]),
[supply_price] DECIMAL(10,2)
);

CREATE TABLE Employees(
[employee_id] INT PRIMARY KEY IDENTITY(1,1),
[name] VARCHAR(100),
[posotion] VARCHAR(50)
);

INSERT INTO Categories (name) VALUES (N'Бои и лакове'), (N'Цимент и лепила'), (N'Инструменти');

INSERT INTO Products (name, price, categorie_id) VALUES (N'Бяла боя', 12.50, 1), (N'Цимент 25кг', 9.80, 2), (N'Чук 500г', 15.00, 3);

INSERT INTO Suppliers (name, contact_info) VALUES (N'Строител ООД', N'ул. Индустриална 5, София'), (N'БГ Материали', N'бул. България 12, Пловдив');

INSERT INTO Customers (name, phone) VALUES (N'Иван Петров', N'0888123456'), (N'Мария Иванова', N'0899765432');

INSERT INTO Orders (customer_id, order_date, total_price) VALUES (1, '2025-03-16 10:30:00', 22.30), (2, '2025-03-16 11:45:00', 15.00);

INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (1, 1, 1), (1, 2, 1), (2, 3, 1);

INSERT INTO SupplierProducts (supplier_id, product_id, supply_price) VALUES (1, 1, 10.00), (2, 2, 8.50);

INSERT INTO Employees (name, posotion) VALUES (N'Георги Димитров', N'Касиер'), (N'Петър Николов', N'Управител');