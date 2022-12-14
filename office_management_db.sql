PGDMP     /                	    z            office_management    14.5    14.5 
    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16394    office_management    DATABASE     u   CREATE DATABASE office_management WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
 !   DROP DATABASE office_management;
                postgres    false            ?            1259    16458 	   employers    TABLE     ?   CREATE TABLE public.employers (
    id integer NOT NULL,
    name character varying(150),
    role character varying(25),
    salary real
);
    DROP TABLE public.employers;
       public         heap    postgres    false            ?            1259    16483    users    TABLE     ?   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(150),
    phone character(11),
    role character varying(25),
    salary real,
    employers_id integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?          0    16458 	   employers 
   TABLE DATA           ;   COPY public.employers (id, name, role, salary) FROM stdin;
    public          postgres    false    209   $
       ?          0    16483    users 
   TABLE DATA           L   COPY public.users (id, name, phone, role, salary, employers_id) FROM stdin;
    public          postgres    false    210   y
       `           2606    16462    employers employers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employers DROP CONSTRAINT employers_pkey;
       public            postgres    false    209            a           2606    16488    users employers_id(fk)    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "employers_id(fk)" FOREIGN KEY (employers_id) REFERENCES public.employers(id);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT "employers_id(fk)";
       public          postgres    false    210    3168    209            ?   E   x?35????-RJ????t,JMTp??/J??K,?/?45 .33ss?"??"?????????,
c???? &      ?   ?   x???1?0???9EN????HG?,???!??=?q????K&???t__b$bf???B@???dl^v?(B;???y?V{S?2`w??3?ڻ?7?????4r?h?~i?4?v_?>w?hsJF??z;8??Ym2f     