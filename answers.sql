-- Question 1 Achieving 1NF (First Normal Form) 

-- creating a table in 1NF structure:
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Inserting data into the new table where each product is listed on a separate row:
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- The ProductDetail_1NF table now follows 1NF because each row represents a single product for an order.

-- Question 2 Achieving 2NF (Second Normal Form) 🧩
-- The given OrderDetails table is in 1NF but violates 2NF due to partial dependencies (CustomerName depends on OrderID).
-- To transform it into 2NF, we need to remove partial dependencies by creating separate tables.

-- Creating a table for Orders:
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Creating a table for OrderItems (Products and Quantities):
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Inserting data into the Orders table:
INSERT INTO Orders (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Inserting data into the OrderItems table:
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

--  the OrderDetails table has been split into two tables:
-- The Orders table contains OrderID and CustomerName (no partial dependencies).
-- The OrderItems table contains the OrderID, Product, and Quantity, with a composite primary key (OrderID, Product).
-- This transformation ensures that non-key attributes (CustomerName) depend on the whole primary key, fulfilling 2NF.
