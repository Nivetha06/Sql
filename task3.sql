create database products;
use products;
CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);
INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');
select *from Manufacturers;
CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
);

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);
select *from Products;

select Name from Products;

select Name,Price from Products;

select Name from Products where Price<=200;

select *from Products where Price between 60 and 120;

select Name,Price*100 from Products;

select avg(Price) from products;

select avg(Price) from Products where Manufacturer=2;

select count(*) from Products where Price>=180;

select Name,Price from Products where Price>=180 order by Price desc, Name asc ;

select p.Code,p.Name,p.Price,p.Manufacturer,m.Code,m.Name from Products p join Manufacturers m on 
		p.Code=m.Code;
        
select p.Name as Product_name,p.Price,m.Name as manufacturer_name from Products p join Manufacturers m on 
		p.Code=m.Code 
        group by m.name; 
        
select avg(p.Price),m.Code as Manufacturer_code 
		from Products p join Manufacturers m on p.Code=m.Code  group by Manufacturer;
        
select avg(Price),m.Name as Manufacturer_name 
		from Products p join Manufacturers m on p.Code=m.Code  group by Manufacturer; 
        
select m.name,avg(Price) from Manufacturers m join Products p on m.Code=p.Code 
		Having avg(Price)>=150;  
        
select Name,Price from Products order by Price limit 1;

select p.Name,p.Price from Manufacturers m join Products p 
		on m.code=p.manufacturer
        order by p.Price desc limit 1; 
        
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(11,'Loud speakers',70,2); 

update Products SET Name= "Laser Printer" where Code=8;
   
select Name,Price-0.1 from Products;   
 
select Name,Price-0.1 from Products where Price>=120;    
     




