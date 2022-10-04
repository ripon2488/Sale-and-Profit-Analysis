
create table users(
    id int not null primary key,
    name varchar(150), 
    phone char(11),
    role varchar(25),
    salary float(2),
    employers_id int,
    CONSTRAINT "employers_id(fk)" FOREIGN KEY (employers_id)
    REFERENCES employers(id));

create table employers(
    id int not null primary key,
    name varchar(150), 
    role varchar(25),
    salary float(2));
        
insert into employers(id,name,role,salary)values(5588,'Mr Rahim','Area Coordinator',50000);

insert into users(id,name,phone,role,salary,employers_id(fk))values(7856,'Mr Abul','02255666777','BR',25000,5588);


office_management=# \d users;
                          Table "public.users"
    Column    |          Type          | Collation | Nullable | Default
--------------+------------------------+-----------+----------+---------
 id           | integer                |           | not null |
 name         | character varying(150) |           |          |
 phone        | character(11)          |           |          |
 role         | character varying(25)  |           |          |
 salary       | real                   |           |          |
 employers_id | integer                |           |          |
Indexes:
    "users_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
    "employers_id(fk)" FOREIGN KEY (employers_id) REFERENCES employers(id)


ALTER TABLE users DROP CONSTRAINT users_pkey;
---------------------
office_management=# ALTER TABLE users DROP CONSTRAINT users_pkey;
ALTER TABLE
------------------------
office_management=# insert into users(id,name,phone,role,salary,employers_id) values(5748,'Mrs Morjina','01155886644','BR',38000,5588);
INSERT 0 1
-------------------
office_management=# select * from users;
  id  |    name     |    phone    |    role    | salary | employers_id
------+-------------+-------------+------------+--------+--------------
 7856 | Mr Abul     | 02255666777 | BR         |  25000 |         5588
 7654 | Mr Babul    | 01177555666 | Supervisor |  27500 |         6677
 8768 | Miss Jorina | 02299000111 | BR         |  40000 |         5588
 5748 | Mrs Morjina | 01155886644 | BR         |  38000 |         5588
 5748 | Mrs Morjina | 01155886644 | BR         |  38000 |         5588
(5 rows)
--------------------------------------------------------------------------------
--i) “select count(*) from users”, Write an optimized query against this.--
-------------------------------------------------------------------------------
office_management=# select count(*) from users;
 count
-------
     5
(1 row)
-------------
office_management=# select COUNT(DISTINCT name) from users;
 count
-------
     4
(1 row)
---------------------------------------------------------------------------
--ii) View all users and employers who get maximum salary from each group?
---------------------------------------------------------------------------
office_management=# SELECT * FROM users
office_management-# WHERE SALARY IN (SELECT MAX(SALARY) FROM USERS GROUP BY ROLE);
  id  |    name     |    phone    |    role    | salary | employers_id
------+-------------+-------------+------------+--------+--------------
 7654 | Mr Babul    | 01177555666 | Supervisor |  27500 |         6677
 8768 | Miss Jorina | 02299000111 | BR         |  40000 |         5588
(2 rows)
---------------------------
office_management=# SELECT * FROM EMPLOYERS
office_management-# WHERE SALARY IN (SELECT MAX(SALARY) FROM EMPLOYERS GROUP BY ROLE);
  id  |   name   |         role         | salary
------+----------+----------------------+--------
 5588 | Mr Rahim | Area Coordinator     |  50000
 6677 | Mr Karim | Regional Coordinator |  50000
(2 rows)
-------------------------------------------------------------
--iii) You want to delete everything of Users, write a query.
---------------------------------------------------------------

DELETE FROM USERS;
--------------------------------
--iv) Get the second highest salary from the Users table and which users get them.
----------------------------------------------------------------------------------
office_management=# select distinct * from users where salary in (SELECT MAX(distinct salary) FROM users WHERE salary < ( SELECT MAX(distinct salary) FROM users ));
  id  |    name     |    phone    | role | salary | employers_id
------+-------------+-------------+------+--------+--------------
 5748 | Mrs Morjina | 01155886644 | BR   |  38000 |         5588
(1 row)

-------------------------------------------------------------------------------------------------
--v) How to get distinct records from the Names from users table without using distinct keyword.
-------------------------------------------------------------------------------------------------

office_management=# select * from users group by id,name,phone,role,salary,employers_id;
  id  |    name     |    phone    |    role    | salary | employers_id
------+-------------+-------------+------------+--------+--------------
 8768 | Miss Jorina | 02299000111 | BR         |  40000 |         5588
 7654 | Mr Babul    | 01177555666 | Supervisor |  27500 |         6677
 7856 | Mr Abul     | 02255666777 | BR         |  25000 |         5588
 5748 | Mrs Morjina | 01155886644 | BR         |  38000 |         5588
(4 rows)
--------------------------------------------------------------
--vi) How to find the count of duplicate rows from a table?
---------------------------------------------------------------
office_management=# select id,count(*) from users group by id having count(*)>1;
  id  | count
------+-------
 5748 |     2
(1 row)
----------------------------------------------------
--vii) Remove duplicates from users but keep one.
----------------------------------------------------
office_management=# select * from users;
  id  |    name     |    phone    |    role    | salary | employers_id
------+-------------+-------------+------------+--------+--------------
 7856 | Mr Abul     | 02255666777 | BR         |  25000 |         5588
 7654 | Mr Babul    | 01177555666 | Supervisor |  27500 |         6677
 8768 | Miss Jorina | 02299000111 | BR         |  40000 |         5588
 5748 | Mrs Morjina | 01155886644 | BR         |  38000 |         5588
 5748 | Mrs Morjina | 01155886644 | BR         |  38000 |         5588
(5 rows)

office_management=# delete from users a using users b where a=b and a.ctid < b.ctid;
DELETE 1
office_management=# Select * from users;
  id  |    name     |    phone    |    role    | salary | employers_id
------+-------------+-------------+------------+--------+--------------
 7856 | Mr Abul     | 02255666777 | BR         |  25000 |         5588
 7654 | Mr Babul    | 01177555666 | Supervisor |  27500 |         6677
 8768 | Miss Jorina | 02299000111 | BR         |  40000 |         5588
 5748 | Mrs Morjina | 01155886644 | BR         |  38000 |         5588
(4 rows)

office_management=#