CREATE DATABASE Information
USE Information

CREATE TABLE role
(
id int primary key,
role_name varchar(100)
);

insert into role values(1,'salesman'),
(2,'accountant'),
(3,'customer');

SELECT * FROM role

CREATE TABLE user_account
(id int primary key, 
user_name varchar(100),
email varchar(254),
password varchar(200),
password_salt varchar(50) not null,
password_hash_algorithm varchar(50));

insert into user_account values
(1,'Mani','mani@gmail.com','manihar','manimini','manilovesmini'),
(2,'Priya','priya@gmail.com','priyari','priyariya','priyaloveriya'),
(3,'Mona','mona@yahoo.com','monali','monalisa','monaloveslisa'),
(4,'Guna','guna@yahoo.com','gunali','gunaliza','gunalovesliza');

SELECT * FROM user_account

CREATE TABLE user_has_role
(id int primary key,
role_start_time timestamp,
role_end_time datetime not null,
user_account_id int foreign key references user_account(id),
role_id int foreign key references role(id)
);

insert into user_has_role values
(1,default,'2025-03-01',2,1),
(2,default,'2025-02-10',3,2);

SELECT * FROM user_has_role

CREATE TABLE status(
id int primary key,
status_name varchar(100),
is_user_working bit);

insert into status values
(7,'married','True'),
(8,'single','True'),
(9,'married','False');

SELECT * FROM status

CREATE TABLE user_has_status(
id int primary key,
status_start_time timestamp,
status_end_time datetime not null,
user_account_id int foreign key references user_account(id),
status_id int foreign key references status(id));

insert into user_has_status values
(4,default,'2025-08-10',1,7),
(5,default,'2025-08-20',2,8),
(6,default,'2025-07-05',3,9);

SELECT * FROM user_has_status


DELETE FROM role
DELETE FROM user_account
DELETE FROM user_has_role
DELETE FROM status
DELETE FROM user_has_status 

--### in case if you want to drop the database but it is said that it is in use 
ALTER DATABASE Information SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

drop database Information