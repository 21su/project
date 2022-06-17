create user user_spring_mvc@localhost identified by '1234';
create database db_spring_mvc;
grant all privileges on db_spring_mvc.* to user_spring_mvc@localhost;