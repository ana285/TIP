CREATE DATABASE TIP;
USE TIP;

CREATE TABLE User(
 	id int NOT NULL AUTO_INCREMENT, 
 	email VARCHAR(30) NOT NULL, 
 	password VARCHAR(100) NOT NULL, 
 	name VARCHAR(35) NOT NULL, 
 	telephone VARCHAR(35) NOT NULL,
 	address1 VARCHAR(70), 
 	address2 VARCHAR(70),
 	CONSTRAINT user_id_pk PRIMARY KEY(id)
 	);	

CREATE TABLE Feedback (
	id int NOT NULL AUTO_INCREMENT, 
	id_user int NOT NULL, 
	feedback VARCHAR(500) NOT NULL,
	CONSTRAINT feedback_id_pk PRIMARY KEY(id),
	CONSTRAINT feedback_id_user_fk FOREIGN KEY(id_user) REFERENCES user(id)
	);
	
CREATE TABLE Delivery_people (
	id int NOT NULL AUTO_INCREMENT, 
	name VARCHAR(30) NOT NULL,
	CONSTRAINT delivery_people_id_pk PRIMARY KEY(id)
	);	
	
	
CREATE TABLE Orders( 
	id int NOT NULL AUTO_INCREMENT, 
	id_user int NOT NULL, 
	id_delivery int NOT NULL, 
	price DOUBLE(10,4) NOT NULL,
	CONSTRAINT orders_id_pk PRIMARY KEY(id),
	CONSTRAINT orders_id_user_fk FOREIGN KEY(id_user) REFERENCES user(id),
	CONSTRAINT orders_id_delivery_fk FOREIGN KEY(id_delivery) REFERENCES delivery_people(id)
	);	

CREATE TABLE Chefs(
	id int NOT NULL AUTO_INCREMENT, 
	name VARCHAR(30),
	CONSTRAINT chefs_id_pk PRIMARY KEY(id)
	);
	
CREATE TABLE Food_type (
	id int NOT NULL AUTO_INCREMENT, 
	name VARCHAR(20) NOT NULL,
	CONSTRAINT food_type_id_pk PRIMARY KEY(id)
	);	
	
CREATE TABLE Food( 
	id int NOT NULL AUTO_INCREMENT, 
	name VARCHAR(30) NOT NULL, 
	price DOUBLE(10,4) NOT NULL, 
	id_food_type int NOT NULL,
	CONSTRAINT food_id_pk PRIMARY KEY(id),
	CONSTRAINT food_id_type_fk FOREIGN KEY(id_food_type) REFERENCES food_type(id)
	);


CREATE TABLE Order_food( 
	id int NOT NULL AUTO_INCREMENT, 
	id_food int NOT NULL, 
	id_order int NOT NULL, 
	id_chef int NOT NULL, 
	amount DOUBLE(10,4) NOT NULL, 
	quantity NUMERIC(5) NOT NULL,
	CONSTRAINT order_food_id_pk PRIMARY KEY(id),
	CONSTRAINT order_food_id_food_fk FOREIGN KEY(id_food) REFERENCES food(id),
	CONSTRAINT order_food_id_order_fk FOREIGN KEY(id_order) REFERENCES orders(id),
	CONSTRAINT order_food_id_chef_fk FOREIGN KEY(id_chef) REFERENCES chefs(id)
	);
	
CREATE TABLE Ingredients( 
	id int NOT NULL AUTO_INCREMENT, 
	name VARCHAR(20), 
	quantity NUMERIC(5),
	CONSTRAINT ingredients_id_pk PRIMARY KEY(id)
	);
	

CREATE TABLE Ingredients_food( 
	id int NOT NULL AUTO_INCREMENT, 
	id_food int NOT NULL, 
	id_ingredients int NOT NULL, 
	quantity NUMERIC(5) NOT NULL,
	CONSTRAINT ingredients_food_id_pk PRIMARY KEY(id),
	CONSTRAINT ingredients_food_id_food_fk FOREIGN KEY(id_food) REFERENCES food(id),
	CONSTRAINT ingredients_food_id_ingredients_fk FOREIGN KEY(id_ingredients) REFERENCES ingredients(id)
	);
	