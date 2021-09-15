CREATE USER tourism_developer WITH LOGIN CREATEROLE PASSWORD 'developer';
CREATE USER tourism_director WITH LOGIN CREATEROLE PASSWORD 'director';
CREATE USER tourism_staff WITH LOGIN  PASSWORD 'staff';
CREATE USER tourism_client WITH LOGIN  PASSWORD 'client';
CREATE USER tourism_guest WITH LOGIN  PASSWORD 'guest';


REVOKE ALL on DATABASE tourism_db FROM tourism_developer;
REVOKE ALL ON SCHEMA public FROM tourism_developer;

REVOKE CREATE ON SCHEMA public FROM public;
REVOKE ALL ON DATABASE tourism_db FROM public;

grant all PRIVILEGES on schema public to tourism_developer;
grant all PRIVILEGES on schema public to tourism_director;

 
GRANT CREATE ON SCHEMA public to tourism_developer;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA public
TO tourism_developer;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA public
TO tourism_director;


GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA public
TO tourism_staff;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA public
TO tourism_client;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA public
TO tourism_guest;

GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO tourism_director;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO tourism_developer;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO tourism_staff;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO tourism_client;

GRANT CONNECT ON DATABASE tourism_db to tourism_director;
GRANT CONNECT ON DATABASE tourism_db to tourism_developer;
GRANT CONNECT ON DATABASE tourism_db to tourism_staff;
GRANT CONNECT ON DATABASE tourism_db to tourism_client;
GRANT CONNECT ON DATABASE tourism_db to tourism_guest;
------------------------------------------------------------
grant SELECT(login, passw, role_user) ON TABLE "Staff"
to tourism_guest;

grant select on "Client" to tourism_staff;

grant SELECT("ID_Client", login, passw) ON TABLE "Client"
to tourism_guest;

grant SELECT("ID_Staff", login, passw, role_user) ON TABLE "Staff"
to tourism_staff;
grant SELECT("ID_Staff", login, passw, role_user) ON TABLE "Staff"
to tourism_guest;

GRANT SELECT, REFERENCES ON TABLE
	public.subdivision, 
	public.client,
	public.order_,
	public.supply,
	public.product
	TO tourism_client;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE 
	public.client,
	public.order_,
	public.supply,
	public.product,
	public.order_resource
	TO tourism_staff;

GRANT SELECT ON TABLE
	public.subdivision, 
	public.order_resource,
	public.staff
	TO tourism_staff; 
grant insert on table 
	public.order_,
	public.supply
	to tourism_client;
--To use
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO tourism_staff;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO tourism_client;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE 
	public.client,
	public.order_,
	public.supply,
	public.proffesion,
	public.product,
	public.order_resource
	TO tourism_staff;

revoke SELECT, INSERT, UPDATE, DELETE ON TABLE staff
FROM tourism_guest;

grant select on client_info to tourism_staff;

revoke SELECT ON TABLE client
from tourism_guest;

grant SELECT(login, passw, role_) ON TABLE staff
to tourism_guest;

grant select on client_info to tourism_staff;

grant SELECT(client_id, login, passw) ON TABLE client
to tourism_guest;

grant insert on table 
	public.order_,
	public.supply
	to tourism_client;



WITH recursive way as (
	select "ID_Route", "Route_name", "next_Attraction", "types of transport"."name_of_transport" , 1 as marsh_step from "Route"
		join "types of transport" on "types of transport"."ID_transport"="transport delivered to the sights"
		where "ID_Route"=3
	UNION ALL

	select "Route"."ID_Route", "Route"."Route_name", "Route"."next_Attraction", "types of transport"."name_of_transport" , way.marsh_step + 1 as marsh_step from "Route"
	join "types of transport" on "types of transport"."ID_transport"="transport delivered to the sights"
	join way on way."next_Attraction" = "Route"."ID_Route"
)
 SELECT * FROM way;



 CREATE OR REPLACE FUNCTION get_way(id_route int) RETURNS TABLE
	(id_route int, route_name text, next_Attraction text, type_of_transport text, marsh_step int) as $$

	WITH recursive way as (
	select "ID_Route", "Route_name", "next_Attraction", "types of transport"."name_of_transport" , 1 as marsh_step from "Route"
		join "types of transport" on "types of transport"."ID_transport"="transport delivered to the sights"
		where "ID_Route"=id_route
	UNION ALL

	select "Route"."ID_Route", "Route"."Route_name", "Route"."next_Attraction", "types of transport"."name_of_transport" , way.marsh_step + 1 as marsh_step from "Route"
	join "types of transport" on "types of transport"."ID_transport"="transport delivered to the sights"
	join way on way."next_Attraction" = "Route"."ID_Route"
)

	$$ language sql;
	
	
	
	
	
	
	
	
--a1
create or replace function create_staff(
    full_name char(90),
    dolzhnost char(40),
    employment_date date,
    date_of_dismissal date,
    salary money,
    ID_number int,
    date_of_Birth date,
    passport_data char(60),
    work_status char(24),
    place int,
    login text,
    passw text,
    role_user varchar(30)
) returns void as $$
	
	insert into "Staff" ("Full_name", "Dolzhnost" , "employment_date",
                        "date_of_dismissal",
                        "salary" ,
                        "ID_number" ,
                        "Date_of_Birth",
                        "passport_data" ,
                        "Work_status",
                        "The foremost place of work",
                        "login",
                        "passw",
                        "role_user"
    ) values (
        full_name, dolzhnost , employment_date,
        date_of_dismissal,
        salary ,
        ID_number ,
        date_of_Birth,
        passport_data ,
        Work_status,
        place,
        login,
        passw,
        role_user
    )

$$ language sql;

select * from create_staff('Харитонов Максим Константинович','Директор','2016-01-20 14:00:00',NULL,15000,1,'1990-07-25 12:00:00','Код подразделения 477-004 Дата выдачи 25.06.2006','Работает',2, 'd1', '123', 'director');

--a2
select * from "Staff" where role_user='director';
--a3

DELETE from "Staff" where "Full_name" = 'test name';

DELETE from "Staff" where "ID_Staff" = 1;

--a4
update "excursion" 
    set "Price" = 123
        where "ID_excursion"= 1;

--a5

insert INTO "attraction"(
    "name_of_attraction"   ,
    "Description_of_Attraction" 
)
values(
    'name_of_attraction',
    'description_of_Attraction'
)

--a6
create or replace function update_salary(full_name char(90), salary money) returns money as $$
    update "Staff"
        set "salary" = salary
            where "Full_name" = full_name;
    SELECT salary from "Staff" where "Full_name" = full_name;
$$ LANGUAGE sql;

--a7
insert INTO "Transcending work"(
    "hired",
    "quit"     ,
    "Past position"   ,
    "Kind of activity"  ,
    "Grounds for dismissal"  ,
    "organization"  
)
values('2016-01-08 15:55:06', '2018-04-08 12:05:00', 'Менеджер', 'Работа в оФисе', 'По собственому желанию', 'Имеджин');   


--a8
insert INTO "Transcending work"(
    "day_of_the_week"  ,
        "start_time"   ,
        "End_time"   ,
        "excursion_numbers"  
)
values('Пятница','2020-05-29 16:00:00','2020-05-29 18:00:00',5);

--b1
insert INTO "excursion"(
    "Price"             ,
    "start_of_route"       ,
    "number of seats"  ,
    )
values(400,5,10);

--b2
insert into "excursion" ("Price","start_of_route","number of seats") values (500,1,15),
(400,5,10);
insert into "timetable"("day_of_the_week","start_time","End_time","excursion_numbers") values 
('Понедельник','2020-05-25 15:00:00','2020-05-25 17:00:00',1);
--b3
INSERT into "Staff_excursion" VALUES(
            1,
            3
        );
--c1
insert INTO "Route"(
    "Route_name"       ,
    "location_on_the_route"  ,
    "next_Attraction"        ,
    "Transition time in minutes"      ,
    "transport delivered to the sights"  ,
    )
values('Экскурсия по значимым местам',7,30,3);
--c2
create or replace function order_driver(staff_id int,  excursion_id int) returns void as $$
declare 
    excursion_amount int = 0;
BEGIN
    select count(*) into excursion_amount from "Staff"
        JOIN "Staff_excursion" using("ID_Staff")
        JOIN "excursion" using("ID_excursion")
        JOIN "timetable" on "excursion_numbers"="excursion"."ID_excursion"
            where 
                "timetable"."start_time" > now()
                and "Staff"."Dolzhnost"='Водитель';
    if excursion_id > 0 THEN
        RAISE EXCEPTION 'not free';
    ELSE
        INSERT into "Staff_excursion" VALUES(
            staff_id,
            excursion_id
        );
    END IF;
END;

$$ LANGUAGE plpgsql;
--d1
create or replace function order_excursion(login text,  excursion_name varchar,
    excursion_date date) returns void as $$
declare 
    excursion_date date;
    max_amount_clients int;
    visited_clients int;
    client_id int = 0;
    excursion_id int = 0;
BEGIN
    
    IF visited_clients+1 >= "number of seats" THEN
        RAISE EXCEPTION 'No more places';
    END IF;
    select "ID_Client" into client_id from "Client" where "login" = login;
    IF client_id = 0 THEN
        RAISE EXCEPTION 'No such user';
    END IF;
    select "Route"."ID_Route" into excursion_id 
        from "excursion"
        join "Route" on "excursion"."start_of_route"="Route"."ID_Route"
            where "Route"."Route_name" = excursion_name
            limit 1;
    IF excursion_id = 0 THEN
        RAISE EXCEPTION 'No such excursion';
    ELSE
        SELECT "number of seats" into max_amount_clients from excursion where "ID_excursion"=excursion_id;
            select count(*) into visited_clients from "Klient_Raspisanie"
                join excursion using("ID_excursion")
                    where "ID_excursion"=excursion_id
                        group by "ID_excursion", "number of seats";
            END IF;
    INSERT INTO "Klient_Raspisanie"("ID_Client", "ID_excursion", "Date") values(
        client_id,
        excursion_id,
        now()::date
    );
END;

$$ LANGUAGE plpgsql;
--d2
select "Klient_Raspisanie"."Date", "excursion"."Price", "excursion"."start_of_route" from
    "Client"
JOIN "Klient_Raspisanie" using("ID_Client")
JOIN "excursion" using("ID_excursion")

where "Client"."Full_name" = 'Харитонов Микола Костянтинович';

