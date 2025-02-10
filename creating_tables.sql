CREATE DATABASE coban ;
USE coban ;

-- Vendor Table
CREATE TABLE Vendor (
    Vendor_ID VARCHAR(8) PRIMARY KEY,
    Vendor_Name VARCHAR(255) NOT NULL,
    Commission_Rate DECIMAL(5,2) NOT NULL
);

-- Customer Table
CREATE TABLE Customer (
    Customer_ID VARCHAR(8) PRIMARY KEY,
    Age INT,
    Gender ENUM('Male', 'Female', 'Other'),
    Timespend INT
);

-- Product Table
CREATE TABLE Product (
    Product_ID VARCHAR(8) PRIMARY KEY,
    Product_Name VARCHAR(255) NOT NULL,
    Category ENUM('Electronics', 'Clothing', 'Home', 'Books', 'Toys') NOT NULL,
    Color VARCHAR(50)
);

-- ProductVendor Table
CREATE TABLE ProductVendor (
    Product_ID VARCHAR(8),
    Vendor_ID VARCHAR(8),
    Price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Product_ID, Vendor_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Vendor_ID) REFERENCES Vendor(Vendor_ID)
);

-- Order Table
CREATE TABLE `Order` (
    Order_ID VARCHAR(8) PRIMARY KEY,
    Customer_ID VARCHAR(8),
    Product_ID VARCHAR(8),
    Order_Date DATETIME NOT NULL,
    Status ENUM('Complete', 'Incomplete') NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

-- Shopping Experience Table
CREATE TABLE ShoppingExperience (
    Customer_ID VARCHAR(8),
    Product_ID VARCHAR(8),
    Rating DECIMAL(2,1),
    Timespend INT,
    PRIMARY KEY (Customer_ID, Product_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);
