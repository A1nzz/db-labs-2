-- Таблица "Users"
CREATE TABLE Dev.Users (
    ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Email VARCHAR2(100)
);

-- Таблица "Orders"
CREATE TABLE Dev.Orders (
    ID NUMBER PRIMARY KEY,
    User_ID NUMBER,
    Order_Date DATE,
    Total_Price NUMBER,
    CONSTRAINT fk_orders_users FOREIGN KEY (User_ID) REFERENCES Dev.Users(ID)
);

-- Таблица "Products"
CREATE TABLE Dev.Products (
    ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Price NUMBER
);