CREATE DATABASE TIP;
USE TIP;
-- constrangeri de adaugat
CREATE TABLE User(
 	id NUMERIC(5), 
 	email VARCHAR(30), 
 	password VARCHAR(20), 
 	name VARCHAR(35), 
 	address1 VARCHAR(70), 
 	address2 VARCHAR(70)
 	);

CREATE TABLE Feedback (
	id NUMERIC(4), 
	id_user NUMERIC(5), 
	feedback VARCHAR(500)
	);

CREATE TABLE Food_type (
	id NUMERIC(3), 
	name VARCHAR(20)
	);

CREATE TABLE Food( 
	id NUMERIC(3), 
	name VARCHAR(30), 
	price DOUBLE(10,4), 
	id_food_type NUMERIC(3)
	);

CREATE TABLE Order_food( 
	id NUMERIC(5), 
	id_food NUMERIC(3), 
	id_order NUMERIC(5), 
	id_chef NUMERIC(2), 
	amount DOUBLE(10,4), 
	quantity NUMERIC(5)
	);

CREATE TABLE Orders( 
	id NUMERIC(5), 
	id_user NUMERIC(5), 
	id_delivery NUMERIC(2), 
	price DOUBLE(10,4)
	);

CREATE TABLE Delivery_people (
	id NUMERIC(2), 
	name VARCHAR(30)
	);

CREATE TABLE Ingredients_food( 
	id NUMERIC(7), 
	id_food NUMERIC(3), 
	id_ingredients NUMERIC(4), 
	quantity NUMERIC(5)
	);

CREATE TABLE Chefs(
	id NUMERIC(2), 
	name VARCHAR(30)
	);

CREATE TABLE Ingredients( 
	id NUMERIC(4), 
	name VARCHAR(20), 
	quantity NUMERIC(5)
	);


