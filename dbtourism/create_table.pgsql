drop TABLE if exists "Staff_excursion";
drop TABLE if exists "Staff";
drop TABLE if exists "Transcending work";
drop TABLE if exists "Klient_Raspisanie";
drop TABLE if exists "Client";
drop TABLE if exists "timetable";
drop TABLE if exists "excursion";
drop TABLE if exists "Route";
drop TABLE if exists "types of transport";
drop TABLE if exists "attraction";


CREATE TABLE "Transcending work"(
"hired"          TIMESTAMP NOT NULL,
"quit"     TIMESTAMP NOT NULL,
"ID_Transcending work"  serial PRIMARY KEY,
"Past position"   char(48) NOT NULL,
"Kind of activity"  char(80) NOT NULL,
"Grounds for dismissal"  char(200) NOT NULL,
"organization"    char(80) NOT NULL);

CREATE TABLE "Staff"(
"Full_name"       char(90) NOT NULL,
"ID_Staff"         serial PRIMARY KEY,
"Dolzhnost"       char(40) NOT NULL,
"employment_date"    date NOT NULL,
"date_of_dismissal"    date,
"salary"          money NOT NULL,
"ID_number"       int NOT NULL,
"Date_of_Birth"      date NOT NULL, 
"passport_data"      char(60) NOT NULL,
"Work_status"     char(24) NOT NULL,
"The foremost place of work"    int,
"login" text not null unique,
"passw" text not null,
"role_user" varchar(30) not null,
FOREIGN KEY ("The foremost place of work") REFERENCES "Transcending work");


CREATE TABLE "Client"(
"Contact_details"   char(60) NOT NULL,
"Full_name"        char(60) NOT NULL,
"Date_of_registration" date NOT NULL,
"ID_Client"          serial PRIMARY KEY,
"login" text not null unique,
"passw" text not null);

CREATE TABLE "types of transport"(
"name_of_transport"   char(160) NOT NULL,
"ID_transport"        serial PRIMARY KEY);
CREATE TABLE "attraction"( 
"name_of_attraction"   char(160) NOT NULL,
"ID_attraction"        serial PRIMARY KEY,
"Description_of_Attraction"   char(200) NOT NULL
);
CREATE TABLE "Route"(
"ID_Route"          serial PRIMARY KEY,
"Route_name"        char(160) NOT NULL,
"location_on_the_route"  int NOT NULL,
"next_Attraction"        int,
"Transition time in minutes"      int,
"transport delivered to the sights"  int,
FOREIGN KEY ("transport delivered to the sights") REFERENCES "types of transport",
FOREIGN KEY ("next_Attraction") REFERENCES "Route",
FOREIGN KEY ("location_on_the_route") REFERENCES "attraction");



CREATE TABLE "excursion"(
"ID_excursion"       serial PRIMARY KEY,
"Price"            money NOT NULL,
"start_of_route"      int NOT NULL,
"number of seats" int NOT NULL,
FOREIGN KEY ("start_of_route") REFERENCES "Route");


CREATE TABLE "timetable"(
"day_of_the_week" char(30) NOT NULL,
"start_time"  TIMESTAMP NOT NULL,
"End_time"  TIMESTAMP NOT NULL,
"ID_timetable"          serial PRIMARY KEY,
"excursion_numbers"    int NOT NULL,
FOREIGN KEY ("excursion_numbers") REFERENCES "excursion");

CREATE TABLE "Staff_excursion"
( 
    "ID_Staff"  integer NOT NULL,
    "ID_excursion"  integer  NOT NULL,
    PRIMARY KEY ("ID_Staff" , "ID_excursion"),
    FOREIGN KEY ("ID_Staff") REFERENCES "Staff",
    FOREIGN KEY ("ID_excursion") REFERENCES "excursion");


CREATE TABLE "Klient_Raspisanie"
( 
    "ID_Client"  integer NOT NULL,
    "ID_excursion"   integer  NOT NULL,
    "Date"   DATE  NOT NULL,
    PRIMARY KEY ("ID_Client" , "ID_excursion","Date" ),
    FOREIGN KEY ("ID_Client") REFERENCES "Client",
    FOREIGN KEY ("ID_excursion") REFERENCES "excursion"
    );






 insert into "attraction"("name_of_attraction","Description_of_Attraction") values('????????????','???????????? ??????????????????????, ???????????????? ???????? ?? ?????????? ?????????????? ????????, ???????? ???????????????????? ????????????????.'),
('???????????????? ?????????????????????? ????????','???????????? ?????? ?? ???????????????????? Love, ?? ?????????? ???? ?????????? ????????????! ???????????????? ???????????????? ?????????? ??????????????');


insert into "attraction"("name_of_attraction","Description_of_Attraction") values
('???????????????? ?????????????? ??????????','?????????????????? ?????????????????????????? ????????????, ???????????????? ?????????????? ?????????? ???????????????? ?? ?????????? ???????????????? ?????????????? ?? ?????????????????? ???? ???????????? ?????????????????? ?? ?????????????????????????? ???? ????????????.'),
('???????????????? ???????? ???? ??????????????','???????? ???????????????? ??? ???????????????? ???????????????? ????????????. ??????????????????, ?????????????????? ?????? ???????????? ?????????????? ????????????, ?????? ??????????-???????????? ???????????????????? ?????????????????? ?????? ????????????????, ???????????? ?????? ???????????? ?????????????????????? ????????.'), 
('???????????????????? ??????????????','???????????????????? ?????????????? ??? ???????? ???? ?????????????? ???????? ???????????? ??, ?????????? ?????? ?? ??????????????????????????, ?????????????? ?????????? ???????????????? ???????????? ?? ???????????????? ?????????????? ????????????');

insert into "attraction"("name_of_attraction","Description_of_Attraction") values
('???????????? ???????????? ??????????????','?? ?????? ????????????, ?? ?????? ?????????????????? ?????????????????? ?? ???????? ??????????????????????. ?????? ???????????? ?????? ???????????????? ?? 1832 ????????, ?? ?? 1897 ???????? ?????????????????? ?????????????????? ??????????????, ?????????????????????? ?? ?????????? ??????????????'),
('?????????? ???????????????????? ??????????','?????????? ???????????????????? ?????????? - ?????? ???????????? ???? ?????? ?????????????? ????????????-?????????????????????????????? ?????????????????????????? ??????????, ?????? ?????????????? ?????????????????? ???????????????????? ???????????????????? ???? ???????? ??????????.'),
('?????????? ???????????????????? ???????? ??????????????','?????????? ???????????????? ???????????????????????? ?????????????? ???????????????????????? ???????????????????????? ?? ?????????????? ?????????? ???????????????????? ???????? ??. ??. ??????????????.'),
('?????????????????? ??????','?????????????? ????????, ???????? ?????? ???????????????? ??????????????????, ????????????????????, ???????????????? ?????????? ??????????, ??????????????????????????, ???????????????? ????????????.'),
('???????????????????????? ????????????????','???????????????? ???????? ???????????????? ?????????????? ?? ??????, ?????? ?????? ?????????????? ???? ?????? ?????????? ?????????????????? ?????????????? ????????????????, ?? ???????? ???????????????? ???? ?????? ???????????? ?????????????????? ?????????????????? ???????????????????? ????????????.');

insert into "types of transport" values('???????????????? ????????????????'),('???????????? ?????????????????? ??????????????'), ('????????????????????????'), ('????????????');

insert into "Route" ("Route_name","location_on_the_route","Transition time in minutes","transport delivered to the sights") 
values('?????????????????? ???? ????????????',7,20,4),
('?????????????????? ???? ????????????',6,15,4),
('?????????????????? ???? ????????????',5,30,4),
('?????????????????? ???? ????????????',4,NULL,4),
('?????????????????? ???? ???????????????? ????????????',5,15,3),
('?????????????????? ???? ???????????????? ????????????',6,25,3), 
('?????????????????? ???? ???????????????? ????????????',7,30,3), 
('?????????????????? ?????????? ????????',7,20,3), 
('?????????????????? ?????????? ????????',8,30,3),  
('?????????????????? ???? ????????????',4,30,3), 
('?????????????????? ???? ????????????',5,20,3), 
('?????????????????? ???? ???????????????????? ????????????',1,20,3), 
('?????????????????? ???? ???????????????????? ????????????',2,25,3),  
('?????????????????? ???? ???????????????????? ????????????',7,35,3);


insert into "excursion" ("Price","start_of_route","number of seats") values (500,1,15),
(400,5,10),
(300,8,8),
(500,10,15),
(600,12,20);

insert into "Client"("Contact_details","Full_name","Date_of_registration", "login", "passw") values
('38066405077 Thelolownedlol@gmail.com','?????????????????? ???????????? ??????????????????????????','2018-02-04', 'c1', '123'),
 ('380995505249 dota2zelendoren@gmail.com','???????????????? ?????????? ??????????????','2016-05-20', 'c2', '123'),
('380965870700 boyvlad99@gmail.com','???????????????? ?????????????????? ??????????????????','2020-05-01', 'c3', '123'),
('380668906427 vadym1504@gmail.com ','?????????? ?????????? ????????????????','2020-05-06', 'c4', '123'),
('380975533177 ddd.tosha@gmail.com','?????????? ?????????? ??????????????????','2020-05-05', 'c5', '123'),
('380965872712 boyViktor@gmail.com','???????????????? ???????????? ????????????????','2020-05-07', 'c6', '123'),
('380965855555 boyLalyd@gmail.com','?????????? ???????????? ????????????????????','2020-05-10', 'c7', '123'),
('380934953674 iidarkii@ukr.net','???????????? ???????????? ????????????????????','2020-05-11', 'c8', '123'),
('380965888700 boyDmitro@gmail.com','???????????? ?????????????? ??????????????????','2020-05-15', 'c9', '123'),
('380681818911 doqsoftware@gmail.com','?????????? ???????? ??????????????','2020-05-12', 'c10', '123');       

insert into "Transcending work"("hired","quit","Past position","Kind of activity","Grounds for dismissal","organization") 
values ('2016-01-08 15:55:06', '2018-04-08 12:05:00', '????????????????', '???????????? ?? ??????????', '???? ?????????????????????? ??????????????', '??????????????'),
('2016-01-08 15:55:06', '2018-04-08 12:05:00', '????????????????', '???????????? ?? ??????????', '???? ?????????????????????? ??????????????', '??????????????');   

insert into "Staff"("Full_name","Dolzhnost","employment_date","date_of_dismissal","salary","ID_number","Date_of_Birth","passport_data","Work_status","The foremost place of work", "login", "passw", "role_user") values 
('?????????????????? ???????????? ????????????????????????????','????????????????','2016-01-20 14:00:00',NULL,15000,1,'1990-07-25 12:00:00','?????? ?????????????????????????? 477-004 ???????? ???????????? 25.06.2006','????????????????',2, 'd1', '123', 'director'),
('?????????? ???????? ????????????????','????????????????','2016-05-20',NULL,5000,2,'1991-07-25','?????? ?????????????????????????? 477-774 ???????? ???????????? 25.04.2007','????????????????',2, 's1', '123', 'manager'),
('???????????????????? ?????????? ????????????????','????????????????','2016-02-20',NULL,5500,3,'1992-08-25','?????? ?????????????????????????? 507-474 ???????? ???????????? 25.04.2010','????????????????',NULL, 's2', '123', 'manager'),
 ('?????????? ?????????????? ????????????????','????????????????','2018-04-20','2019-05-22',6000,4,'1980-08-25','?????? ?????????????????????????? 505-404 ???????? ???????????? 25.04.1990','????????????',NULL, 's3', '123', 'manager'),
 ('???????????? ?????????????? ????????????????','????????????????','2017-04-20',NULL,5500,5,'1981-09-20','?????? ?????????????????????????? 305-304 ???????? ???????????? 15.05.1999','????????????????',NULL, 's4', '123', 'manager'),
 ('???????????? ?????????????????? ????????????????????','??????????????????????','2018-09-25',NULL,5800,6,'1980-11-20','?????? ?????????????????????????? 305-404 ???????? ???????????? 15.12.2008','????????????????',NULL, 's5', '123', 'gid'),
 ('?????????? ???????????? ????????????????','??????????????????????','2018-01-20',NULL,6000,7,'1981-06-19','?????? ?????????????????????????? 300-403 ???????? ???????????? 15.08.1999','????????????????',NULL, 's6', '123', 'gid'),
 ('?????????????? ???????????????????? ??????????????????','????????????????','2018-04-20',NULL,5600,8,'1983-09-20','?????? ?????????????????????????? 305-332 ???????? ???????????? 15.05.2001','????????????????',NULL, 's7', '123', 'manager'),
 ('???????????????????? ?????????? ??????????????????','????????????????','2017-04-15',NULL,5450,9,'1983-03-20','?????? ?????????????????????????? 305-322 ???????? ???????????? 19.03.2001','????????????????',NULL, 's8', '123', 'manager'),
 ('?????????????? ?????????? ????????????????','??????????????????????','2016-01-20',NULL,5700,10,'1981-03-19','?????? ?????????????????????????? 322-403 ???????? ???????????? 15.03.1999','????????????????',NULL, 's9', '123', 'gid'),
 ('???????????????????? ?????????? ????????????????','??????????????????????','2017-06-20',NULL,6200,11,'1981-07-19','?????? ?????????????????????????? 233-403 ???????? ???????????? 15.07.1999','????????????????',NULL, 's10', '123', 'gid');


insert into "timetable"("day_of_the_week","start_time","End_time","excursion_numbers") values 
('??????????????????????','2020-05-25 15:00:00','2020-05-25 17:00:00',1),
('??????????????','2020-05-26 11:00:00','2020-05-26 13:00:00',2),
('??????????','2020-05-27 12:00:00','2020-05-27 14:00:00',3),
('??????????????','2020-05-28 14:00:00','2020-05-28 16:00:00',4),
('??????????????','2020-05-29 16:00:00','2020-05-29 18:00:00',5);



insert into "Klient_Raspisanie"("ID_Client","ID_excursion","Date") values
(1,1,'2020-05-25'),
(2,1,'2020-05-25'),
(3,1,'2020-05-25'),
(4,1,'2020-05-25'),
(5,1,'2020-05-25'),
(6,1,'2020-05-25'),
(2,2,'2020-05-26'),
(4,2,'2020-05-26'),
(6,2,'2020-05-26'),
(8,2,'2020-05-26'),
(5,3,'2020-05-27'),
(6,3,'2020-05-27'),
(7,3,'2020-05-27'),
(9,3,'2020-05-27'),
(10,3,'2020-05-27'),
(8,4,'2020-05-28'),
(4,4,'2020-05-28'),
(2,4,'2020-05-28'),
(1,5,'2020-05-29'),
(3,5,'2020-05-29'),
(4,5,'2020-05-29'),
(5,5,'2020-05-29'),
(9,5,'2020-05-29');



insert into "Staff_excursion" ("ID_Staff","ID_excursion") values (5,1), (6,1), (8,2), (8,3), (7,3), (10,4), (9,4), (11,5), (8,5);


UPDATE "Route"
SET "next_Attraction" = 2
WHERE "ID_Route" = 1;
UPDATE "Route"
SET "next_Attraction" = 3
WHERE "ID_Route" = 2;
UPDATE "Route"
SET "next_Attraction" = 4
WHERE "ID_Route" = 3;
UPDATE "Route"
SET "next_Attraction" = NULL
WHERE "ID_Route" = 4;

UPDATE "Route"
SET "next_Attraction" = 6
WHERE "ID_Route" = 5;
UPDATE "Route"
SET "next_Attraction" = 7
WHERE "ID_Route" = 6;
UPDATE "Route"
SET "next_Attraction" = NULL
WHERE "ID_Route" = 7;

UPDATE "Route"
SET "next_Attraction" = 9
WHERE "ID_Route" = 8;
UPDATE "Route"
SET "next_Attraction" = NULL
WHERE "ID_Route" = 9;

UPDATE "Route"
SET "next_Attraction" = 11
WHERE "ID_Route" = 10;
UPDATE "Route"
SET "next_Attraction" = NULL
WHERE "ID_Route" = 11;

UPDATE "Route"
SET "next_Attraction" = 13
WHERE "ID_Route" = 12;
UPDATE "Route"
SET "next_Attraction" = 14
WHERE "ID_Route" = 13;
UPDATE "Route"
SET "next_Attraction" = NULL
WHERE "ID_Route" = 14;













    alter table "Client" add column login text NOT NULL  DEFAULT 'c1';
    alter table "Client" add column passw text NOT NULL  DEFAULT '123';
    alter table "Client" add unique(login);

