CREATE TABLE Customer (
    id_Customer int  NOT NULL,
    Firstname nvarchar2(100)  NOT NULL,
    Surname nvarchar2(100)  NOT NULL,
    dateOfbirth date  NOT NULL,
    Adress nvarchar2(100)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY  (id_Customer)
);


CREATE TABLE Material (
    Id_Material int  NOT NULL,
    MaterialCode nvarchar2(100)  NOT NULL,
    MaterialBrand nvarchar2(100)  NOT NULL,
    Supplier_id_supplier int  NOT NULL,
    CONSTRAINT Material_pk PRIMARY KEY  (Id_Material)
);


CREATE TABLE Project (
    Id_project int  NOT NULL,
    Project_name nvarchar2(100)  NOT NULL,
    Project_Start_Date date  NOT NULL,
    Project_End_Date date  NULL,
    Supplier_id_supplier int  NOT NULL,
    Customer_id_Customer int  NOT NULL,
    Task_id int  NOT NULL,
    CONSTRAINT Project_pk PRIMARY KEY  (Id_project)
);


CREATE TABLE Staff (
    id_staff int  NOT NULL,
    Firstname nvarchar2(100)  NOT NULL,
    Surname nvarchar2(100)  NOT NULL,
    DateOfBirth date  NOT NULL,
    StaffTitle_Id_Title int  NOT NULL,
    CONSTRAINT Staff_pk PRIMARY KEY  (id_staff)
);


-- Table: Staff_Title
CREATE TABLE Staff_Title (
    Id_Title int  NOT NULL,
    Staff_Title nvarchar2(100)  NOT NULL,
    CONSTRAINT Staff_Title_pk PRIMARY KEY  (Id_Title)
);

-- Table: Supplier
CREATE TABLE Supplier (
    id_supplier int  NOT NULL,
    SupplierName nvarchar2(100)  NOT NULL,
    Adress_id_Adress int  NOT NULL,
    CONSTRAINT Supplier_pk PRIMARY KEY  (id_supplier)
);


-- Table: Task
CREATE TABLE Task (
    id_Task int  NOT NULL,
    Task_Start_Date date  NOT NULL,
    Task_end_Date date  NULL,
    Staff_id int  NOT NULL,
    Task_name nvarchar2(100) NOT NULL,
    CONSTRAINT Task_pk PRIMARY KEY  (id_Task)
);


ALTER TABLE Material ADD CONSTRAINT Material_Supplier
    FOREIGN KEY (Supplier_id_supplier)
    REFERENCES Supplier (id_supplier);

ALTER TABLE Project ADD CONSTRAINT Project_Customer
    FOREIGN KEY (Customer_id_Customer)
    REFERENCES Customer (id_Customer);

ALTER TABLE Project ADD CONSTRAINT Project_Supplier
    FOREIGN KEY (Supplier_id_supplier)
    REFERENCES Supplier (id_supplier);

ALTER TABLE Project ADD CONSTRAINT Project_Task
    FOREIGN KEY (Task_id)
    REFERENCES Task (id_Task);

ALTER TABLE Staff ADD CONSTRAINT Staff_StaffTitle
    FOREIGN KEY (StaffTitle_Id_Title)
    REFERENCES Staff_Title (Id_Title);

ALTER TABLE Task ADD CONSTRAINT Task_Staff
    FOREIGN KEY (Staff_id)
    REFERENCES Staff (id_staff);
    
    
ALTER TABLE Task ADD  Task_Name varchar2(50);

ALTER TABLE Supplier ADD Adress nvarchar2(100);

ALTER TABLE Staff ADD Salary nvarchar2(50);

 --TASK

INSERT INTO  TASK VALUES(1,'17/06/2020',NULL,1,'EXTERIOR');
INSERT INTO  TASK VALUES(2,'20/06/2020',NULL,9,'ELEVATOR INSTALATION');
INSERT INTO  TASK VALUES(3,'25/06/2020',NULL,10,'BUILDING PLANING');
INSERT INTO  TASK VALUES(4,'30/06/2020',NULL,6,'CONSTURACTINGS');
INSERT INTO  TASK VALUES(5,'05/07/2020',NULL,8,'CONSTURACTIONS');
INSERT INTO  TASK VALUES(6,'10/07/2020',NULL,2,'ELECTRICITY');


--STAFF

INSERT INTO STAFF VALUES(1,'Kemal','Sallabas','02/02/1994',2);
INSERT INTO STAFF VALUES(2,'David','OERS','07/04/1971',1);
INSERT INTO STAFF VALUES(3,'Candice','FORD','01/12/1977',2);
INSERT INTO STAFF VALUES(4,'Melisa','KOSE','06/08/1994',3);
INSERT INTO STAFF VALUES(5,'Ola','KESY','09/06/1976',3);
INSERT INTO STAFF VALUES(6,'Thomas','SULLIVAN','11/08/1970',10);
INSERT INTO STAFF VALUES(7,'Mert','KELOGLU','08/11/1974',7);
INSERT INTO STAFF VALUES(8,'Taylor','WOODS','10/03/1988',6);
INSERT INTO STAFF VALUES(9,'Nicolas','Cage','08/03/1983',5);
INSERT INTO STAFF VALUES(10,'Ahmet','WEST','12/04/1984',8);
INSERT INTO STAFF VALUES(11,'Yigit', 'SALLABAS','19/02/1999',4);
INSERT INTO STAFF VALUES(12,'Yigit','GUL','13/2/1986',9);

--STAFF_TITLE

INSERT INTO STAFF_TITLE VALUES(1,'Electricity Engineer')
INSERT INTO STAFF_TITLE VALUES(2,'Painter')
INSERT INTO STAFF_TITLE VALUES(3,'Construction Worker')
INSERT INTO STAFF_TITLE VALUES(4,'Worker')
INSERT INTO STAFF_TITLE VALUES(5,'Elevator Personal')
INSERT INTO STAFF_TITLE VALUES(6,'Manager')
INSERT INTO STAFF_TITLE VALUES(7,'Consturction Engineer')
INSERT INTO STAFF_TITLE VALUES(8,'Planning Manager')
INSERT INTO STAFF_TITLE VALUES(9,'Operator')
INSERT INTO STAFF_TITLE VALUES(10,'Roof Personal')


--PROJECT

INSERT INTO PROJECT VALUES (1,'ISTANBUL SKYLINE','05/02/2018',NULL,1,3,3);
INSERT INTO PROJECT VALUES (2,'ISTANBUL SKYLINE','05/02/2018',NULL,2,2,2);
INSERT INTO PROJECT VALUES (3,'ISTANBUL SKYLINE','05/02/2018',NULL,3,20,4);
INSERT INTO PROJECT VALUES (4,'ISTANBUL SKYLINE','05/02/2018',NULL,4,15,5);
INSERT INTO PROJECT VALUES (5,'ISTANBUL SKYLINE','05/02/2018',NULL,5,10,3);
INSERT INTO PROJECT VALUES (6,'ISTANBUL SKYLINE','05/02/2018',NULL,6,12,1);
INSERT INTO PROJECT VALUES (7,'WARSAW GARDENING','19/02/2008',NULL,1,20,1);
INSERT INTO PROJECT VALUES (8,'WARSAW GARDENING','12/09/2021',NULL,2,15,6);
INSERT INTO PROJECT VALUES (9,'WARSAW GARDENING','12/09/2021',NULL,3,2,6);
INSERT INTO PROJECT VALUES (10,'WARSAW GARDENING','12/09/2021',NULL,4,4,1);
INSERT INTO PROJECT VALUES (11,'WARSAW GARDENING','12/09/2021',NULL,5,19,4);
INSERT INTO PROJECT VALUES (12,'WARSAW GARDENING','12/09/2021',NULL,6,13,1);
INSERT INTO PROJECT VALUES (13,'NEW YORK SKYSCRAPER','10/10/2005',NULL,1,14,1);
INSERT INTO PROJECT VALUES (14,'NEW YORK SKYSCRAPER','10/10/2005',NULL,2,5,2);
INSERT INTO PROJECT VALUES (15,'NEW YORK SKYSCRAPER','10/10/2005',NULL,3,3,3);
INSERT INTO PROJECT VALUES (16,'NEW YORK SKYSCRAPER','10/10/2005',NULL,4,5,4);
INSERT INTO PROJECT VALUES (17,'NEW YORK SKYSCRAPER','10/10/2005',NULL,5,19,5);
INSERT INTO PROJECT VALUES (18,'LONDON EAST RESTAURANT','29/04/2021',NULL,1,6,1);
INSERT INTO PROJECT VALUES (19,'LONDON EAST RESTAURANT','29/04/2021',NULL,2,3,2);
INSERT INTO PROJECT VALUES (20,'LONDON EAST RESTAURANT','29/04/2021',NULL,3,4,3);


--CUSTOMER

INSERT INTO CUSTOMER VALUES (1,'Milly','JACKSON','12/05/1996','WARSAW');
INSERT INTO CUSTOMER VALUES (2,'Robert','LEWANDOWSKI','17/02/1995','BERLIN');
INSERT INTO CUSTOMER VALUES (3,'Lýonel','MESSI','01/07/1955','BERLIN');
INSERT INTO CUSTOMER VALUES (4,'Kendall','JAMES','01/12/1995','WARSAW');
INSERT INTO CUSTOMER VALUES (5,'Ali','BABA','08/03/1965','PARIS');
INSERT INTO CUSTOMER VALUES (6,'James','HARDEN','03/06/1975','PARIS');
INSERT INTO CUSTOMER VALUES (7,'Ruan','Da','01/12/1978','AMSTERDAM');
INSERT INTO CUSTOMER VALUES (8,'Amanda','CERNY','07/11/1999','NEWYORK');
INSERT INTO CUSTOMER VALUES (9,'Star','BUCKS','20/02/1995','MILANO');
INSERT INTO CUSTOMER VALUES (10,'Daniel','TASKIN','30/12/1994','MOSCOW');
INSERT INTO CUSTOMER VALUES (11,'Sasha','BLYADI','06/12/1992','MOSCOW');
INSERT INTO CUSTOMER VALUES (12,'Yigit','Sal','01/02/1965','ISTANBUL');
INSERT INTO CUSTOMER VALUES (13,'Bob','KERBAL','1/12/1995','WARSAW');
INSERT INTO CUSTOMER VALUES (14,'James','THEFROG','31/07/1998','MINSK');
INSERT INTO CUSTOMER VALUES (15,'Harry','POTTER','1/12/1995','BARCELONA');
INSERT INTO CUSTOMER VALUES (16,'Albus','DUMBLEDORE','01/12/1955','VENICE');
INSERT INTO CUSTOMER VALUES (17,'Travis','SCOTT','01/01/1985','TURIN');
INSERT INTO CUSTOMER VALUES (18,'Amelia','LENS','01/02/1995','GDANSK');
INSERT INTO CUSTOMER VALUES (19,'Stephan','BODZIN','31/07/1998','ISTANBUL');
INSERT INTO CUSTOMER VALUES (20,'Selda','BAGCAN','03/10/1995','MINSK');

--MATERIAL

SELECT * FROM MATERIAL

INSERT INTO MATERIAL VALUES(1,'W','WOOD',1);
INSERT INTO MATERIAL VALUES(2,'S','STONE',2);
INSERT INTO MATERIAL VALUES(3,'I','IRON',2);
INSERT INTO MATERIAL VALUES(4,'C','CABLE',10);
INSERT INTO MATERIAL VALUES(5,'P','PLASTICS',10);
INSERT INTO MATERIAL VALUES(6,'Y','YTONG',5);
INSERT INTO MATERIAL VALUES(7,'CT','CEMENT',4);
INSERT INTO MATERIAL VALUES(8,'PT','PLASTER',7);

--SUPPLIER

INSERT INTO SUPPLIER VALUES(1,'AA',1,'WARSAW');
INSERT INTO SUPPLIER VALUES(2,'BA',2,'LONDON');
INSERT INTO SUPPLIER VALUES(3,'CA',3,'NEW YORK');
INSERT INTO SUPPLIER VALUES(4,'DA',4,'ANKARA');
INSERT INTO SUPPLIER VALUES(5,'EA',5,'ISTANBUL');
INSERT INTO SUPPLIER VALUES(6,'FA',6,'ROME');
INSERT INTO SUPPLIER VALUES(7,'GA',7,'AMSTERDAM');
INSERT INTO SUPPLIER VALUES(8,'HA',8,'KRAKOW');
INSERT INTO SUPPLIER VALUES(9,'IA',9,'LA');
INSERT INTO SUPPLIER VALUES(10,'JA',10,'PARIS');



select * from CUSTOMER

select * from MATERIAL

select * from PROJECT

select * from STAFF

select * from STAFF_TITLE

select * from SUPPLIER

select * from TASK



--1
select s.company_name as Company, m.materialbrand as Material
from material m 
inner join supplier s on m.supplier_id_supplier = s.id_supplier
where m.materialcode = 'S'


--2
select count(p.id_project) as Project, c.surname as "Customer Surname"
from customer c 
join project p on c.id_customer = p.customer_id_customer
group by c.surname, c.id_customer
having count(p.id_project) > 1



--3
select staff_title as Staff
from staff_title
where not exists (select id_staff
                  from staff
                  where stafftitle_id_title = id_title)
                  

--4
select firstname as name, max(dateofbirth) as Birth
from staff
where extract(year from dateofbirth) in (select extract(year from s.dateofbirth)
                                         from staff s
                                         where stafftitle_id_title = '2')
group by firstname                                    






--1 T
create or replace trigger not_allowed
before insert or update 
on Project
for each row 
Begin
If (extract(year from project_start_date) < extract(year from (current_date))
Then
Raise_application_error(-20100, 'You are not allowed to add this date');
End If;
End;

INSERT INTO PROJECT VALUES (25,'KYS','05/02/2014',NULL,1,2,4);


--2 T

create or replace trigger delete_staff
after delete 
on Staff
for each row
Begin 
insert into Staff_del_audit(id_staff, firstname, surname, dateofbirth)
values(:old.id_staff, :old.firstname, :old.surname, :old.dateofbirth)
End;


DELETE 
from staff
where id_staff = 1;












