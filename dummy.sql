--create database
CREATE DATABASE restdb;

--use database and insert GET paramenters
USE restdb;
INSERT INTO Users (username, email, createdAt, updatedAt)
VALUES ("John Doe", "haha@yahoo.com","2008-11-11","2008-11-11");