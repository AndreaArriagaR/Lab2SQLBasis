-- 1. A list of the distinct countries where customers are located, sorted alphabetically

SELECT DISTINCT Country FROM Customers ORDER BY Country ASC;


-- 2. The NUMBER of distinct countries where customers are located

SELECT COUNT(DISTINCT Country) AS NumCountries FROM Customers;


-- 3. The NUMBER of orders that have been made by the customer with id 'FRANK'

SELECT COUNT(OrderID) AS NumOrders FROM Orders WHERE CustomerID = "FRANK";


-- 4. The id and name of products that are NOT discontinued but ARE out of stock

SELECT ProductID, ProductName FROM Products WHERE UnitsInStock=0 AND Discontinued=0;


-- 5. The id, name, units in stock, and units on order of products that are
--    NOT discontinued, and: either not in stock or have more units on order than are in stock 

SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder FROM Products WHERE Discontinued=0 AND (UnitsInStock=0 OR UnitsOnOrder>UnitsInStock);


-- 6. A list of DISTINCT ids of customers who made orders in December
SELECT * FROM Orders;
SELECT DISTINCT CustomerID FROM Orders WHERE (OrderDate BETWEEN '1996-12-01 00:00:00.000' AND '1996-12-31 23:59:59.999') OR (OrderDate BETWEEN '1997-12-01 00:00:00.000' AND '1997-12-31 23:59:59.999');


-- 7. The company, name, title, and phone number of North American customers

SELECT CompanyName, ContactName, ContactTitle, Phone FROM Customers WHERE Country='Canada' OR Country='USA' OR Country='Mexico';


-- 8. The name of companies with NO fax number

SELECT CompanyName FROM Customers WHERE Fax IS NULL;


-- 9. The id, name, and unit price of the 5 most expensive products.
--    The unit price must be displayed with the heading 'Price',
--    it must show and dollar sign, and be rounded to the nearest dollar.

SELECT ProductID, ProductName, '$' || ROUND(UnitPrice) AS Price FROM Products ORDER BY UnitPrice DESC limit 5;


-- 10. Using a single statement, insert at least two new Categories with no pictures

INSERT INTO Categories (CategoryName, Description) VALUES ('Liquors', 'Alcoholic beverages or fermented drinks.');
INSERT INTO Categories (CategoryName, Description) VALUES ('Vegetables', 'Fresh vegetables.');


-- 11. Make an update to one of the categories you inserted above

UPDATE Categories SET CategoryName = 'Fruits and vegetables' WHERE CategoryName = 'Vegetables';


-- 12. In a single statement, delete all (and only) the categories you inserted above
SELECT * FROM Categories;
DELETE FROM Categories WHERE CategoryID = 9 OR CategoryID = 10;
