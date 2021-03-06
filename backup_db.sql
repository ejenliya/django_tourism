PGDMP         "    
        
    x         
   tourism_db    10.13    10.13 ?    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ?           1262    17660 
   tourism_db    DATABASE     ?   CREATE DATABASE "tourism_db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Ukrainian_Ukraine.1251' LC_CTYPE = 'Ukrainian_Ukraine.1251';
    DROP DATABASE "tourism_db";
             tourism_developer    false                        2615    2200    public    SCHEMA        CREATE SCHEMA "public";
    DROP SCHEMA "public";
             postgres    false            ?           0    0    SCHEMA "public"    COMMENT     8   COMMENT ON SCHEMA "public" IS 'standard public schema';
                  postgres    false    3            ?           0    0    SCHEMA "public"    ACL     ?   REVOKE ALL ON SCHEMA "public" FROM PUBLIC;
GRANT USAGE ON SCHEMA "public" TO PUBLIC;
GRANT ALL ON SCHEMA "public" TO "tourism_director";
GRANT ALL ON SCHEMA "public" TO "tourism_developer";
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     C   CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";
    DROP EXTENSION "plpgsql";
                  false            ?           0    0    EXTENSION "plpgsql"    COMMENT     B   COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';
                       false    1            ?            1259    18194    Client    TABLE     ,  CREATE TABLE "public"."Client" (
    "Contact_details" character(60) NOT NULL,
    "Full_name" character(60) NOT NULL,
    "Date_of_registration" "date" NOT NULL,
    "ID_Client" integer NOT NULL,
    "login" "text" DEFAULT 'c1'::"text" NOT NULL,
    "passw" "text" DEFAULT '123'::"text" NOT NULL
);
    DROP TABLE "public"."Client";
       public         postgres    false    3            ?           0    0    TABLE "Client"    ACL     ?   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."Client" TO "tourism_developer";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."Client" TO "tourism_director";
            public       postgres    false    220            ?           0    0    COLUMN "Client"."ID_Client"    ACL     I   GRANT SELECT("ID_Client") ON TABLE "public"."Client" TO "tourism_guest";
            public       postgres    false    220            ?           0    0    COLUMN "Client"."login"    ACL     E   GRANT SELECT("login") ON TABLE "public"."Client" TO "tourism_guest";
            public       postgres    false    220            ?           0    0    COLUMN "Client"."passw"    ACL     E   GRANT SELECT("passw") ON TABLE "public"."Client" TO "tourism_guest";
            public       postgres    false    220            ?            1259    18192    Client_ID_Client_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."Client_ID_Client_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE "public"."Client_ID_Client_seq";
       public       postgres    false    220    3            ?           0    0    Client_ID_Client_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE "public"."Client_ID_Client_seq" OWNED BY "public"."Client"."ID_Client";
            public       postgres    false    219            ?           0    0    SEQUENCE "Client_ID_Client_seq"    ACL     T  GRANT SELECT,USAGE ON SEQUENCE "public"."Client_ID_Client_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."Client_ID_Client_seq" TO "tourism_developer";
GRANT SELECT,USAGE ON SEQUENCE "public"."Client_ID_Client_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."Client_ID_Client_seq" TO "tourism_client";
            public       postgres    false    219            ?            1259    18280    Klient_Raspisanie    TABLE     ?   CREATE TABLE "public"."Klient_Raspisanie" (
    "ID_Client" integer NOT NULL,
    "ID_excursion" integer NOT NULL,
    "Date" "date" NOT NULL
);
 )   DROP TABLE "public"."Klient_Raspisanie";
       public         postgres    false    3            ?           0    0    TABLE "Klient_Raspisanie"    ACL     ?   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."Klient_Raspisanie" TO "tourism_developer";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."Klient_Raspisanie" TO "tourism_director";
            public       postgres    false    232            ?            1259    18218    Route    TABLE       CREATE TABLE "public"."Route" (
    "ID_Route" integer NOT NULL,
    "Route_name" character(160) NOT NULL,
    "location_on_the_route" integer NOT NULL,
    "next_Attraction" integer,
    "Transition time in minutes" integer,
    "transport delivered to the sights" integer
);
    DROP TABLE "public"."Route";
       public         postgres    false    3            ?           0    0    TABLE "Route"    ACL     ?   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."Route" TO "tourism_developer";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."Route" TO "tourism_director";
            public       postgres    false    226            ?            1259    18216    Route_ID_Route_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."Route_ID_Route_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE "public"."Route_ID_Route_seq";
       public       postgres    false    226    3                        0    0    Route_ID_Route_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE "public"."Route_ID_Route_seq" OWNED BY "public"."Route"."ID_Route";
            public       postgres    false    225                       0    0    SEQUENCE "Route_ID_Route_seq"    ACL     L  GRANT SELECT,USAGE ON SEQUENCE "public"."Route_ID_Route_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."Route_ID_Route_seq" TO "tourism_developer";
GRANT SELECT,USAGE ON SEQUENCE "public"."Route_ID_Route_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."Route_ID_Route_seq" TO "tourism_client";
            public       postgres    false    225            ?            1259    18181    Staff    TABLE     z  CREATE TABLE "public"."Staff" (
    "Full_name" character(90) NOT NULL,
    "ID_Staff" integer NOT NULL,
    "Dolzhnost" character(40) NOT NULL,
    "employment_date" "date" NOT NULL,
    "date_of_dismissal" "date",
    "salary" "money" NOT NULL,
    "ID_number" integer NOT NULL,
    "Date_of_Birth" "date" NOT NULL,
    "passport_data" character(60) NOT NULL,
    "Work_status" character(24) NOT NULL,
    "The foremost place of work" integer,
    "login" "text" DEFAULT 's1'::"text" NOT NULL,
    "passw" "text" DEFAULT '123'::"text" NOT NULL,
    "role_user" character varying(30) DEFAULT 'manager'::character varying NOT NULL
);
    DROP TABLE "public"."Staff";
       public         postgres    false    3                       0    0    TABLE "Staff"    ACL     ?   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."Staff" TO "tourism_developer";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."Staff" TO "tourism_director";
            public       postgres    false    218                       0    0    COLUMN "Staff"."ID_Staff"    ACL     ?   GRANT SELECT("ID_Staff") ON TABLE "public"."Staff" TO "tourism_staff";
GRANT SELECT("ID_Staff") ON TABLE "public"."Staff" TO "tourism_guest";
            public       postgres    false    218                       0    0    COLUMN "Staff"."login"    ACL     ?   GRANT SELECT("login") ON TABLE "public"."Staff" TO "tourism_staff";
GRANT SELECT("login") ON TABLE "public"."Staff" TO "tourism_guest";
            public       postgres    false    218                       0    0    COLUMN "Staff"."passw"    ACL     ?   GRANT SELECT("passw") ON TABLE "public"."Staff" TO "tourism_staff";
GRANT SELECT("passw") ON TABLE "public"."Staff" TO "tourism_guest";
            public       postgres    false    218                       0    0    COLUMN "Staff"."role_user"    ACL     ?   GRANT SELECT("role_user") ON TABLE "public"."Staff" TO "tourism_staff";
GRANT SELECT("role_user") ON TABLE "public"."Staff" TO "tourism_guest";
            public       postgres    false    218            ?            1259    18179    Staff_ID_Staff_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."Staff_ID_Staff_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE "public"."Staff_ID_Staff_seq";
       public       postgres    false    3    218                       0    0    Staff_ID_Staff_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE "public"."Staff_ID_Staff_seq" OWNED BY "public"."Staff"."ID_Staff";
            public       postgres    false    217                       0    0    SEQUENCE "Staff_ID_Staff_seq"    ACL     L  GRANT SELECT,USAGE ON SEQUENCE "public"."Staff_ID_Staff_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."Staff_ID_Staff_seq" TO "tourism_developer";
GRANT SELECT,USAGE ON SEQUENCE "public"."Staff_ID_Staff_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."Staff_ID_Staff_seq" TO "tourism_client";
            public       postgres    false    217            ?            1259    18265    Staff_excursion    TABLE     r   CREATE TABLE "public"."Staff_excursion" (
    "ID_Staff" integer NOT NULL,
    "ID_excursion" integer NOT NULL
);
 '   DROP TABLE "public"."Staff_excursion";
       public         postgres    false    3            	           0    0    TABLE "Staff_excursion"    ACL     ?   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."Staff_excursion" TO "tourism_developer";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."Staff_excursion" TO "tourism_director";
            public       postgres    false    231            ?            1259    18173    Transcending work    TABLE     y  CREATE TABLE "public"."Transcending work" (
    "hired" timestamp without time zone NOT NULL,
    "quit" timestamp without time zone NOT NULL,
    "ID_Transcending work" integer NOT NULL,
    "Past position" character(48) NOT NULL,
    "Kind of activity" character(80) NOT NULL,
    "Grounds for dismissal" character(200) NOT NULL,
    "organization" character(80) NOT NULL
);
 )   DROP TABLE "public"."Transcending work";
       public         postgres    false    3            
           0    0    TABLE "Transcending work"    ACL     ?   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."Transcending work" TO "tourism_developer";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."Transcending work" TO "tourism_director";
            public       postgres    false    216            ?            1259    18171 *   Transcending work_ID_Transcending work_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."Transcending work_ID_Transcending work_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE "public"."Transcending work_ID_Transcending work_seq";
       public       postgres    false    3    216                       0    0 *   Transcending work_ID_Transcending work_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE "public"."Transcending work_ID_Transcending work_seq" OWNED BY "public"."Transcending work"."ID_Transcending work";
            public       postgres    false    215                       0    0 5   SEQUENCE "Transcending work_ID_Transcending work_seq"    ACL     ?  GRANT SELECT,USAGE ON SEQUENCE "public"."Transcending work_ID_Transcending work_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."Transcending work_ID_Transcending work_seq" TO "tourism_developer";
GRANT SELECT,USAGE ON SEQUENCE "public"."Transcending work_ID_Transcending work_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."Transcending work_ID_Transcending work_seq" TO "tourism_client";
            public       postgres    false    215            ?            1259    18210 
   attraction    TABLE     ?   CREATE TABLE "public"."attraction" (
    "name_of_attraction" character(160) NOT NULL,
    "ID_attraction" integer NOT NULL,
    "Description_of_Attraction" character(200) NOT NULL
);
 "   DROP TABLE "public"."attraction";
       public         postgres    false    3                       0    0    TABLE "attraction"    ACL     ?   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."attraction" TO "tourism_developer";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."attraction" TO "tourism_director";
            public       postgres    false    224            ?            1259    18208    attraction_ID_attraction_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."attraction_ID_attraction_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE "public"."attraction_ID_attraction_seq";
       public       postgres    false    224    3                       0    0    attraction_ID_attraction_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE "public"."attraction_ID_attraction_seq" OWNED BY "public"."attraction"."ID_attraction";
            public       postgres    false    223                       0    0 '   SEQUENCE "attraction_ID_attraction_seq"    ACL     t  GRANT SELECT,USAGE ON SEQUENCE "public"."attraction_ID_attraction_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."attraction_ID_attraction_seq" TO "tourism_developer";
GRANT SELECT,USAGE ON SEQUENCE "public"."attraction_ID_attraction_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."attraction_ID_attraction_seq" TO "tourism_client";
            public       postgres    false    223            ?            1259    17692 
   auth_group    TABLE     n   CREATE TABLE "public"."auth_group" (
    "id" integer NOT NULL,
    "name" character varying(150) NOT NULL
);
 "   DROP TABLE "public"."auth_group";
       public         tourism_developer    false    3                       0    0    TABLE "auth_group"    ACL     k   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."auth_group" TO "tourism_director";
            public       tourism_developer    false    203            ?            1259    17690    auth_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."auth_group_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE "public"."auth_group_id_seq";
       public       tourism_developer    false    203    3                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE "public"."auth_group_id_seq" OWNED BY "public"."auth_group"."id";
            public       tourism_developer    false    202                       0    0    SEQUENCE "auth_group_id_seq"    ACL     ?   GRANT SELECT,USAGE ON SEQUENCE "public"."auth_group_id_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."auth_group_id_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."auth_group_id_seq" TO "tourism_client";
            public       tourism_developer    false    202            ?            1259    17702    auth_group_permissions    TABLE     ?   CREATE TABLE "public"."auth_group_permissions" (
    "id" integer NOT NULL,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL
);
 .   DROP TABLE "public"."auth_group_permissions";
       public         tourism_developer    false    3                       0    0    TABLE "auth_group_permissions"    ACL     w   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."auth_group_permissions" TO "tourism_director";
            public       tourism_developer    false    205            ?            1259    17700    auth_group_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."auth_group_permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE "public"."auth_group_permissions_id_seq";
       public       tourism_developer    false    3    205                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE "public"."auth_group_permissions_id_seq" OWNED BY "public"."auth_group_permissions"."id";
            public       tourism_developer    false    204                       0    0 (   SEQUENCE "auth_group_permissions_id_seq"    ACL       GRANT SELECT,USAGE ON SEQUENCE "public"."auth_group_permissions_id_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."auth_group_permissions_id_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."auth_group_permissions_id_seq" TO "tourism_client";
            public       tourism_developer    false    204            ?            1259    17684    auth_permission    TABLE     ?   CREATE TABLE "public"."auth_permission" (
    "id" integer NOT NULL,
    "name" character varying(255) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" character varying(100) NOT NULL
);
 '   DROP TABLE "public"."auth_permission";
       public         tourism_developer    false    3                       0    0    TABLE "auth_permission"    ACL     p   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."auth_permission" TO "tourism_director";
            public       tourism_developer    false    201            ?            1259    17682    auth_permission_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."auth_permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE "public"."auth_permission_id_seq";
       public       tourism_developer    false    201    3                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE "public"."auth_permission_id_seq" OWNED BY "public"."auth_permission"."id";
            public       tourism_developer    false    200                       0    0 !   SEQUENCE "auth_permission_id_seq"    ACL       GRANT SELECT,USAGE ON SEQUENCE "public"."auth_permission_id_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."auth_permission_id_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."auth_permission_id_seq" TO "tourism_client";
            public       tourism_developer    false    200            ?            1259    17710 	   auth_user    TABLE     ?  CREATE TABLE "public"."auth_user" (
    "id" integer NOT NULL,
    "password" character varying(128) NOT NULL,
    "last_login" timestamp with time zone,
    "is_superuser" boolean NOT NULL,
    "username" character varying(150) NOT NULL,
    "first_name" character varying(150) NOT NULL,
    "last_name" character varying(150) NOT NULL,
    "email" character varying(254) NOT NULL,
    "is_staff" boolean NOT NULL,
    "is_active" boolean NOT NULL,
    "date_joined" timestamp with time zone NOT NULL
);
 !   DROP TABLE "public"."auth_user";
       public         tourism_developer    false    3                       0    0    TABLE "auth_user"    ACL     j   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."auth_user" TO "tourism_director";
            public       tourism_developer    false    207            ?            1259    17720    auth_user_groups    TABLE     ?   CREATE TABLE "public"."auth_user_groups" (
    "id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL
);
 (   DROP TABLE "public"."auth_user_groups";
       public         tourism_developer    false    3                       0    0    TABLE "auth_user_groups"    ACL     q   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."auth_user_groups" TO "tourism_director";
            public       tourism_developer    false    209            ?            1259    17718    auth_user_groups_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."auth_user_groups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE "public"."auth_user_groups_id_seq";
       public       tourism_developer    false    209    3                       0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE "public"."auth_user_groups_id_seq" OWNED BY "public"."auth_user_groups"."id";
            public       tourism_developer    false    208                       0    0 "   SEQUENCE "auth_user_groups_id_seq"    ACL       GRANT SELECT,USAGE ON SEQUENCE "public"."auth_user_groups_id_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."auth_user_groups_id_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."auth_user_groups_id_seq" TO "tourism_client";
            public       tourism_developer    false    208            ?            1259    17708    auth_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."auth_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE "public"."auth_user_id_seq";
       public       tourism_developer    false    3    207                       0    0    auth_user_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE "public"."auth_user_id_seq" OWNED BY "public"."auth_user"."id";
            public       tourism_developer    false    206                       0    0    SEQUENCE "auth_user_id_seq"    ACL     ?   GRANT SELECT,USAGE ON SEQUENCE "public"."auth_user_id_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."auth_user_id_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."auth_user_id_seq" TO "tourism_client";
            public       tourism_developer    false    206            ?            1259    17728    auth_user_user_permissions    TABLE     ?   CREATE TABLE "public"."auth_user_user_permissions" (
    "id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL
);
 2   DROP TABLE "public"."auth_user_user_permissions";
       public         tourism_developer    false    3                       0    0 "   TABLE "auth_user_user_permissions"    ACL     {   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."auth_user_user_permissions" TO "tourism_director";
            public       tourism_developer    false    211            ?            1259    17726 !   auth_user_user_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."auth_user_user_permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE "public"."auth_user_user_permissions_id_seq";
       public       tourism_developer    false    211    3                        0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE "public"."auth_user_user_permissions_id_seq" OWNED BY "public"."auth_user_user_permissions"."id";
            public       tourism_developer    false    210            !           0    0 ,   SEQUENCE "auth_user_user_permissions_id_seq"    ACL     $  GRANT SELECT,USAGE ON SEQUENCE "public"."auth_user_user_permissions_id_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."auth_user_user_permissions_id_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."auth_user_user_permissions_id_seq" TO "tourism_client";
            public       tourism_developer    false    210            ?            1259    17788    django_admin_log    TABLE     ?  CREATE TABLE "public"."django_admin_log" (
    "id" integer NOT NULL,
    "action_time" timestamp with time zone NOT NULL,
    "object_id" "text",
    "object_repr" character varying(200) NOT NULL,
    "action_flag" smallint NOT NULL,
    "change_message" "text" NOT NULL,
    "content_type_id" integer,
    "user_id" integer NOT NULL,
    CONSTRAINT "django_admin_log_action_flag_check" CHECK (("action_flag" >= 0))
);
 (   DROP TABLE "public"."django_admin_log";
       public         tourism_developer    false    3            "           0    0    TABLE "django_admin_log"    ACL     q   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."django_admin_log" TO "tourism_director";
            public       tourism_developer    false    213            ?            1259    17786    django_admin_log_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."django_admin_log_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE "public"."django_admin_log_id_seq";
       public       tourism_developer    false    3    213            #           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE "public"."django_admin_log_id_seq" OWNED BY "public"."django_admin_log"."id";
            public       tourism_developer    false    212            $           0    0 "   SEQUENCE "django_admin_log_id_seq"    ACL       GRANT SELECT,USAGE ON SEQUENCE "public"."django_admin_log_id_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."django_admin_log_id_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."django_admin_log_id_seq" TO "tourism_client";
            public       tourism_developer    false    212            ?            1259    17674    django_content_type    TABLE     ?   CREATE TABLE "public"."django_content_type" (
    "id" integer NOT NULL,
    "app_label" character varying(100) NOT NULL,
    "model" character varying(100) NOT NULL
);
 +   DROP TABLE "public"."django_content_type";
       public         tourism_developer    false    3            %           0    0    TABLE "django_content_type"    ACL     t   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."django_content_type" TO "tourism_director";
            public       tourism_developer    false    199            ?            1259    17672    django_content_type_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."django_content_type_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "public"."django_content_type_id_seq";
       public       tourism_developer    false    199    3            &           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE "public"."django_content_type_id_seq" OWNED BY "public"."django_content_type"."id";
            public       tourism_developer    false    198            '           0    0 %   SEQUENCE "django_content_type_id_seq"    ACL       GRANT SELECT,USAGE ON SEQUENCE "public"."django_content_type_id_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."django_content_type_id_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."django_content_type_id_seq" TO "tourism_client";
            public       tourism_developer    false    198            ?            1259    17663    django_migrations    TABLE     ?   CREATE TABLE "public"."django_migrations" (
    "id" integer NOT NULL,
    "app" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "applied" timestamp with time zone NOT NULL
);
 )   DROP TABLE "public"."django_migrations";
       public         tourism_developer    false    3            (           0    0    TABLE "django_migrations"    ACL     r   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."django_migrations" TO "tourism_director";
            public       tourism_developer    false    197            ?            1259    17661    django_migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."django_migrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE "public"."django_migrations_id_seq";
       public       tourism_developer    false    197    3            )           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "public"."django_migrations_id_seq" OWNED BY "public"."django_migrations"."id";
            public       tourism_developer    false    196            *           0    0 #   SEQUENCE "django_migrations_id_seq"    ACL     	  GRANT SELECT,USAGE ON SEQUENCE "public"."django_migrations_id_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."django_migrations_id_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."django_migrations_id_seq" TO "tourism_client";
            public       tourism_developer    false    196            ?            1259    17819    django_session    TABLE     ?   CREATE TABLE "public"."django_session" (
    "session_key" character varying(40) NOT NULL,
    "session_data" "text" NOT NULL,
    "expire_date" timestamp with time zone NOT NULL
);
 &   DROP TABLE "public"."django_session";
       public         tourism_developer    false    3            +           0    0    TABLE "django_session"    ACL     o   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."django_session" TO "tourism_director";
            public       tourism_developer    false    214            ?            1259    18241 	   excursion    TABLE     ?   CREATE TABLE "public"."excursion" (
    "ID_excursion" integer NOT NULL,
    "Price" "money" NOT NULL,
    "start_of_route" integer NOT NULL,
    "number of seats" integer NOT NULL
);
 !   DROP TABLE "public"."excursion";
       public         postgres    false    3            ,           0    0    TABLE "excursion"    ACL     ?   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."excursion" TO "tourism_developer";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."excursion" TO "tourism_director";
            public       postgres    false    228            ?            1259    18239    excursion_ID_excursion_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."excursion_ID_excursion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "public"."excursion_ID_excursion_seq";
       public       postgres    false    3    228            -           0    0    excursion_ID_excursion_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE "public"."excursion_ID_excursion_seq" OWNED BY "public"."excursion"."ID_excursion";
            public       postgres    false    227            .           0    0 %   SEQUENCE "excursion_ID_excursion_seq"    ACL     l  GRANT SELECT,USAGE ON SEQUENCE "public"."excursion_ID_excursion_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."excursion_ID_excursion_seq" TO "tourism_developer";
GRANT SELECT,USAGE ON SEQUENCE "public"."excursion_ID_excursion_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."excursion_ID_excursion_seq" TO "tourism_client";
            public       postgres    false    227            ?            1259    18254 	   timetable    TABLE       CREATE TABLE "public"."timetable" (
    "day_of_the_week" character(30) NOT NULL,
    "start_time" timestamp without time zone NOT NULL,
    "End_time" timestamp without time zone NOT NULL,
    "ID_timetable" integer NOT NULL,
    "excursion_numbers" integer NOT NULL
);
 !   DROP TABLE "public"."timetable";
       public         postgres    false    3            /           0    0    TABLE "timetable"    ACL     ?   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."timetable" TO "tourism_developer";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."timetable" TO "tourism_director";
            public       postgres    false    230            ?            1259    18252    timetable_ID_timetable_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."timetable_ID_timetable_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "public"."timetable_ID_timetable_seq";
       public       postgres    false    3    230            0           0    0    timetable_ID_timetable_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE "public"."timetable_ID_timetable_seq" OWNED BY "public"."timetable"."ID_timetable";
            public       postgres    false    229            1           0    0 %   SEQUENCE "timetable_ID_timetable_seq"    ACL     l  GRANT SELECT,USAGE ON SEQUENCE "public"."timetable_ID_timetable_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."timetable_ID_timetable_seq" TO "tourism_developer";
GRANT SELECT,USAGE ON SEQUENCE "public"."timetable_ID_timetable_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."timetable_ID_timetable_seq" TO "tourism_client";
            public       postgres    false    229            ?            1259    18202    types of transport    TABLE     ?   CREATE TABLE "public"."types of transport" (
    "name_of_transport" character(160) NOT NULL,
    "ID_transport" integer NOT NULL
);
 *   DROP TABLE "public"."types of transport";
       public         postgres    false    3            2           0    0    TABLE "types of transport"    ACL     ?   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."types of transport" TO "tourism_developer";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "public"."types of transport" TO "tourism_director";
            public       postgres    false    222            ?            1259    18200 #   types of transport_ID_transport_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."types of transport_ID_transport_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE "public"."types of transport_ID_transport_seq";
       public       postgres    false    3    222            3           0    0 #   types of transport_ID_transport_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE "public"."types of transport_ID_transport_seq" OWNED BY "public"."types of transport"."ID_transport";
            public       postgres    false    221            4           0    0 .   SEQUENCE "types of transport_ID_transport_seq"    ACL     ?  GRANT SELECT,USAGE ON SEQUENCE "public"."types of transport_ID_transport_seq" TO "tourism_director";
GRANT SELECT,USAGE ON SEQUENCE "public"."types of transport_ID_transport_seq" TO "tourism_developer";
GRANT SELECT,USAGE ON SEQUENCE "public"."types of transport_ID_transport_seq" TO "tourism_staff";
GRANT SELECT,USAGE ON SEQUENCE "public"."types of transport_ID_transport_seq" TO "tourism_client";
            public       postgres    false    221            ?
           2604    18197    Client ID_Client    DEFAULT     ?   ALTER TABLE ONLY "public"."Client" ALTER COLUMN "ID_Client" SET DEFAULT "nextval"('"public"."Client_ID_Client_seq"'::"regclass");
 E   ALTER TABLE "public"."Client" ALTER COLUMN "ID_Client" DROP DEFAULT;
       public       postgres    false    219    220    220            ?
           2604    18221    Route ID_Route    DEFAULT     ~   ALTER TABLE ONLY "public"."Route" ALTER COLUMN "ID_Route" SET DEFAULT "nextval"('"public"."Route_ID_Route_seq"'::"regclass");
 C   ALTER TABLE "public"."Route" ALTER COLUMN "ID_Route" DROP DEFAULT;
       public       postgres    false    226    225    226            ?
           2604    18184    Staff ID_Staff    DEFAULT     ~   ALTER TABLE ONLY "public"."Staff" ALTER COLUMN "ID_Staff" SET DEFAULT "nextval"('"public"."Staff_ID_Staff_seq"'::"regclass");
 C   ALTER TABLE "public"."Staff" ALTER COLUMN "ID_Staff" DROP DEFAULT;
       public       postgres    false    217    218    218            ?
           2604    18176 &   Transcending work ID_Transcending work    DEFAULT     ?   ALTER TABLE ONLY "public"."Transcending work" ALTER COLUMN "ID_Transcending work" SET DEFAULT "nextval"('"public"."Transcending work_ID_Transcending work_seq"'::"regclass");
 [   ALTER TABLE "public"."Transcending work" ALTER COLUMN "ID_Transcending work" DROP DEFAULT;
       public       postgres    false    216    215    216            ?
           2604    18213    attraction ID_attraction    DEFAULT     ?   ALTER TABLE ONLY "public"."attraction" ALTER COLUMN "ID_attraction" SET DEFAULT "nextval"('"public"."attraction_ID_attraction_seq"'::"regclass");
 M   ALTER TABLE "public"."attraction" ALTER COLUMN "ID_attraction" DROP DEFAULT;
       public       postgres    false    224    223    224            ?
           2604    17695    auth_group id    DEFAULT     |   ALTER TABLE ONLY "public"."auth_group" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."auth_group_id_seq"'::"regclass");
 B   ALTER TABLE "public"."auth_group" ALTER COLUMN "id" DROP DEFAULT;
       public       tourism_developer    false    203    202    203            ?
           2604    17705    auth_group_permissions id    DEFAULT     ?   ALTER TABLE ONLY "public"."auth_group_permissions" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."auth_group_permissions_id_seq"'::"regclass");
 N   ALTER TABLE "public"."auth_group_permissions" ALTER COLUMN "id" DROP DEFAULT;
       public       tourism_developer    false    204    205    205            ?
           2604    17687    auth_permission id    DEFAULT     ?   ALTER TABLE ONLY "public"."auth_permission" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."auth_permission_id_seq"'::"regclass");
 G   ALTER TABLE "public"."auth_permission" ALTER COLUMN "id" DROP DEFAULT;
       public       tourism_developer    false    200    201    201            ?
           2604    17713    auth_user id    DEFAULT     z   ALTER TABLE ONLY "public"."auth_user" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."auth_user_id_seq"'::"regclass");
 A   ALTER TABLE "public"."auth_user" ALTER COLUMN "id" DROP DEFAULT;
       public       tourism_developer    false    207    206    207            ?
           2604    17723    auth_user_groups id    DEFAULT     ?   ALTER TABLE ONLY "public"."auth_user_groups" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."auth_user_groups_id_seq"'::"regclass");
 H   ALTER TABLE "public"."auth_user_groups" ALTER COLUMN "id" DROP DEFAULT;
       public       tourism_developer    false    209    208    209            ?
           2604    17731    auth_user_user_permissions id    DEFAULT     ?   ALTER TABLE ONLY "public"."auth_user_user_permissions" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."auth_user_user_permissions_id_seq"'::"regclass");
 R   ALTER TABLE "public"."auth_user_user_permissions" ALTER COLUMN "id" DROP DEFAULT;
       public       tourism_developer    false    210    211    211            ?
           2604    17791    django_admin_log id    DEFAULT     ?   ALTER TABLE ONLY "public"."django_admin_log" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_admin_log_id_seq"'::"regclass");
 H   ALTER TABLE "public"."django_admin_log" ALTER COLUMN "id" DROP DEFAULT;
       public       tourism_developer    false    213    212    213            ?
           2604    17677    django_content_type id    DEFAULT     ?   ALTER TABLE ONLY "public"."django_content_type" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_content_type_id_seq"'::"regclass");
 K   ALTER TABLE "public"."django_content_type" ALTER COLUMN "id" DROP DEFAULT;
       public       tourism_developer    false    198    199    199            ?
           2604    17666    django_migrations id    DEFAULT     ?   ALTER TABLE ONLY "public"."django_migrations" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_migrations_id_seq"'::"regclass");
 I   ALTER TABLE "public"."django_migrations" ALTER COLUMN "id" DROP DEFAULT;
       public       tourism_developer    false    197    196    197            ?
           2604    18244    excursion ID_excursion    DEFAULT     ?   ALTER TABLE ONLY "public"."excursion" ALTER COLUMN "ID_excursion" SET DEFAULT "nextval"('"public"."excursion_ID_excursion_seq"'::"regclass");
 K   ALTER TABLE "public"."excursion" ALTER COLUMN "ID_excursion" DROP DEFAULT;
       public       postgres    false    228    227    228            ?
           2604    18257    timetable ID_timetable    DEFAULT     ?   ALTER TABLE ONLY "public"."timetable" ALTER COLUMN "ID_timetable" SET DEFAULT "nextval"('"public"."timetable_ID_timetable_seq"'::"regclass");
 K   ALTER TABLE "public"."timetable" ALTER COLUMN "ID_timetable" DROP DEFAULT;
       public       postgres    false    229    230    230            ?
           2604    18205    types of transport ID_transport    DEFAULT     ?   ALTER TABLE ONLY "public"."types of transport" ALTER COLUMN "ID_transport" SET DEFAULT "nextval"('"public"."types of transport_ID_transport_seq"'::"regclass");
 T   ALTER TABLE "public"."types of transport" ALTER COLUMN "ID_transport" DROP DEFAULT;
       public       postgres    false    221    222    222            ?          0    18194    Client 
   TABLE DATA                     public       postgres    false    220   ?'      ?          0    18280    Klient_Raspisanie 
   TABLE DATA                     public       postgres    false    232   n*      ?          0    18218    Route 
   TABLE DATA                     public       postgres    false    226   J+      ?          0    18181    Staff 
   TABLE DATA                     public       postgres    false    218   -      ?          0    18265    Staff_excursion 
   TABLE DATA                     public       postgres    false    231   61      ?          0    18173    Transcending work 
   TABLE DATA                     public       postgres    false    216   ?1      ?          0    18210 
   attraction 
   TABLE DATA                     public       postgres    false    224   3      ?          0    17692 
   auth_group 
   TABLE DATA                     public       tourism_developer    false    203   ?8      ?          0    17702    auth_group_permissions 
   TABLE DATA                     public       tourism_developer    false    205   ?8      ?          0    17684    auth_permission 
   TABLE DATA                     public       tourism_developer    false    201   ?8      ?          0    17710 	   auth_user 
   TABLE DATA                     public       tourism_developer    false    207   ?=      ?          0    17720    auth_user_groups 
   TABLE DATA                     public       tourism_developer    false    209   ?>      ?          0    17728    auth_user_user_permissions 
   TABLE DATA                     public       tourism_developer    false    211   ?      ?          0    17788    django_admin_log 
   TABLE DATA                     public       tourism_developer    false    213   .?      ?          0    17674    django_content_type 
   TABLE DATA                     public       tourism_developer    false    199   H?      ?          0    17663    django_migrations 
   TABLE DATA                     public       tourism_developer    false    197   ?@      ?          0    17819    django_session 
   TABLE DATA                     public       tourism_developer    false    214   ?B      ?          0    18241 	   excursion 
   TABLE DATA                     public       postgres    false    228   ?D      ?          0    18254 	   timetable 
   TABLE DATA                     public       postgres    false    230   ?E      ?          0    18202    types of transport 
   TABLE DATA                     public       postgres    false    222   ?F      5           0    0    Client_ID_Client_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('"public"."Client_ID_Client_seq"', 10, true);
            public       postgres    false    219            6           0    0    Route_ID_Route_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('"public"."Route_ID_Route_seq"', 14, true);
            public       postgres    false    225            7           0    0    Staff_ID_Staff_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('"public"."Staff_ID_Staff_seq"', 11, true);
            public       postgres    false    217            8           0    0 *   Transcending work_ID_Transcending work_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('"public"."Transcending work_ID_Transcending work_seq"', 2, true);
            public       postgres    false    215            9           0    0    attraction_ID_attraction_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('"public"."attraction_ID_attraction_seq"', 10, true);
            public       postgres    false    223            :           0    0    auth_group_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"public"."auth_group_id_seq"', 1, false);
            public       tourism_developer    false    202            ;           0    0    auth_group_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('"public"."auth_group_permissions_id_seq"', 1, false);
            public       tourism_developer    false    204            <           0    0    auth_permission_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('"public"."auth_permission_id_seq"', 104, true);
            public       tourism_developer    false    200            =           0    0    auth_user_groups_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('"public"."auth_user_groups_id_seq"', 1, false);
            public       tourism_developer    false    208            >           0    0    auth_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('"public"."auth_user_id_seq"', 1, true);
            public       tourism_developer    false    206            ?           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('"public"."auth_user_user_permissions_id_seq"', 1, false);
            public       tourism_developer    false    210            @           0    0    django_admin_log_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('"public"."django_admin_log_id_seq"', 1, false);
            public       tourism_developer    false    212            A           0    0    django_content_type_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"public"."django_content_type_id_seq"', 26, true);
            public       tourism_developer    false    198            B           0    0    django_migrations_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('"public"."django_migrations_id_seq"', 18, true);
            public       tourism_developer    false    196            C           0    0    excursion_ID_excursion_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"public"."excursion_ID_excursion_seq"', 5, true);
            public       postgres    false    227            D           0    0    timetable_ID_timetable_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"public"."timetable_ID_timetable_seq"', 5, true);
            public       postgres    false    229            E           0    0 #   types of transport_ID_transport_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('"public"."types of transport_ID_transport_seq"', 4, true);
            public       postgres    false    221            +           2606    35917    Client Client_login_key 
   CONSTRAINT     [   ALTER TABLE ONLY "public"."Client"
    ADD CONSTRAINT "Client_login_key" UNIQUE ("login");
 G   ALTER TABLE ONLY "public"."Client" DROP CONSTRAINT "Client_login_key";
       public         postgres    false    220            -           2606    35919    Client Client_login_key1 
   CONSTRAINT     \   ALTER TABLE ONLY "public"."Client"
    ADD CONSTRAINT "Client_login_key1" UNIQUE ("login");
 H   ALTER TABLE ONLY "public"."Client" DROP CONSTRAINT "Client_login_key1";
       public         postgres    false    220            /           2606    18199    Client Client_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "public"."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY ("ID_Client");
 B   ALTER TABLE ONLY "public"."Client" DROP CONSTRAINT "Client_pkey";
       public         postgres    false    220            =           2606    18284 (   Klient_Raspisanie Klient_Raspisanie_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY "public"."Klient_Raspisanie"
    ADD CONSTRAINT "Klient_Raspisanie_pkey" PRIMARY KEY ("ID_Client", "ID_excursion", "Date");
 X   ALTER TABLE ONLY "public"."Klient_Raspisanie" DROP CONSTRAINT "Klient_Raspisanie_pkey";
       public         postgres    false    232    232    232            5           2606    18223    Route Route_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY "public"."Route"
    ADD CONSTRAINT "Route_pkey" PRIMARY KEY ("ID_Route");
 @   ALTER TABLE ONLY "public"."Route" DROP CONSTRAINT "Route_pkey";
       public         postgres    false    226            ;           2606    18269 $   Staff_excursion Staff_excursion_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY "public"."Staff_excursion"
    ADD CONSTRAINT "Staff_excursion_pkey" PRIMARY KEY ("ID_Staff", "ID_excursion");
 T   ALTER TABLE ONLY "public"."Staff_excursion" DROP CONSTRAINT "Staff_excursion_pkey";
       public         postgres    false    231    231            )           2606    18186    Staff Staff_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY "public"."Staff"
    ADD CONSTRAINT "Staff_pkey" PRIMARY KEY ("ID_Staff");
 @   ALTER TABLE ONLY "public"."Staff" DROP CONSTRAINT "Staff_pkey";
       public         postgres    false    218            '           2606    18178 (   Transcending work Transcending work_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY "public"."Transcending work"
    ADD CONSTRAINT "Transcending work_pkey" PRIMARY KEY ("ID_Transcending work");
 X   ALTER TABLE ONLY "public"."Transcending work" DROP CONSTRAINT "Transcending work_pkey";
       public         postgres    false    216            3           2606    18215    attraction attraction_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY "public"."attraction"
    ADD CONSTRAINT "attraction_pkey" PRIMARY KEY ("ID_attraction");
 J   ALTER TABLE ONLY "public"."attraction" DROP CONSTRAINT "attraction_pkey";
       public         postgres    false    224                       2606    17817    auth_group auth_group_name_key 
   CONSTRAINT     a   ALTER TABLE ONLY "public"."auth_group"
    ADD CONSTRAINT "auth_group_name_key" UNIQUE ("name");
 N   ALTER TABLE ONLY "public"."auth_group" DROP CONSTRAINT "auth_group_name_key";
       public         tourism_developer    false    203            	           2606    17744 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" UNIQUE ("group_id", "permission_id");
 ?   ALTER TABLE ONLY "public"."auth_group_permissions" DROP CONSTRAINT "auth_group_permissions_group_id_permission_id_0cd325b0_uniq";
       public         tourism_developer    false    205    205                       2606    17707 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_pkey" PRIMARY KEY ("id");
 b   ALTER TABLE ONLY "public"."auth_group_permissions" DROP CONSTRAINT "auth_group_permissions_pkey";
       public         tourism_developer    false    205                       2606    17697    auth_group auth_group_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY "public"."auth_group"
    ADD CONSTRAINT "auth_group_pkey" PRIMARY KEY ("id");
 J   ALTER TABLE ONLY "public"."auth_group" DROP CONSTRAINT "auth_group_pkey";
       public         tourism_developer    false    203            ?
           2606    17735 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_content_type_id_codename_01ab375a_uniq" UNIQUE ("content_type_id", "codename");
 v   ALTER TABLE ONLY "public"."auth_permission" DROP CONSTRAINT "auth_permission_content_type_id_codename_01ab375a_uniq";
       public         tourism_developer    false    201    201                       2606    17689 $   auth_permission auth_permission_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id");
 T   ALTER TABLE ONLY "public"."auth_permission" DROP CONSTRAINT "auth_permission_pkey";
       public         tourism_developer    false    201                       2606    17725 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY "public"."auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_pkey" PRIMARY KEY ("id");
 V   ALTER TABLE ONLY "public"."auth_user_groups" DROP CONSTRAINT "auth_user_groups_pkey";
       public         tourism_developer    false    209                       2606    17759 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY "public"."auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_user_id_group_id_94350c0c_uniq" UNIQUE ("user_id", "group_id");
 p   ALTER TABLE ONLY "public"."auth_user_groups" DROP CONSTRAINT "auth_user_groups_user_id_group_id_94350c0c_uniq";
       public         tourism_developer    false    209    209                       2606    17715    auth_user auth_user_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY "public"."auth_user"
    ADD CONSTRAINT "auth_user_pkey" PRIMARY KEY ("id");
 H   ALTER TABLE ONLY "public"."auth_user" DROP CONSTRAINT "auth_user_pkey";
       public         tourism_developer    false    207                       2606    17733 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY "public"."auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permissions_pkey" PRIMARY KEY ("id");
 j   ALTER TABLE ONLY "public"."auth_user_user_permissions" DROP CONSTRAINT "auth_user_user_permissions_pkey";
       public         tourism_developer    false    211                       2606    17773 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY "public"."auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" UNIQUE ("user_id", "permission_id");
 ?   ALTER TABLE ONLY "public"."auth_user_user_permissions" DROP CONSTRAINT "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq";
       public         tourism_developer    false    211    211                       2606    17811     auth_user auth_user_username_key 
   CONSTRAINT     g   ALTER TABLE ONLY "public"."auth_user"
    ADD CONSTRAINT "auth_user_username_key" UNIQUE ("username");
 P   ALTER TABLE ONLY "public"."auth_user" DROP CONSTRAINT "auth_user_username_key";
       public         tourism_developer    false    207                        2606    17797 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id");
 V   ALTER TABLE ONLY "public"."django_admin_log" DROP CONSTRAINT "django_admin_log_pkey";
       public         tourism_developer    false    213            ?
           2606    17681 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY "public"."django_content_type"
    ADD CONSTRAINT "django_content_type_app_label_model_76bd3d3b_uniq" UNIQUE ("app_label", "model");
 u   ALTER TABLE ONLY "public"."django_content_type" DROP CONSTRAINT "django_content_type_app_label_model_76bd3d3b_uniq";
       public         tourism_developer    false    199    199            ?
           2606    17679 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY "public"."django_content_type"
    ADD CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id");
 \   ALTER TABLE ONLY "public"."django_content_type" DROP CONSTRAINT "django_content_type_pkey";
       public         tourism_developer    false    199            ?
           2606    17671 (   django_migrations django_migrations_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY "public"."django_migrations"
    ADD CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id");
 X   ALTER TABLE ONLY "public"."django_migrations" DROP CONSTRAINT "django_migrations_pkey";
       public         tourism_developer    false    197            $           2606    17826 "   django_session django_session_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY "public"."django_session"
    ADD CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key");
 R   ALTER TABLE ONLY "public"."django_session" DROP CONSTRAINT "django_session_pkey";
       public         tourism_developer    false    214            7           2606    18246    excursion excursion_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY "public"."excursion"
    ADD CONSTRAINT "excursion_pkey" PRIMARY KEY ("ID_excursion");
 H   ALTER TABLE ONLY "public"."excursion" DROP CONSTRAINT "excursion_pkey";
       public         postgres    false    228            9           2606    18259    timetable timetable_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY "public"."timetable"
    ADD CONSTRAINT "timetable_pkey" PRIMARY KEY ("ID_timetable");
 H   ALTER TABLE ONLY "public"."timetable" DROP CONSTRAINT "timetable_pkey";
       public         postgres    false    230            1           2606    18207 *   types of transport types of transport_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY "public"."types of transport"
    ADD CONSTRAINT "types of transport_pkey" PRIMARY KEY ("ID_transport");
 Z   ALTER TABLE ONLY "public"."types of transport" DROP CONSTRAINT "types of transport_pkey";
       public         postgres    false    222                       1259    17818    auth_group_name_a6ea08ec_like    INDEX     t   CREATE INDEX "auth_group_name_a6ea08ec_like" ON "public"."auth_group" USING "btree" ("name" "varchar_pattern_ops");
 5   DROP INDEX "public"."auth_group_name_a6ea08ec_like";
       public         tourism_developer    false    203                       1259    17755 (   auth_group_permissions_group_id_b120cbf9    INDEX     y   CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "public"."auth_group_permissions" USING "btree" ("group_id");
 @   DROP INDEX "public"."auth_group_permissions_group_id_b120cbf9";
       public         tourism_developer    false    205            
           1259    17756 -   auth_group_permissions_permission_id_84c5c92e    INDEX     ?   CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "public"."auth_group_permissions" USING "btree" ("permission_id");
 E   DROP INDEX "public"."auth_group_permissions_permission_id_84c5c92e";
       public         tourism_developer    false    205            ?
           1259    17741 (   auth_permission_content_type_id_2f476e4b    INDEX     y   CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "public"."auth_permission" USING "btree" ("content_type_id");
 @   DROP INDEX "public"."auth_permission_content_type_id_2f476e4b";
       public         tourism_developer    false    201                       1259    17771 "   auth_user_groups_group_id_97559544    INDEX     m   CREATE INDEX "auth_user_groups_group_id_97559544" ON "public"."auth_user_groups" USING "btree" ("group_id");
 :   DROP INDEX "public"."auth_user_groups_group_id_97559544";
       public         tourism_developer    false    209                       1259    17770 !   auth_user_groups_user_id_6a12ed8b    INDEX     k   CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "public"."auth_user_groups" USING "btree" ("user_id");
 9   DROP INDEX "public"."auth_user_groups_user_id_6a12ed8b";
       public         tourism_developer    false    209                       1259    17785 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     ?   CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "public"."auth_user_user_permissions" USING "btree" ("permission_id");
 I   DROP INDEX "public"."auth_user_user_permissions_permission_id_1fbb5f2c";
       public         tourism_developer    false    211                       1259    17784 +   auth_user_user_permissions_user_id_a95ead1b    INDEX        CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "public"."auth_user_user_permissions" USING "btree" ("user_id");
 C   DROP INDEX "public"."auth_user_user_permissions_user_id_a95ead1b";
       public         tourism_developer    false    211                       1259    17812     auth_user_username_6821ab7c_like    INDEX     z   CREATE INDEX "auth_user_username_6821ab7c_like" ON "public"."auth_user" USING "btree" ("username" "varchar_pattern_ops");
 8   DROP INDEX "public"."auth_user_username_6821ab7c_like";
       public         tourism_developer    false    207                       1259    17808 )   django_admin_log_content_type_id_c4bce8eb    INDEX     {   CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "public"."django_admin_log" USING "btree" ("content_type_id");
 A   DROP INDEX "public"."django_admin_log_content_type_id_c4bce8eb";
       public         tourism_developer    false    213            !           1259    17809 !   django_admin_log_user_id_c564eba6    INDEX     k   CREATE INDEX "django_admin_log_user_id_c564eba6" ON "public"."django_admin_log" USING "btree" ("user_id");
 9   DROP INDEX "public"."django_admin_log_user_id_c564eba6";
       public         tourism_developer    false    213            "           1259    17828 #   django_session_expire_date_a5c62663    INDEX     o   CREATE INDEX "django_session_expire_date_a5c62663" ON "public"."django_session" USING "btree" ("expire_date");
 ;   DROP INDEX "public"."django_session_expire_date_a5c62663";
       public         tourism_developer    false    214            %           1259    17827 (   django_session_session_key_c0390e0f_like    INDEX     ?   CREATE INDEX "django_session_session_key_c0390e0f_like" ON "public"."django_session" USING "btree" ("session_key" "varchar_pattern_ops");
 @   DROP INDEX "public"."django_session_session_key_c0390e0f_like";
       public         tourism_developer    false    214            O           2606    18285 2   Klient_Raspisanie Klient_Raspisanie_ID_Client_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."Klient_Raspisanie"
    ADD CONSTRAINT "Klient_Raspisanie_ID_Client_fkey" FOREIGN KEY ("ID_Client") REFERENCES "public"."Client"("ID_Client");
 b   ALTER TABLE ONLY "public"."Klient_Raspisanie" DROP CONSTRAINT "Klient_Raspisanie_ID_Client_fkey";
       public       postgres    false    220    2863    232            P           2606    18290 5   Klient_Raspisanie Klient_Raspisanie_ID_excursion_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."Klient_Raspisanie"
    ADD CONSTRAINT "Klient_Raspisanie_ID_excursion_fkey" FOREIGN KEY ("ID_excursion") REFERENCES "public"."excursion"("ID_excursion");
 e   ALTER TABLE ONLY "public"."Klient_Raspisanie" DROP CONSTRAINT "Klient_Raspisanie_ID_excursion_fkey";
       public       postgres    false    232    2871    228            J           2606    18234 &   Route Route_location_on_the_route_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."Route"
    ADD CONSTRAINT "Route_location_on_the_route_fkey" FOREIGN KEY ("location_on_the_route") REFERENCES "public"."attraction"("ID_attraction");
 V   ALTER TABLE ONLY "public"."Route" DROP CONSTRAINT "Route_location_on_the_route_fkey";
       public       postgres    false    226    224    2867            I           2606    18229     Route Route_next_Attraction_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."Route"
    ADD CONSTRAINT "Route_next_Attraction_fkey" FOREIGN KEY ("next_Attraction") REFERENCES "public"."Route"("ID_Route");
 P   ALTER TABLE ONLY "public"."Route" DROP CONSTRAINT "Route_next_Attraction_fkey";
       public       postgres    false    2869    226    226            H           2606    18224 2   Route Route_transport delivered to the sights_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."Route"
    ADD CONSTRAINT "Route_transport delivered to the sights_fkey" FOREIGN KEY ("transport delivered to the sights") REFERENCES "public"."types of transport"("ID_transport");
 b   ALTER TABLE ONLY "public"."Route" DROP CONSTRAINT "Route_transport delivered to the sights_fkey";
       public       postgres    false    226    2865    222            G           2606    18187 +   Staff Staff_The foremost place of work_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."Staff"
    ADD CONSTRAINT "Staff_The foremost place of work_fkey" FOREIGN KEY ("The foremost place of work") REFERENCES "public"."Transcending work"("ID_Transcending work");
 [   ALTER TABLE ONLY "public"."Staff" DROP CONSTRAINT "Staff_The foremost place of work_fkey";
       public       postgres    false    2855    218    216            M           2606    18270 -   Staff_excursion Staff_excursion_ID_Staff_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."Staff_excursion"
    ADD CONSTRAINT "Staff_excursion_ID_Staff_fkey" FOREIGN KEY ("ID_Staff") REFERENCES "public"."Staff"("ID_Staff");
 ]   ALTER TABLE ONLY "public"."Staff_excursion" DROP CONSTRAINT "Staff_excursion_ID_Staff_fkey";
       public       postgres    false    218    231    2857            N           2606    18275 1   Staff_excursion Staff_excursion_ID_excursion_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."Staff_excursion"
    ADD CONSTRAINT "Staff_excursion_ID_excursion_fkey" FOREIGN KEY ("ID_excursion") REFERENCES "public"."excursion"("ID_excursion");
 a   ALTER TABLE ONLY "public"."Staff_excursion" DROP CONSTRAINT "Staff_excursion_ID_excursion_fkey";
       public       postgres    false    228    231    2871            @           2606    17750 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY "public"."auth_group_permissions" DROP CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm";
       public       tourism_developer    false    2817    201    205            ?           2606    17745 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "public"."auth_group"("id") DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY "public"."auth_group_permissions" DROP CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id";
       public       tourism_developer    false    205    2822    203            >           2606    17736 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY "public"."auth_permission" DROP CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co";
       public       tourism_developer    false    201    2812    199            B           2606    17765 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "public"."auth_group"("id") DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY "public"."auth_user_groups" DROP CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id";
       public       tourism_developer    false    2822    203    209            A           2606    17760 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."auth_user"("id") DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY "public"."auth_user_groups" DROP CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id";
       public       tourism_developer    false    209    207    2830            D           2606    17779 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY "public"."auth_user_user_permissions" DROP CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm";
       public       tourism_developer    false    2817    211    201            C           2606    17774 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."auth_user"("id") DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY "public"."auth_user_user_permissions" DROP CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id";
       public       tourism_developer    false    207    2830    211            E           2606    17798 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY "public"."django_admin_log" DROP CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co";
       public       tourism_developer    false    199    2812    213            F           2606    17803 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."auth_user"("id") DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY "public"."django_admin_log" DROP CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id";
       public       tourism_developer    false    207    213    2830            K           2606    18247 '   excursion excursion_start_of_route_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."excursion"
    ADD CONSTRAINT "excursion_start_of_route_fkey" FOREIGN KEY ("start_of_route") REFERENCES "public"."Route"("ID_Route");
 W   ALTER TABLE ONLY "public"."excursion" DROP CONSTRAINT "excursion_start_of_route_fkey";
       public       postgres    false    226    2869    228            L           2606    18260 *   timetable timetable_excursion_numbers_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY "public"."timetable"
    ADD CONSTRAINT "timetable_excursion_numbers_fkey" FOREIGN KEY ("excursion_numbers") REFERENCES "public"."excursion"("ID_excursion");
 Z   ALTER TABLE ONLY "public"."timetable" DROP CONSTRAINT "timetable_excursion_numbers_fkey";
       public       postgres    false    230    228    2871            ?   ?  x???KO?@ ?;?b?K@"Ѯ??C?P?"!*?52?	??:??x??R)???@=??*? %?~??uƦ%?E$?Ԏ??lV????T?f_,????s??o,Ga]?h?Q?R#?ڴ??W?5??^??I?=ۈ?Z?5f<??J-	aK&?E??ՙ??&D?f??^???M???s/g?x?p?e??S?&??A$"?>|N5?????h???$)?o????n??n?5?O????????M?'u???{?;uk??X?Юw{??9e???	??:?i???'c??纜S??.?????AľH??1??PuT[]?s -?N <?????N??@?f?)/?"??b?Yܱ?M)Yۛ?????Y??=dN/=?;??n??? ???s??3X3 ^ΦSd??^??b?,ǥ???d?󷛌Ss?#L)?@??K]u?͝v?? 2??,?ksn
???)Z??\?????aV?????W???q?????S??L?S??I???JT?~%TtKwFJ?{d6D?Y?#?? ٜm????d??^???C?wՁޠ?L????j???o??],1?t?a?&	C?K??pjc-?ā??AG???<o/ڐ`?y????4?G?e?A2?Xd?d?s{[?4C??!??q?r?wd????w?z.V0??B?Y???td?ZbEnyI0ZFv=Y?&k?r?:????	c4?_i???O???<      ?   ?   x??ս
?0?ݧYT????N?:?j????X?
}?j'??9??f???s??YQ?W7B??٫???W?0?E3?jj?QbQ????=u?Vt?vyO?5lu?????t?g%?<?????3?	??>R?Ł???%?V???[??y??h?@k͡??"?=?Y?J??ǀ??`o?z?fq????bo%z?K? -???a|} ??      ?   ?  x?՗Kk?@????!Bq}KOB=b?G?!?P?H\K?>?=??/)HA*??f?Qg????\?6??̲?o?ٙz?]ku???\?1??ݞqa???tH?++?6!TZ?=?\??-]߳hȁc?m?? ??????v???7q?
?;r??`?z???R[?~ ???{'p? }?Ca????H?M?ѭ?!%LH???9=K5??V? Ox??<?i?'I?P2!K#cB>}?????e
?hB?Q`	=???M?yFz?)t??f??8??"??p??p?{??{?=n?\-pM?H??0????/2?_/X??K????YG?|?????#???FC??~?߰K?֔?W?R/3w???7{?$???Gz?????/???5???xg?hDT??'<??Z?U???c?:"??Q?,P?<?SDu?<?Sc~? ?? !D      ?     x???Mk?H????/n!23?wzXvi!?M??ˉ?l?&??$=??B??^?RZJ??Ro^?I???~??7??9?e;?m9{?F?h43~???33?????%2????d??????ekN??!w2??=/_q?nf?d????????=]??ao?r??7?n??/85??y??/??r)?????*???ȱ?})?ul?:aX?9?????I>?9?z??K?.)??[??I?sV]??t§??V??????s??f?K?<??`??Ɋo?m??hG??|???(?4???o"?c{??p݁F???%????͒?x?l?#?揶?x-?)3?N?nay~ژ??gJ?,?????̶?BM??????D????!~?C??	????LS?T#???Y"??Ч??c??5r?R?w9?3?',t?X2?n??W?R(?j??w????^???	??????I?L ?I?i0?G?ֿ W#??'pK??c?ب???U?iH?9&ma7me?⬹??>?àc??????x-x6??T??^????9?Pkh?t?S?9F?@??ƐO????? ?|B?w???j¸#Ba??G?R?#?w??<?P#?v?DϢ???+ڕު?Я???
?9???s??)x=????????A??c??)????!?3;?;=&??n?y=q*?^J?t$??#nx?Ӧ???q?&???n#`߀Y?n:ªo?A???r????????=KB?'г.?3?Ŏ??л\? =Ʊ??R??w??V*?r?>@???3?Jb?z[	??????5??fG????G8?
???j?1????nY????@?Z?Q:?5??Zָ?Ί?SG6X?_i??r,t??`{???PE?)T ???#?cь?;h??<????cIs??vv;u4?????9???Κb׃?{???hL?T?^J_??6????ؾ?a???:??U??Xί?X5???S??=???????wg?o??"5d?j$O?'?K???5[Oeǻ?c?̡???zvfZ???nf??Ӳ]?      ?   z   x???v
Q???WP*(M??LV?S
.ILK?O?H.-*???SR?P?t??*?(??9M?0G?P?`SCMk.O*iF}#-t??o?1??4????:
&T6Ӓ?F?(?R??@Frq ???      ?   6  x????J?@??y?a/m??M??ē`??T?իĦ??u?fSEOV??=z??b?`?g???????q`Y?????.?Wo?v??՛[??????k??P??Pt?L?G???v???N??[?P?m_EЗ
#????O1:7l=?(??TǨ??3v}?~v? {?????s?+%n?x??[.???+???_ΰ?r??ƶ???4?뉞)N/a?2??@#S?^?h??#M?!ŋ?|?O	h????P?L?Q???`????׎7??????wK????????+??7??'????kY?q*l;      ?   ?  x?ݘ?nE????o?JND[?????^D??D?U??	????uLnE???@7??????_a?x???Y;q5?hlu?&????9g~??sv???[??3w?}bJ??⫕??|iqm??????ꃒ?Pz??????/?-???ͱ????,=Zy?[ξ1??E???۟ݺk.??=????????f??R???l?5ljl6?_?f??ώ???m??m?>?mΉ???????9&??????v\????g??U6\?"???*fa????ɯm?O*$??Y8oX~??E?j?6??]??C0?u??????'???\&=??}????*$?|?ᙹ???2H????L??8???bA????=c_`j??K?'B<b??=????`O??????`(?@D???0?V? )B????] ??'?"??s[?o<Xw5n??El?Б:?U???????x?ɩ:?MaY??#)?sE?:q9?&%qҭϩ?-C?)Z}-?\?q?k?7?״t h?nǺ??&???????M?=hx?ڎ?;8???&C??????)?@???o1?ǝ?w}?4d?A???1I?:?t0"<?6?7?/F?"??j!UV??a<?n16??Gv?5LP???\?Yg?T>U??f{NF?3	S??I%??h(R?lL?3?4?%?U?8??
1Gj??9???:??)?m`aL????G?O	?DhT??q_F?`??_??;O?^}??I???dMz4ɟȢ?AE8??p?-Vl?>wVI?v$??D????? ?\$eY?K??˳'??e"??k*?i???1?5?7?Y?S??94?C?&?%?>2?J????up?a???\??#b?̨?
}(k?????D?z?Ƃ?!?ֱ??7??f5_?wC??$???K/"??=1_?v?????aQ??_?80??C?$SӂJ?u???T(??_L;???'?W?s?????#??ؤa?? f.?^N??????>?xJ?D%?????)ۀQ????]5????????B%8????O???
?$??fVM?o0???;J?)?ʡο?*??fJ?eZ??Ar?S??????y???Z{TJ??j%T8???n?{<?????]#~ϱAm?]5:ㇲ?M?~W???4??%?@?K??@?rX?? u"*?EH{?UrU?{?@?B>??[?2?~*?Z???Nͷ??^@?:Q?ӛ?Z?????#???x?\?IM???}O???A?P?и4|&??h_L?AĄb?P?????	?O??B?J??7\D1{?@?ct?6?3l????A???h*4????????OC????X?1?????A2*OZ0}????[??Q?????m???\?sX?"hn????b???k???+?-?ц?ʘ??HVԮD??"??{???Sޔ?h??'??i?r?u??߁?????5      ?   
   x???          ?   
   x???          ?   ?  x???M??H???|
+@??y??	!#!VZؽ?L?	?Ďl?o??v????=?~?L7~?r???|??k????_??r?v??????:|?Tݹ???m??E}X?'??<W??}?U3<.?㴵o??~???????$????Շ?I??!9??d|E???}b?ǵ?qmZz???!&$#??{?+?2-?8+??S5??i?Y?W]??0fGٰbn?m?d?[?m??h<U?d7????r????? 5??ص???XQ8?ױ?RF????V8?2A2?g?:@?+??W?HXS??耵??(c#?`????&?&?!?X??ļd?l?Z???=?$@?P??B?PQ7HU???L6#??O?}????[??Ps??P?0??r%???aČ+)??O??S=?bd??gZ??P??p????fZAq?E?2]P@>???gҕ???˦6W??b???V??V5???? ?Oͼs>?
????ζ???	y???)?????5#s%??)?C?D?ɜa#!????ӓ?dh?F?ݠ?c?psF?&b!qCD?S?pLF??:???????*My'???,=	?e< NO?a?	?[{Y??[`@??ǷƦ?W͡n?????id?3b?i????<=????@5e??9<P?޳<??'?r???@?ܧ?l5????}U?4???7QXH???}?m	??????????h???@|?fm??"????\C8???}Д?????z#????~tc>V??#?J???BR?R?]?39e?Pe??????e?<??A?2V"?
4??X|H???Χ=???mtit???Xc?c??6Pװ?0?]?(b-a@?W?<????r??????* ډ?`???gh?&?NO?3:?J?S6?J?M?fRo݅???@?y?B?/jU?pp?n?E????%^??`?X~?q?1?K??o?uc5?????=?ev???????D??Ŝ?J?rq1g?١e?_?z?'KEp?g{?,?\(??W??BFԸ?????_??>v?@??,????m0A_'Dw??|??	???<?W???Q?V";ԃj?2؜r??`?4X????`?,Й???`,~'?Os3w??;?-ԭ?ǡ??"u/??(%?H?,x[P????\巓}?vG???u?q?;N??~O???a?t)F}4??9|?7?Oڧ????v???????????y?+OT??<ѥ?'??~8??????WR?      ?     x?]?_O?0???MCD$??????͡3dD???,?uR????Ƿ?,1&?枓?;'?7?z?x??????R????L@0?<?c??R~U???*-?7^6??Tꚉ?7??%=?F?\?sm?3?Dy????????["????/YG ?/???1???,?Ry????-? ???RN|??
???"X??X????$s?ݤ?g???]&??W???,???i???.?0?M???&????(???T???&?g?g?_??ӉC???M?????? ?wj?      ?   
   x???          ?   
   x???          ?   
   x???          ?   |  x???MK?0??>Eȥ1݋?';d??^G?f5?MB????>M7?<z?9h?y??,W????-W?'?]??u??x?.Me??5Q???G?8r]?1?ҹm-w??:?-?1b??/?5?1?d?h?A????lt?X?3?wP?:?)???5??B??m2?@ڠ<?1?ڧaݨ???S?s ?J[??S?????Ѷ^??Ks?5Ԡ?n?uH???? ?&Y?;??i?$??FV?r?'?????,ZOuZD?P?=
eJm??$??2\D?yN11C?cb???Ӂ???J?^?N?RE???s???,,?3?}?ۚ?(ꋥg<1HP?I}1??2Ǳ?kt?e$[cK}1??:??D??9N??宦?JG??e???q֧??`?¢?      ?   	  x????o?0?{?
?%??E~~?rwڡ?HS'?ݮ?\??`f?j???)]C4&?
"??????????|?????????k??7q?C4?ᵪ???i?8??U_E?h[?ՈZ?C?d_F?>~?zs]?U?ޙ??M??[٭ݘ\5?WB?1%??w@D????Xl???????????{???e?!?т??电j{???p???C?6??B??V??IrW<?EY??	?'@|:;?@??E?w?F?^?,4$????Z????̬3????4??K?[ik?u???^^?g?eS???<3G?,?N?C?N?J/!!܌?)19&?ӡ????;?%I0?)0=j??>J?M??g? B?Sb???sP?w\Q??Q??BNx???c??V????됴?X^ˮ???????Z??ȿ???O8f2e???r??!??t?2:+k?v?1I??????|h][J?Z???Z??{2͐??t?z<????lg.=??~???[???9?\?G?j???:`      ?   ?  x???͎?@?????ݙ?TA!¬?????(??@)?ħ?1?L?fw??,?????ZA(??????)?b^?u?$?0F?Z^??3?H/?1O/??ɽ?y"߄?\?:???
nχ??t?H%??3?@1xC2?G??xon&D?ζ?M??m??1??%?UV?Y?B!?2;?r??}5??O??b5??W??Ǽ?V??ܒX???y??U?w$w?RBIIG_?D?;%?b??͇?6???ώQ?P??z/?G??}?g3sS?:];,???{Nc?*??_?%E??
U~?Q? ?7????Tg[ZK??I?K?+??L?@?@?U*???U(#?Po?_???	??u?????C$W?=J???????Y??s????N?%޺#?????S????7|?P???U?????er?f??Z|????{??x8(?L֋ ??fW??N??Z?
p}3?????ۋ????"*??1????N??      ?   ?   x???v
Q???WP*(M??LV?SJ?H.-*???SR?P?t?G?u??2?SA???Ģ?????????H^inRj?B~?BqjbI???B??O?k??????????????????kh?i??I'덀֛ ?7Zo@G덁?#?? ":?n??t|`h??!??#P?sq ꕻ      ?     x???v
Q???WP*(M??LV?S*??M-IL?IUR?PJI???O?/?H?/OM?V?QP*.I,*???\?R?lO?x?f ??"???83?/>?47)??XIS!??'?5XAC????.콰?? ?}???qa?&P?QP7202?50?52U04?20 "tas??!iZsy??&]l???bN_a??L???π??pa# p?-?
kp?
?_?
?FX?6?р?k????8?$.l&?g?^@6?? р?l??~?π)?b?XC??%?P?-?¦@? e?C?      ?   ?   x???;
?P?>?^"???S<???? ?	?|
????-??ȉ(?X?ջ?{??UC?7@V5ּ;?DF???s ??3?Y????θ?6???!?]?V???H??`?r??;Zc????%?\Z?EMCV+*2)<aDK????c????7??C^<?<FL?a?k?WX%??J?????;?I?B??'j???Vxd?????=?P`E??u     