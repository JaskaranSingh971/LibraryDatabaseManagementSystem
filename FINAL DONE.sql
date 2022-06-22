CREATE DATABASE  Library_Database3;

USE Library_Database3;

CREATE TABLE   LibraryEntryRecord
(
Person_Name VARCHAR(40) NOT NULL DEFAULT '' ,
Email VARCHAR(40) NOT NULL ,
Phone_Number CHAR(10),
TTime DATETIME NOT NULL DEFAULT (CURRENT_DATE()),
PRIMARY KEY(Email)
);

INSERT INTO LibraryEntryRecord(Person_Name,Email,Phone_Number)
VALUES('Martin','martin@gmail.com', '779617817'),
('Allisson','TheBoundlessGamer@gmail.com', '7785223678')
,('oshua Gibson','TheClumsyGamer@gmail.com', '23463345')
,('Crosby','TheUltraGamer@gmail.com', '23463345')
,('Beasley','TheLewdGamer@gmail.com', '8027120791')
,('Keshawn','kesh12@gmail.com', '4048491230'),
('Joselyn','TheUnequalGamer@gmail.com', '7048326132')
,('Griffin','griffin@gmail.com', '5019842823')
,('Lillianna','TheMereGamer@gmail.com', '6163849286')
,('Wilcox','TheHurtGamer@gmail.com', 2107710936);
CREATE TABLE     Staff(
Staff_ID  CHAR(5) ,
FirstName VARCHAR(20) NOT NULL DEFAULT '' ,
LastName VARCHAR(20) NOT NULL DEFAULT '',
Email VARCHAR(20),
street VARCHAR(25) NOT NULL DEFAULT '',
city VARCHAR(20) NOT NULL DEFAULT '',
province VARCHAR(30) NOT NULL DEFAULT '',
postcode CHAR(7) NOT NULL DEFAULT '',
pposition VARCHAR(20) NOT NULL DEFAULT '',
Date_Of_JOINing  DATE DEFAULT(CURRENT_DATE()-10000),
PRIMARY KEY(Staff_ID)
);

INSERT INTO Staff(Staff_ID,FirstName,LastName,Email,street,city,province, postcode, pposition)
VALUES('90101','Aleeza','Serena','Serena@gmail.com','12133 96A Ave','Surrey','British Columbia','V3V 7C3','Librarian'),
('90102','Aisling','Medina','Kellie@gmail.com','12152 96A Ave','Great Vancouver','British Columbia','V5H 8Y4','Head'),
('90103','Aisling','Hodgson','Mikail@gmail.com','1772 78 Ave','Delta','British Columbia','V4C 2T4','Sweeper'),
('90104','Green','Blake','Yasmeen@gmail.com','Township Road 413','Abbotsford','British Columbia','V6J 5U2','Head'),
('90105','Hadassah','Serena','Hodgson@gmail.com','7098 34 Ave','Langley','Britsh Columbia','V6D 5C8','Librarian');

CREATE TABLE Payment_History(
Payment_ID CHAR(10) NOT NULL,
Amount DECIMAL(15,2) ,
Currency  VARCHAR(20) NOT NULL DEFAULT' ' ,
Mode VARCHAR(10) NOT NULL DEFAULT '',
Transcation_ID CHAR(10) NOT NULL DEFAULT '' ,
Date_Payment_Made DATE DEFAULT(CURRENT_DATE()),
PRIMARY KEY(Payment_ID)
);


INSERT INTO Payment_History (Payment_ID,Amount,Currency,Mode,Transcation_ID)
VALUES('10101',101.20,'Dollar','Credit',2142149),
('10102',103.20,'Dollar','Credit',3423423),
('10103',301.20,'Dollar','Credit',2344234),
('10104',401.20,'Dollar','Credit',2523543),
('10105',1061.20,'Dollar','Credit',43743634);


CREATE TABLE   Registeration_Fee(
Registeration_Fee_ID  CHAR(10) NOT NULL ,
Plan_Chosen VARCHAR(20)  NOT NULL DEFAULT '',
start_Date DATE DEFAULT (CURRENT_DATE()),
End_Date DATE DEFAULT (CURRENT_DATE()+100),
Payment_ID CHAR(10) NOT NULL,
PRIMARY KEY(Registeration_Fee_ID),
FOREIGN KEY(Payment_ID) references Payment_History(Payment_ID) 
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO Registeration_Fee(Registeration_Fee_ID,Plan_Chosen,Payment_ID)
VALUES('202020','BASIC','10103'),
('202021','PREMIUM','10102'),
('202022','PREMIUM','10104'), 
('202023','BASIC','10101'),
('202024','PREMIUM','10105');
CREATE TABLE  Registered_Readers(
Reader_ID CHAR(10) ,
FirstName VARCHAR(20) NOT NULL DEFAULT '',
PhoneNumber CHAR(14) NOT NULL DEFAULT '' ,
Email VARCHAR(30) NOT NULL ,
street VARCHAR(25) NOT NULL DEFAULT '',
city VARCHAR(20) NOT NULL DEFAULT '',
province VARCHAR(30) NOT NULL DEFAULT '',
postcode CHAR(7) NOT NULL DEFAULT '',
PRIMARY KEY(Reader_ID),
Date_Of_Registering DATE DEFAULT (CURRENT_DATE()),
Staff_ID CHAR(5),
Registeration_Fee_ID  CHAR(10) NOT NULL ,
FOREIGN KEY(Email) REFERENCES LibraryEntryRecord(Email)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(Staff_ID) REFERENCES staff(staff_ID)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY(Registeration_Fee_ID) REFERENCES Registeration_Fee(Registeration_Fee_ID)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO Registered_Readers(Reader_ID,FirstName,
Email, PhoneNumber,street,city,province,postcode, Staff_ID,Registeration_Fee_ID)
VALUES
('3001' ,'Martin','martin@gmail.com', '779617817','1036 Haaglund Rd', 'Oliver','British Columbia', 'V0H 1T0','90101','202020' ),
('3002', 'Joselyn','TheUnequalGamer@gmail.com', '7048326132 ','2477 Brand Road','Kindersley','Saskatchewan','S7K 1W8','90105','202021'),
('3003', 'Griffin','griffin@gmail.com', '5019842823','4055 Robson St','Vancouver','British Columbia','V6B 3K9','90105','202022' ),
('3004', 'Lillianna','TheMereGamer@gmail.com', '6163849286','6960 Royal Oak Ave', 'Burnaby','British Columbia','V5J 4J3','90101','202023' ),
('3005', 'Wilcox','TheHurtGamer@gmail.com', '2107710936','1400 Bank St','Ottawa','Ontario','K1H 7Z1' ,'90101','202024');

Create table    Author(
Author_ID CHAR(10) NOT  NULL,
fName Varchar(20) NOT NULL DEFAULT'',
lName Varchar(20) NOT NULL DEFAULT'',
Country VARCHAR(20) NOT NULL DEFAULT '',
PRIMARY KEY(Author_ID)

);
INSERT INTO Author(Author_ID,fName,lName,Country)
VALUES('1010','James','Bond','USA'),
('1011','Chamberlain','Ford','CANADA'),
('1012','Sion', 'Herring','USA'),
('1013','Rankin','Boss','USA'),
('1014','Pitier','Ciere','CANADA'),
('1015','Tong', 'Victor', 'Germany'),
('1016','Loius','Pollastrone','USA');




Create table    Book(
ISBN_ID CHAR(10) NOT NULL ,
Author_ID CHAR(10) NOT NULL,
Book_name VARCHAR(30) NOT NULL DEFAULT '',
Publishing_date Date Default (CURRENT_DATE()-102000),
VVersion VARCHAR(30) NOT NULL DEFAULT '',
Genre VARCHAR(20) NOT NULL DEFAULT '',
LLanguage Varchar(30) NOT NULL DEFAULT '',
PRIMARY KEY(ISBN_ID),
FOREIGN KEY(Author_ID) REFERENCES author(author_ID)
ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Book(ISBN_ID,Author_ID,Book_name,Publishing_date,VVersion,Genre,LLanguage)
VALUES
('6291010','1016','Behind Door','2010-02-14','1','Comedy','English'),
('6291011','1010','The of Darkness','2002-02-14','1','Comedy','English'),
('6291012','1013','World of Yesterday','2020-02-14','1','Comedy','English'),
('6291013','1011','One Boy World','2001-02-13','1','Comedy','English'),
('6291014','1012','The Secrets O','2010-01-14','1','Comedy','English'),
('6291015','1015','Martian Boy','2010-10-14','1','Comedy','English'),
('6291016','1011','The New Kind','2010-11-14','1','Comedy','English');

CREATE TABLE    Stock_List(

ISBN_ID CHAR(10) NOT NULL,
CCount INT UNSIGNED,
 FOREIGN KEY(ISBN_ID) REFERENCES Book(ISBN_ID)
ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Stock_List( ISBN_ID, CCount)
VALUES('6291010',100),
('6291012',25),
('6291011',10),
('6291013',20),
('6291014',30),
('6291016',350);


CREATE TABLE    Borrower(
Reciept_No CHAR(20) NOT NULL,
Reader_ID CHAR(10) ,
Staff_ID CHAR(5) ,
Date_Book_Borrowed DATE DEFAULT (CURRENT_DATE()),
Due_Date DATE DEFAULT (CURRENT_DATE()+7) ,
ISBN_ID CHAR(10) NOT NULL ,
PRIMARY KEY(Reciept_No),
FOREIGN KEY(Reader_ID) REFERENCES Registered_Readers(Reader_ID)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY(ISBN_ID) REFERENCES Book(ISBN_ID)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY(Staff_ID) REFERENCES Staff(Staff_ID)
ON DELETE SET NULL
ON UPDATE CASCADE 
);

INSERT INTO Borrower(Reciept_No,Reader_ID,Staff_ID,ISBN_ID)
VALUES('102021','3003','90101','6291010'),
('102022','3001','90102','6291016'),
('102023','3002','90104','6291011'),
('102024','3004','90105','6291014'),
('102025','3005','90102','6291011');


INSERT INTO Borrower(Reciept_No,Reader_ID,Staff_ID,ISBN_ID,Date_Book_Borrowed,Due_Date)
values('102026','3004','90102','6291015',20220320,20220327);


CREATE TABLE    BorrowerWithFines(
Fine_No CHAR(20) NOT NULL,
Reciept_No CHAR(20) NOT NULL,
Basic_Fees INT UNSIGNED,
PRIMARY KEY(Fine_No),
FOREIGN KEY(Reciept_No) REFERENCES Borrower(Reciept_No)
ON UPDATE CASCADE 
ON DELETE CASCADE

);

INSERT INTO BorrowerWithFines(Fine_No,Reciept_No,Basic_Fees)
VALUES('101','102023',100),
('102','102022',100),
('103','102026',100);

CREATE TABLE     BookLocation(

Location_ID CHAR(10) NOT NULL,
ISBN_ID CHAR(10) NOT NULL,
Bin VARCHAR(20) NOT NULL DEFAULT '',
Aisle VARCHAR(20) NOT NULL DEFAULT '',
Section VARCHAR(20)  NOT NULL DEFAULT '',
FFloor INT UNSIGNED,
PRIMARY KEY(Location_ID),
FOREIGN KEY(ISBN_ID) REFERENCES Book(ISBN_ID)
ON UPDATE CASCADE
ON DELETE CASCADE
);
INSERT INTO BookLocation(Location_ID,ISBN_ID,Bin,Aisle,Section,FFloor)
VALUES('111111','6291010','A1','001','S12',1),
('111112','6291011','B2','001','S11',1),
('111113','6291012','B2','002','S12',1),
('111114','6291013','D2','031','S24',1),
('111115','6291015','B5','002','S1',2),
('111116','6291016','A6','004','S2',2),
('111117','6291011','V2','006','S24',2);

CREATE TABLE     Vendors(
Vendor_ID CHAR (10) NOT NULL,
First_Name VARCHAR(20) NOT NULL DEFAULT '',
Last_Name VARCHAR(20) NOT NULL DEFAULT '',
Location VARCHAR(50) NOT NULL DEFAULT '',
PRIMARY KEY(Vendor_ID)
);


INSERT INTO Vendors(Vendor_ID,First_Name,Last_Name,Location)
VALUES('10101','Maira','Stevenson','USA'),
('10102','Rodney','Marshall','CANADA'),
('10103','Stevenson','Ruairi','CANADA'),
('10104','Kody','Ruairi','ITALY'),
('10105','Maira','Kody','JAPAN'),
('10106','Marshall','Ruairi','CANADA'),
('10107','Albert','Rodney','USA');

CREATE TABLE OrderList (
Order_ID INT NOT NULL,
Total_Order_Amount DECIMAL(15,2) NOT NULL,
 Number_Of_Copies INT UNSIGNED,
 Arrival_date DATE DEFAULT (CURRENT_DATE()+10),
 Vendor_ID CHAR(10) ,
ISBN_ID CHAR (10) NOT NULL,
PRIMARY KEY(Order_ID),
 FOREIGN KEY(Vendor_ID) REFERENCES Vendors(Vendor_ID)
 ON DELETE SET NULL
 ON UPDATE CASCADE,
  FOREIGN KEY(ISBN_ID) REFERENCES Book(ISBN_ID)
  ON UPDATE CASCADE
  ON DELETE CASCADE
 
);

INSERT INTO OrderList(Order_ID,Total_Order_Amount,Number_Of_Copies,Vendor_ID, ISBN_ID)
VALUES('100110',10023.00,200,'10101','6291010'),
('100111',10023.00,200,'10102','6291013'),
('100112',1023.00,500,'10103','6291016');



SHOW TABLES;
SELECT *FROM author;
SELECT *FROM book;
SELECT *FROM Booklocation;
SELECT *FROM borrower;
SELECT *FROM borrowerwithfines;
SELECT *FROM libraryentryrecord;
SELECT *FROM orderlist; 
SELECT *FROM stock_list;
SELECT *FROM vendors;
SELECT *FROM payment_history;
SELECT *FROM registeration_fee;


/*This gives all the information about the registered readers*/
SELECT  Reader_ID, rr.FirstName AS CustomerName, rr.PhoneNumber AS Customer_Number,
		rr.city,rr.postcode, rf.Plan_Chosen, rf.start_Date, Amount, Mode,Transcation_ID, rf.End_Date
FROM 	registeration_fee rf 
		JOIN  registered_readers rr ON rr.Registeration_Fee_ID = rf.Registeration_Fee_ID
		JOIN payment_history ph ON ph.Payment_ID = rf.Payment_ID;
    

/*Find the books with with the keywords*/
SELECT b.ISBN_ID, b.Book_name,  LLanguage,Bin,Aisle,Section, 
FFloor,CCount as Book_Count
FROM book b
JOIN booklocation bl ON bl.ISBN_ID = b.ISBN_ID
JOIN stock_list sl ON sl.ISBN_ID = b.ISBN_ID
WHERE Book_name LIKE '%A%';

SELECT b.ISBN_ID, b.Book_Name, LLanguage, Bin, Aisle, Section,
		FFloor, CCount as Book_Count
FROM Book b 
JOIN booklocation bl ON bl.ISBN_ID = B.ISBN_ID
JOIN stock_list sl  ON sl.ISBN_ID = b.ISBN_ID
WHERE book_Name LIKE '%dark%';    

/*Find the name of book by its location*/

SELECT Book_name
FROM Book
WHERE ISBN_ID IN (SELECT ISBN_ID FROM BookLocation WHERE Bin ='A1' AND Aisle='001' 
AND Section ='S12' AND FFloor=1 );

/* Name the book borrowed by a specific person*/

SELECT Book_name
FROM Book
WHERE ISBN_ID IN (SELECT ISBN_ID FROM Borrower WHERE Reader_ID IN(SELECT Reader_ID 
FROM Registered_Readers WHERE FirstName = 'Joselyn'));



/* Name all the visitors of the library that are not registered*/

Select Person_Name
FROM LibraryEntryRecord
where Email NOT IN (select Email FROM Registered_Readers);

SELECT Book_name
FROM Book

WHERE ISBN_ID IN (SELECT ISBN_ID FROM Stock_List where CCount =100);




































  
  
  