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
  
  insert into Delivery_people values(1, 'Anton Marius');
  insert into Delivery_people values(2, 'Beldiman George');
  insert into Delivery_people values(3, 'Bratu Anghel');
  insert into Delivery_people values(4, 'Damaschin Alexandru');  
  insert into Delivery_people values(5, 'Finascu Bogdan');
  insert into Delivery_people values(6, 'Popescu Dan');
  insert into Delivery_people values(7, 'Rizac Fabian');
  insert into Delivery_people values(8, 'Stanciu Ovidiu');
  insert into Delivery_people values(9, 'Spiridon Liviu');
  insert into Delivery_people values(10, 'Zamfirescu Ion');
	
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
 
  insert into Chefs values(1, 'Bejinariu Alexandra'); 
  insert into Chefs values(2, 'Dumitrescu Marian');
  insert into Chefs values(3, 'Galer Ramona');
  insert into Chefs values(4, 'Manoliu Iulian');  
  insert into Chefs values(5, 'Moroneanu Iulia');    
  insert into Chefs values(6, 'Sandovici Elena');
  insert into Chefs values(7, 'Tincu Angel'); 
  
	
CREATE TABLE Food_type (
	id int NOT NULL AUTO_INCREMENT, 
	name VARCHAR(30) NOT NULL,
	CONSTRAINT food_type_id_pk PRIMARY KEY(id)
	);	
  
  insert into Food_type values(1, 'Appetizers');
  insert into Food_type values(2, 'Soup'); 
  insert into Food_type values(3, 'Salad');
  insert into Food_type values(4, 'Entrees/Main Dishes');
  insert into Food_type values(5, 'Dessert');
  insert into Food_type values(6, 'Drinks');
  
CREATE TABLE Food( 
	id int NOT NULL AUTO_INCREMENT, 
	name VARCHAR(30) NOT NULL, 
	price DOUBLE(10,4) NOT NULL, 
	id_food_type int NOT NULL,
  	bucatarie VARCHAR(10) NOT NULL,
  	image_path VARCHAR(100) NOT NULL,
	CONSTRAINT food_id_pk PRIMARY KEY(id),
	CONSTRAINT food_id_type_fk FOREIGN KEY(id_food_type) REFERENCES food_type(id)
	);
 
 insert into Food values(1, 'Ratatouille Appetizer Pizza', 8, 1, 'French', './../SW/WebContent/images/french/1.jpg');
 insert into Food values(2, 'Alsatian Bacon And Onion Tart', 10, 1, 'French', './../SW/WebContent/images/french/2.jpg');
 insert into Food values(3, 'Salmon Rilletes', 12, 1, 'French', './../SW/WebContent/images/french/3.jpg');
 insert into Food values(4, 'Black bean soup',11.5, 2, 'French', './../SW/WebContent/images/french/4.jpg');
 insert into Food values(5, 'French Garlic Soup',11, 2, 'French', './../SW/WebContent/images/french/5.jpg');
 insert into Food values(6, 'Pumpkin Soup',13, 2, 'French', './../SW/WebContent/images/french/6.jpg');
 insert into Food values(7, 'French Corn and Radish Salad', 9.5, 3, 'French', './../SW/WebContent/images/french/7.jpg');
 insert into Food values(8, 'French Roasted Beet Salad', 9, 3, 'French', './../SW/WebContent/images/french/8.jpg'); 
 insert into Food values(9, 'Salad with Pine Nuts', 11.25, 3, 'French', './../SW/WebContent/images/french/9.jpg');
 insert into Food values(10, 'Steak Diane', 20, 4, 'French', './../SW/WebContent/images/french/10.jpg');
 insert into Food values(11, 'Chicken Dijon', 18, 4, 'French', './../SW/WebContent/images/french/11.jpg');
 insert into Food values(12, 'Basque-Style Fish', 25, 4, 'French', './../SW/WebContent/images/french/12.jpg');
 insert into Food values(13, 'Mocha Dacquoise Cake', 15, 5, 'French', './../SW/WebContent/images/french/13.jpg');
 insert into Food values(14, 'Macarons', 18, 5, 'French', './../SW/WebContent/images/french/14.jpg');
 insert into Food values(15, 'Butter Tart with Blackberries', 14.75, 5, 'French', './../SW/WebContent/images/french/15.jpg');
 insert into Food values(16, 'Arnaud French 75', 4.75, 6, 'French', './../SW/WebContent/images/french/16.jpg'); 
 insert into Food values(17, 'Antebellum Mint Julep', 6.75, 6, 'French', './../SW/WebContent/images/french/17.jpg'); 
 insert into Food values(18, 'The Green Thumb', 5.75, 6, 'French', './../SW/WebContent/images/french/18.jpg');

 insert into Food values(19, 'Bites with Sun-Dried Tomato', 9.75, 1, 'Greek', './../SW/WebContent/images/greek/19.jpg');
 insert into Food values(20, 'Zucchini Pie', 10, 1, 'Greek', './../SW/WebContent/images/greek/20.jpg');
 insert into Food values(21, 'Greek Fried Cheese', 11.25, 1, 'Greek', './../SW/WebContent/images/greek/21.jpg');
 insert into Food values(22, 'Greek Easter Soup', 15, 2, 'Greek', './../SW/WebContent/images/greek/22.jpg');
 insert into Food values(23, 'Avgolemono', 13.7, 2, 'Greek', './../SW/WebContent/images/greek/23.jpg'); 
 insert into Food values(24, 'Artichoke and Fava Stew', 14.5, 2, 'Greek', './../SW/WebContent/images/greek/24.jpg');
 insert into Food values(25, 'Horiatiki', 13, 3, 'Greek', './../SW/WebContent/images/greek/25.jpg'); 
 insert into Food values(26, 'Greek Pasta Salad', 14.80, 3, 'Greek','./../SW/WebContent/images/greek/26.jpg');  
 insert into Food values(27, 'Grilled asparagus and zucchini', 15.80, 3, 'Greek', './../SW/WebContent/images/greek/27.jpeg');  
 insert into Food values(28, 'Greek Style Garlic Chicken', 19.80, 4, 'Greek', './../SW/WebContent/images/greek/28.jpg');  
 insert into Food values(29, 'Marinated Greek Chicken Kabobs', 17.80, 4, 'Greek', './../SW/WebContent/images/greek/29.jpg');  
 insert into Food values(30, 'Melitzanes Papoutsakia', 16.85, 4, 'Greek', './../SW/WebContent/images/greek/30.jpg');  
 insert into Food values(31, 'Rhubarb and Berry Compote', 15.85, 5, 'Greek', './../SW/WebContent/images/greek/31.jpg');  
 insert into Food values(32, 'Walnut Spice Cookies', 14.85, 5, 'Greek', './../SW/WebContent/images/greek/32.jpg');  
 insert into Food values(33, 'Cheese Pie', 13.55, 5, 'Greek', './../SW/WebContent/images/greek/33.jpg');  
 insert into Food values(34, 'Santorini Sunrise', 12.55, 6, 'Greek','./../SW/WebContent/images/greek/34.jpg');  
 insert into Food values(35, 'Nectar of the Ancient', 16, 6, 'Greek', './../SW/WebContent/images/greek/35.jpg');  
 insert into Food values(36, 'Rakomelo', 14, 6, 'Greek', './../SW/WebContent/images/greek/36.jpg');  

 insert into Food values(37, 'Ricotta and Scallion Fritters', 17.5, 1, 'Italian', './../SW/WebContent/images/italian/37.png');
 insert into Food values(38, 'Pesto Focaccia', 10.8, 1, 'Italian', './../SW/WebContent/images/italian/38.jpg');
 insert into Food values(39, 'Scallops with Pesto', 14.66, 1, 'Italian', './../SW/WebContent/images/italian/39.jpg');
 insert into Food values(40, 'Chickpea and Pasta Soup', 15.5, 2, 'Italian', './../SW/WebContent/images/italian/40.jpg');
 insert into Food values(41, 'White Bean Soup', 10.1, 2, 'Italian', './../SW/WebContent/images/italian/41.jpg');
 insert into Food values(42, 'Bread and Tomato Soup', 13.2, 2, 'Italian', './../SW/WebContent/images/italian/42.jpg');
 insert into Food values(43, 'Caprese Salad', 12.5, 3, 'Italian', './../SW/WebContent/images/italian/43.jpg');
 insert into Food values(44, 'Egg Salad', 16.1, 3, 'Italian', './../SW/WebContent/images/italian/44.jpg');
 insert into Food values(45, 'Arugula and Pine Nut Salad', 15.2, 3, 'Italian', './../SW/WebContent/images/italian/45.jpg');
 insert into Food values(46, 'Rugatoni Pajata alla Finta', 23.5, 4, 'Italian', './../SW/WebContent/images/italian/46.jpg');
 insert into Food values(47, 'Lasagna', 22.9, 4, 'Italian', './../SW/WebContent/images/italian/47.jpg');
 insert into Food values(48, 'Pizza', 32.1, 4, 'Italian', './../SW/WebContent/images/italian/48.jpg'); 
 insert into Food values(49, 'Milk Pudding', 13.5, 5, 'Italian', './../SW/WebContent/images/italian/49.jpeg');
 insert into Food values(50, 'Coffee Granita', 14.9, 5, 'Italian', './../SW/WebContent/images/italian/50.jpg');
 insert into Food values(51, 'Lemon Granita', 11.1, 5, 'Italian', './../SW/WebContent/images/italian/51.jpg');
 insert into Food values(52, 'Tricolore', 10.5, 6, 'Italian', './../SW/WebContent/images/italian/52.jpg');
 insert into Food values(53, 'Strawberry Lassi', 9.9, 6, 'Italian', './../SW/WebContent/images/italian/53.jpg');
 insert into Food values(54, 'Cinnamon Hot Chocolate', 11, 6, 'Italian', './../SW/WebContent/images/italian/54.jpg');
 
 insert into Food values(55, 'Tofu chilli enchiladas', 8.5, 1, 'Mexican', './../SW/WebContent/images/mexican/55.jpeg');
 insert into Food values(56, 'Mexican chicken wrap', 10.6, 1, 'Mexican', './../SW/WebContent/images/mexican/56.jpeg');
 insert into Food values(57, 'Chicken Fajitas', 11.66, 1, 'Mexican', './../SW/WebContent/images/mexican/57.jpeg'); 
 insert into Food values(58, 'Chicken Posole Soup', 11.5, 2, 'Mexican', './../SW/WebContent/images/mexican/58.jpg');
 insert into Food values(59, 'Chicken Tortilla Soup', 15.6, 2, 'Mexican', './../SW/WebContent/images/mexican/59.png');
 insert into Food values(60, 'Mexican Corn-and-Poblano Soup', 13.8, 2, 'Mexican', './../SW/WebContent/images/mexican/60.jpg'); 
 insert into Food values(61, 'Mexican beef salad', 14.5, 3, 'Mexican', './../SW/WebContent/images/mexican/61.jpeg');
 insert into Food values(62, 'Mexican chicken salad', 13.6, 3, 'Mexican', './../SW/WebContent/images/mexican/62.jpeg');
 insert into Food values(63, 'Layered Christmas Dip', 15.5, 3, 'Mexican', './../SW/WebContent/images/mexican/63.jpg');
 insert into Food values(64, 'Mexican beans', 34.7, 4, 'Mexican', './../SW/WebContent/images/mexican/64.jpeg');
 insert into Food values(65, 'Mexican beef roast', 23.5, 4, 'Mexican', './../SW/WebContent/images/mexican/65.jpeg');
 insert into Food values(66, 'Mexican bowl', 21.5, 4, 'Mexican', './../SW/WebContent/images/mexican/66.jpg');
 insert into Food values(67, 'Coconut and strawberry parfait', 22.3, 5, 'Mexican', './../SW/WebContent/images/mexican/67.jpeg');
 insert into Food values(68, 'Sweet potato meringue pie', 19.36, 5, 'Mexican', './../SW/WebContent/images/mexican/68.jpeg');
 insert into Food values(69, 'White chocolate mud cake', 19.36, 5, 'Mexican', './../SW/WebContent/images/mexican/69.jpeg');
 insert into Food values(70, 'Strawberry vodka cup', 9.3, 6, 'Mexican', './../SW/WebContent/images/mexican/70.jpeg');
 insert into Food values(71, 'Raspberry wine cocktail', 8.36, 6, 'Mexican', './../SW/WebContent/images/mexican/71.jpeg');
 insert into Food values(72, 'Strawberry and gin cocktail', 10.67, 6, 'Mexican', './../SW/WebContent/images/mexican/72.jpeg');
 
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
  
  insert into Ingredients values(1, 'zucchini', 1000);
  insert into Ingredients values(2, 'eggplant', 100);	
  insert into Ingredients values(3, 'bread', 500);	   
  insert into Ingredients values(4, 'red onion', 1000);
  insert into Ingredients values(5, 'bacon', 500);
  insert into Ingredients values(6, 'white onion', 1000);	
  insert into Ingredients values(7, 'fromage blanc', 500);	   
  insert into Ingredients values(8, 'egg', 300);	
  insert into Ingredients values(9, 'olive oil', 600); 
  insert into Ingredients values(10, 'lemon', 550);
  insert into Ingredients values(11, 'white wine', 400);	
  insert into Ingredients values(12, 'salmon fillet', 700);	   
  insert into Ingredients values(13, 'mayonnaise', 200);	
  insert into Ingredients values(14, 'honey', 800);
  insert into Ingredients values(15, 'mustard', 320);  
  insert into Ingredients values(16, 'black beans', 300);
  insert into Ingredients values(17, 'oregano', 100);	
  insert into Ingredients values(18, 'tomatoes', 3000);	   
  insert into Ingredients values(19, 'sour cream', 850);	
  insert into Ingredients values(20, 'black pepper', 100);
  insert into Ingredients values(21, 'garlic', 700); 
  insert into Ingredients values(22, 'chicken', 1000);
  insert into Ingredients values(23, 'cheese', 800);	
  insert into Ingredients values(24, 'salt', 300);	   
  insert into Ingredients values(25, 'pepper', 300); 
  insert into Ingredients values(26, 'pumpkin', 2000);
  insert into Ingredients values(27, 'potatoes', 5000);	
  insert into Ingredients values(28, 'double cream', 300);
  insert into Ingredients values(29, 'vinegar', 850);
  insert into Ingredients values(30, 'black olives', 350);	
  insert into Ingredients values(31, 'lettuce', 700);
  insert into Ingredients values(32, 'radish', 900);
  insert into Ingredients values(33, 'beef', 950);
  insert into Ingredients values(34, 'blue cheese', 500);
  insert into Ingredients values(35, 'pine nuts', 200);
  insert into Ingredients values(36, 'peaches', 1000); 
  insert into Ingredients values(37, 'goat camembert', 650);
  insert into Ingredients values(38, 'steak', 900);
  insert into Ingredients values(39, 'butter', 500); 
  insert into Ingredients values(40, 'mushrooms', 1000);  
  insert into Ingredients values(41, 'cognac ', 500);    
  insert into Ingredients values(42, 'Tabasco ', 200);  
  insert into Ingredients values(43, 'parsley ', 150);
  insert into Ingredients values(44, 'coriander', 400);
  insert into Ingredients values(45, 'tarragon', 200);
  insert into Ingredients values(46, 'flour', 3000);
  insert into Ingredients values(47, 'fillet', 500); 
  insert into Ingredients values(48, 'manilla clams', 700);
  insert into Ingredients values(49, 'sugar', 3000);
  insert into Ingredients values(50, 'almond ', 500); 
  insert into Ingredients values(51, 'coffee', 1000);  
  insert into Ingredients values(52, 'rum', 100);
  insert into Ingredients values(53, 'chocolate sauce', 500);
  insert into Ingredients values(54, 'strawbery jam', 800);
  insert into Ingredients values(55, 'vanilla', 200);
  insert into Ingredients values(56, 'blackberries', 800);  
  insert into Ingredients values(57, 'milk', 2000); 
  insert into Ingredients values(58, 'vanilla', 200);
  insert into Ingredients values(59, 'fresh lemon juice', 800);  
  insert into Ingredients values(60, 'syrup', 200); 
  insert into Ingredients values(61, 'Champagne', 600); 
  insert into Ingredients values(62, 'mint', 100);
  insert into Ingredients values(63, 'lime juice', 600);
  insert into Ingredients values(64, 'liqueur', 200);
  insert into Ingredients values(65, 'basil', 100);  
  insert into Ingredients values(66, 'feta cheese', 600);
  insert into Ingredients values(67, 'cheese', 600);
  insert into Ingredients values(68, 'lettuce', 400);
  insert into Ingredients values(69, 'lamb shanks', 900);
  insert into Ingredients values(70, 'carrots', 1000);
  insert into Ingredients values(71, 'dill', 150);
  insert into Ingredients values(72, 'rice', 800);  
  insert into Ingredients values(73, 'artichokes', 800);   
  insert into Ingredients values(74, 'cucumber', 900);   
  insert into Ingredients values(75, 'rotini', 1000);
  insert into Ingredients values(76, 'broad beans', 500);
  insert into Ingredients values(77, 'asparagus', 500);
  insert into Ingredients values(78, 'paprika', 150);
  insert into Ingredients values(79, 'yogurt', 500);
  insert into Ingredients values(80, 'rosemary', 150);  
  insert into Ingredients values(81, 'cinnamon', 330);
  insert into Ingredients values(82, 'beef', 1000);  
  insert into Ingredients values(83, 'blueberries', 600);
  insert into Ingredients values(84, 'strawberries', 600);
  insert into Ingredients values(85, 'orange juice', 1000);
  insert into Ingredients values(86, 'honey', 500);
  insert into Ingredients values(87, 'walnuts', 400);
  insert into Ingredients values(88, 'brandy', 500); 
  insert into Ingredients values(89, 'grapefruit', 700);
  insert into Ingredients values(90, 'vodka', 200);   
  insert into Ingredients values(91, 'chickpeas', 400);
  insert into Ingredients values(92, 'arugula', 200); 
  insert into Ingredients values(93, 'tomato paste', 800);
  insert into Ingredients values(94, 'spaghetti', 600);
  insert into Ingredients values(95, 'espresso', 600);
  insert into Ingredients values(96, 'chilli', 150);
  insert into Ingredients values(97, 'tofu', 750);
  insert into Ingredients values(98, 'corn', 950);
  insert into Ingredients values(99, 'coconut', 150);
  insert into Ingredients values(100, 'biscuits', 450);
  insert into Ingredients values(101, 'raspberry', 800);
  insert into Ingredients values(102, 'gin', 800);
 

CREATE TABLE Ingredients_food( 
	id int NOT NULL AUTO_INCREMENT, 
	id_food int NOT NULL, 
	id_ingredients int NOT NULL, 
	quantity NUMERIC(5) NOT NULL,
	CONSTRAINT ingredients_food_id_pk PRIMARY KEY(id),
	CONSTRAINT ingredients_food_id_food_fk FOREIGN KEY(id_food) REFERENCES food(id),
	CONSTRAINT ingredients_food_id_ingredients_fk FOREIGN KEY(id_ingredients) REFERENCES ingredients(id)
	);


  insert into Ingredients_food values(1, 1, 1, 1000);
  insert into Ingredients_food values(2, 1, 2, 100);	
  insert into Ingredients_food values(3, 1, 3, 500);	   
  insert into Ingredients_food values(4, 1, 4, 1000);
  
  insert into Ingredients_food values(5, 2, 5, 500);
  insert into Ingredients_food values(6, 2, 6, 1000);	
  insert into Ingredients_food values(7, 2, 7, 500);	   
  insert into Ingredients_food values(8, 2, 8, 300);	
  insert into Ingredients_food values(9, 2, 9, 600);
  
  insert into Ingredients_food values(10, 3, 10, 550);
  insert into Ingredients_food values(11, 3, 11, 400);	
  insert into Ingredients_food values(12, 3, 12, 700);	   
  insert into Ingredients_food values(13, 3, 13, 200);	
  insert into Ingredients_food values(14, 3, 14, 800);
  insert into Ingredients_food values(15, 3, 15, 320);
  
  insert into Ingredients_food values(16, 4, 16, 300);
  insert into Ingredients_food values(17, 4, 17, 100);	
  insert into Ingredients_food values(18, 4, 18, 3000);	   
  insert into Ingredients_food values(19, 4, 19, 850);	
  insert into Ingredients_food values(20, 4, 20, 100);
  insert into Ingredients_food values(21, 4, 6, 1000);
  insert into Ingredients_food values(22, 4, 21, 1000);
  
  insert into Ingredients_food values(23, 5, 22, 1000);
  insert into Ingredients_food values(24, 5, 23, 800);	
  insert into Ingredients_food values(25, 5, 24, 300);	   
  insert into Ingredients_food values(26, 5, 25, 300);	
  insert into Ingredients_food values(27, 5, 21, 1000);
   
  insert into Ingredients_food values(28, 6, 26, 2000);
  insert into Ingredients_food values(29, 6, 27, 5000);	
  insert into Ingredients_food values(30, 6, 28, 300);
  insert into Ingredients_food values(31, 6, 21, 1000);
  insert into Ingredients_food values(32, 6, 24, 300);	   
  insert into Ingredients_food values(33, 6, 25, 300);	  
 
  insert into Ingredients_food values(34, 7, 29, 850);
  insert into Ingredients_food values(35, 7, 30, 350);	
  insert into Ingredients_food values(36, 7, 31, 700);
  insert into Ingredients_food values(37, 7, 32, 900);
  insert into Ingredients_food values(38, 7, 21, 1000); 
  insert into Ingredients_food values(39, 7, 15, 320);
  insert into Ingredients_food values(40, 7, 9, 600);
  insert into Ingredients_food values(41, 7, 24, 300);	   
  insert into Ingredients_food values(42, 7, 25, 300);	  
 
 
  insert into Ingredients_food values(43, 8, 33, 950);
  insert into Ingredients_food values(44, 8, 34, 500);
  insert into Ingredients_food values(45, 8, 9, 600);
  insert into Ingredients_food values(46, 8, 24, 300);	   
  insert into Ingredients_food values(47, 8, 25, 300);
  insert into Ingredients_food values(48, 8, 15, 320);
  insert into Ingredients_food values(49, 8, 4, 1000);
  
  insert into Ingredients_food values(50, 9, 35, 200);
  insert into Ingredients_food values(51, 9, 36, 1000); 
  insert into Ingredients_food values(52, 9, 37, 650); 
  insert into Ingredients_food values(53, 9, 29, 850);
  insert into Ingredients_food values(54, 9, 9, 600);
  insert into Ingredients_food values(55, 9, 25, 300);
  insert into Ingredients_food values(56, 9, 4, 1000);
  
  
  insert into Ingredients_food values(57, 10, 38, 900);
  insert into Ingredients_food values(58, 10 ,39, 500); 
  insert into Ingredients_food values(59, 10, 40, 1000);  
  insert into Ingredients_food values(60, 10, 41, 500);    
  insert into Ingredients_food values(61, 10, 42, 200);  
  insert into Ingredients_food values(62, 10, 43, 150);  
  insert into Ingredients_food values(63, 10, 71, 150);  
  insert into Ingredients_food values(64, 10, 21, 1000);   
  insert into Ingredients_food values(65, 10, 28, 300);  
  insert into Ingredients_food values(66, 10, 15, 320);
  insert into Ingredients_food values(67, 10, 24, 300);	   
  insert into Ingredients_food values(68, 10, 25, 300); 

  insert into Ingredients_food values(69, 11, 44, 400);
  insert into Ingredients_food values(70, 11, 45, 200);  
  insert into Ingredients_food values(71, 11, 9, 600);
  insert into Ingredients_food values(72, 11, 6, 1000);
  insert into Ingredients_food values(73, 11, 22, 1000);  
  insert into Ingredients_food values(74, 11, 21, 1000);
  
  insert into Ingredients_food values(75, 12, 46, 3000);
  insert into Ingredients_food values(76, 12, 47, 500); 
  insert into Ingredients_food values(77, 12, 48, 700); 
  insert into Ingredients_food values(78, 12, 21, 1000);
  insert into Ingredients_food values(79, 12, 24, 300);	   
  insert into Ingredients_food values(80, 12, 25, 300);   
  insert into Ingredients_food values(81, 12, 6, 1000);
  
  
  insert into Ingredients_food values(82, 13, 49, 3000);
  insert into Ingredients_food values(83, 13, 50, 500); 
  insert into Ingredients_food values(84, 13, 51, 1000);  
  insert into Ingredients_food values(85, 13, 52, 100);
  insert into Ingredients_food values(86, 13, 53, 500); 
  insert into Ingredients_food values(87, 13, 46, 3000);  
  insert into Ingredients_food values(88, 13, 8, 300);	
  insert into Ingredients_food values(89, 13 ,39, 500);   
  insert into Ingredients_food values(90, 13, 28, 300);
  
  insert into Ingredients_food values(91, 14, 54, 800);
  insert into Ingredients_food values(92, 14, 46, 3000); 
  insert into Ingredients_food values(93, 14, 49, 3000);  
  insert into Ingredients_food values(94, 14, 8, 300);
  insert into Ingredients_food values(95, 14, 50, 500); 


  insert into Ingredients_food values(96, 15, 55, 200);
  insert into Ingredients_food values(97, 15, 56, 800);  
  insert into Ingredients_food values(98, 15, 57, 2000);
  insert into Ingredients_food values(99, 15, 49, 3000);  
  insert into Ingredients_food values(100, 15, 46, 3000); 
  insert into Ingredients_food values(101, 15, 24, 300);	
  insert into Ingredients_food values(102, 15 ,39, 500);
  
  insert into Ingredients_food values(103, 16, 58, 200);
  insert into Ingredients_food values(104, 16, 59, 800);  
  insert into Ingredients_food values(105, 16, 60, 200); 
  insert into Ingredients_food values(106, 16, 61, 600);
  insert into Ingredients_food values(107, 16, 41, 500);  

  insert into Ingredients_food values(108, 17, 62, 100);   
  insert into Ingredients_food values(109, 17, 49, 3000); 
  insert into Ingredients_food values(110, 17, 41, 500); 
  
  insert into Ingredients_food values(111, 18, 63, 600);
  insert into Ingredients_food values(112, 18, 64, 200);
  insert into Ingredients_food values(113, 18, 65, 100); 
  insert into Ingredients_food values(114, 18, 49, 3000);
  insert into Ingredients_food values(115, 18, 61, 600);
  insert into Ingredients_food values(116, 18, 60, 600);
  insert into Ingredients_food values(117, 18, 45, 200);
  
  insert into Ingredients_food values(118, 19, 18, 3000);
  insert into Ingredients_food values(119, 19, 9, 600);
  insert into Ingredients_food values(120, 19, 17, 100);	
  insert into Ingredients_food values(121, 19, 59, 800);  
  insert into Ingredients_food values(122, 19, 21, 1000);
  insert into Ingredients_food values(123, 19, 62, 100);    
  insert into Ingredients_food values(124, 19, 46, 3000); 
  insert into Ingredients_food values(125, 19, 24, 300);	   
  insert into Ingredients_food values(126, 19, 25, 300);
  
  
  insert into Ingredients_food values(127, 20, 66, 600); 
  insert into Ingredients_food values(128, 20, 24, 300);	
  insert into Ingredients_food values(129, 20, 1, 1000);  
  insert into Ingredients_food values(130, 20, 9, 600);
  insert into Ingredients_food values(131, 20, 57, 2000);
  
  insert into Ingredients_food values(132, 21, 9, 600);
  insert into Ingredients_food values(133, 21, 67, 600);
  insert into Ingredients_food values(134, 21, 59, 800);  
  insert into Ingredients_food values(135, 21, 17, 100);	
 
 
  insert into Ingredients_food values(136, 22, 68, 400);
  insert into Ingredients_food values(137, 22, 69, 900);
  insert into Ingredients_food values(138, 22, 70, 1000);
  insert into Ingredients_food values(139, 22, 71, 150);  
  insert into Ingredients_food values(140, 22, 9, 600);
  insert into Ingredients_food values(141, 22, 59, 800);  
  insert into Ingredients_food values(142, 22, 72, 800);
  insert into Ingredients_food values(143, 22, 24, 300);	   
  insert into Ingredients_food values(144, 22, 25, 300);  

  insert into Ingredients_food values(145, 23, 22, 1000);  
  insert into Ingredients_food values(146, 23, 72, 800);
  insert into Ingredients_food values(147, 23, 8, 300);
  insert into Ingredients_food values(148, 23, 59, 800);  
  insert into Ingredients_food values(149, 23, 24, 300);	   
  insert into Ingredients_food values(150, 23, 25, 300); 

  insert into Ingredients_food values(151, 24, 9, 600);  
  insert into Ingredients_food values(152, 24, 6, 1000);
  insert into Ingredients_food values(153, 24, 21, 1000);
  insert into Ingredients_food values(154, 24, 73, 800);  
  insert into Ingredients_food values(155, 24, 24, 300);	   
  insert into Ingredients_food values(156, 24, 25, 300);   
  insert into Ingredients_food values(157, 24, 59, 800);  
 
  insert into Ingredients_food values(158, 25, 74, 900); 
  insert into Ingredients_food values(159, 25, 43, 150);  
  insert into Ingredients_food values(160, 25, 9, 600);  
  insert into Ingredients_food values(161, 25, 29, 850);
  insert into Ingredients_food values(162, 25, 30, 350);	
  insert into Ingredients_food values(163, 25, 17, 100);	
  insert into Ingredients_food values(164, 25, 25, 300);  
  insert into Ingredients_food values(165, 25, 66, 600);
  
  insert into Ingredients_food values(166, 26, 75, 1000);
  insert into Ingredients_food values(167, 26, 74, 900); 
  insert into Ingredients_food values(168, 26, 18, 3000);
  insert into Ingredients_food values(169, 26, 17, 100);	
  insert into Ingredients_food values(170, 26, 66, 600);
  insert into Ingredients_food values(171, 26, 43, 150);  
  insert into Ingredients_food values(172, 26, 29, 850);
  insert into Ingredients_food values(173, 26, 9, 600);  
  insert into Ingredients_food values(174, 26, 67, 600);
  insert into Ingredients_food values(175, 26, 6, 1000);

 
  insert into Ingredients_food values(176, 27, 76, 500);
  insert into Ingredients_food values(177, 27, 77, 500);
  insert into Ingredients_food values(178, 27, 1, 1000);  
  insert into Ingredients_food values(179, 27, 62, 100);    
  insert into Ingredients_food values(180, 27, 9, 600);  
  insert into Ingredients_food values(181, 27, 29, 850);
  
  insert into Ingredients_food values(182, 28, 78, 150);  
  insert into Ingredients_food values(183, 28, 22, 1000);  
  insert into Ingredients_food values(184, 28, 9, 600);  
  insert into Ingredients_food values(185, 28, 21, 1000);
  insert into Ingredients_food values(186, 28, 24, 300);	   
  insert into Ingredients_food values(187, 28, 25, 300);
  insert into Ingredients_food values(188, 28, 10, 550);

   insert into Ingredients_food values(189, 29, 79, 500);
   insert into Ingredients_food values(190, 29, 80, 150); 
   insert into Ingredients_food values(191, 29, 6, 1000); 
   insert into Ingredients_food values(192, 29, 66, 600);    
   insert into Ingredients_food values(193, 29, 24, 300);	   
   insert into Ingredients_food values(194, 29, 25, 300);
   insert into Ingredients_food values(195, 29, 22, 1000);  
   insert into Ingredients_food values(196, 29, 59, 800);    
   insert into Ingredients_food values(197, 29, 17, 100);
   
   insert into Ingredients_food values(198, 30, 82, 1000);
   insert into Ingredients_food values(199, 30, 81, 330);
   insert into Ingredients_food values(200, 30, 80, 150);
   insert into Ingredients_food values(201, 30, 18, 3000);
   insert into Ingredients_food values(202, 30, 24, 300);	   
   insert into Ingredients_food values(203, 30, 25, 300);     
   insert into Ingredients_food values(204, 30, 9, 600);  
   insert into Ingredients_food values(205, 30, 43, 150);  
  
   insert into Ingredients_food values(206, 31, 79, 500);
   insert into Ingredients_food values(207, 31, 81, 330);
   insert into Ingredients_food values(208, 31, 83, 600);
   insert into Ingredients_food values(209, 31, 84, 600);
   insert into Ingredients_food values(210, 31, 85, 1000);	   
   insert into Ingredients_food values(211, 31, 49, 3000);     
   insert into Ingredients_food values(212, 31, 55, 200);     

   insert into Ingredients_food values(213, 32, 85, 1000);
   insert into Ingredients_food values(214, 32, 86, 500);
   insert into Ingredients_food values(215, 32, 87, 400);	   
   insert into Ingredients_food values(216, 32, 88, 500);
   
   insert into Ingredients_food values(217, 33, 67, 600);
   insert into Ingredients_food values(218, 33, 81, 330);
   insert into Ingredients_food values(219, 33, 46, 3000);	   
   insert into Ingredients_food values(220, 33, 49, 3000);
   
   insert into Ingredients_food values(221, 34, 89, 700);
   insert into Ingredients_food values(222, 34, 90, 200);
   insert into Ingredients_food values(223, 34, 86, 500);	   
   insert into Ingredients_food values(224, 34, 85, 1000);
   
   insert into Ingredients_food values(225, 35, 90, 200);
   insert into Ingredients_food values(226, 35, 62, 100);	   
   insert into Ingredients_food values(227, 35, 86, 500); 

   
   insert into Ingredients_food values(228, 36, 88, 500);
   insert into Ingredients_food values(229, 36, 86, 500);	   
   insert into Ingredients_food values(230, 36, 81, 330);
   
   insert into Ingredients_food values(231, 37, 67, 600);
   insert into Ingredients_food values(232, 37, 39, 500);	   
   insert into Ingredients_food values(233, 37, 27, 5000); 
 
   insert into Ingredients_food values(234, 38, 27, 5000);
   insert into Ingredients_food values(235, 38, 18, 3000);
   insert into Ingredients_food values(236, 38, 27, 5000); 

   insert into Ingredients_food values(237, 39, 21, 700);
   insert into Ingredients_food values(238, 39, 65, 100);
   insert into Ingredients_food values(239, 39, 67, 600);    


   insert into Ingredients_food values(240, 40, 91, 400);
   insert into Ingredients_food values(241, 40, 9, 600);
   insert into Ingredients_food values(242, 40, 6, 1000);    

   insert into Ingredients_food values(243, 41, 21, 700);
   insert into Ingredients_food values(244, 41, 28, 300);
   insert into Ingredients_food values(245, 41, 6, 1000);
  
   insert into Ingredients_food values(246, 42, 18, 3000);
   insert into Ingredients_food values(247, 42, 82, 1000);
   insert into Ingredients_food values(248, 42, 65, 100);
   
   insert into Ingredients_food values(249, 43, 29, 850);
   insert into Ingredients_food values(250, 43, 18, 3000);
   insert into Ingredients_food values(251, 43, 67, 600); 

   insert into Ingredients_food values(252, 44, 8, 300);
   insert into Ingredients_food values(253, 44, 9, 600);
   insert into Ingredients_food values(254, 44, 21, 700); 


   insert into Ingredients_food values(255, 45, 92, 200);
   insert into Ingredients_food values(256, 45, 87, 400);
   insert into Ingredients_food values(257, 45, 59, 800); 

   insert into Ingredients_food values(258, 46, 18, 3000);
   insert into Ingredients_food values(259, 46, 9, 600);
   insert into Ingredients_food values(260, 46, 70, 1000);
   
   insert into Ingredients_food values(261, 47, 94, 600);
   insert into Ingredients_food values(262, 47, 93, 800);
   insert into Ingredients_food values(263, 47, 9, 600);
   
   insert into Ingredients_food values(264, 48, 93, 800);
   insert into Ingredients_food values(265, 48, 67, 600);
   insert into Ingredients_food values(266, 48, 65, 100);
   
      
   insert into Ingredients_food values(267, 49, 57, 2000);
   insert into Ingredients_food values(268, 49, 85, 1000);
   insert into Ingredients_food values(269, 49, 55, 200);
   
   insert into Ingredients_food values(270, 50, 60, 200);
   insert into Ingredients_food values(271, 50, 95, 600); 

   insert into Ingredients_food values(272, 51, 63, 600);
   insert into Ingredients_food values(273, 51, 60, 200);
   
   insert into Ingredients_food values(274, 52, 84, 600);
   insert into Ingredients_food values(275, 52, 61, 600); 
   insert into Ingredients_food values(276, 52, 60, 200);
   
   insert into Ingredients_food values(277, 53, 84, 600);
   insert into Ingredients_food values(278, 53, 60, 200);
   
   insert into Ingredients_food values(279, 54, 53, 500);
   insert into Ingredients_food values(280, 54, 57, 2000);
   
   insert into Ingredients_food values(281, 55, 18, 3000);
   insert into Ingredients_food values(282, 55, 21, 700);
   insert into Ingredients_food values(283, 55, 97, 750);

   insert into Ingredients_food values(284, 56, 22, 1000);
   insert into Ingredients_food values(285, 56, 18, 3000);
   insert into Ingredients_food values(286, 56, 31, 700);
   
   insert into Ingredients_food values(287, 57, 22, 1000);
   insert into Ingredients_food values(288, 57, 18, 3000);
   insert into Ingredients_food values(289, 57, 9, 600);
   
   insert into Ingredients_food values(290, 58, 22, 1000);
   insert into Ingredients_food values(291, 58, 6, 1000);
   insert into Ingredients_food values(292, 58, 93, 800);
   
   insert into Ingredients_food values(293, 59, 22, 1000);
   insert into Ingredients_food values(294, 59, 21, 700);
   insert into Ingredients_food values(295, 59, 93, 800);
   
   insert into Ingredients_food values(296, 60, 98, 950);
   insert into Ingredients_food values(297, 60, 6, 1000);   
  
  insert into Ingredients_food values(298, 61, 98, 950);
  insert into Ingredients_food values(299, 61, 33, 950);
  insert into Ingredients_food values(300, 61, 70, 1000);
  
  insert into Ingredients_food values(301, 62, 22, 1000);
  insert into Ingredients_food values(302, 62, 31, 700);
  insert into Ingredients_food values(303, 62, 18, 3000);
  
  insert into Ingredients_food values(304, 63, 4, 1000);
  insert into Ingredients_food values(305, 63, 16, 300);
  insert into Ingredients_food values(306, 63, 18, 3000);
  
    
  insert into Ingredients_food values(307, 64, 96, 150);
  insert into Ingredients_food values(308, 64, 16, 300);
  insert into Ingredients_food values(309, 64, 18, 3000);
  
      
  insert into Ingredients_food values(310, 65, 33, 950);
  insert into Ingredients_food values(311, 65, 23, 800);
  insert into Ingredients_food values(312, 65, 63, 600);
 
       
  insert into Ingredients_food values(313, 66, 27, 5000);
  insert into Ingredients_food values(314, 66, 72, 800);
  insert into Ingredients_food values(315, 66, 16, 300);
  
  
  insert into Ingredients_food values(316, 67, 84, 600);
  insert into Ingredients_food values(317, 67, 57, 2000);
  insert into Ingredients_food values(318, 67, 28, 300);

  insert into Ingredients_food values(319, 68, 100, 450);
  insert into Ingredients_food values(320, 68, 99, 150);
  insert into Ingredients_food values(321, 68, 28, 300);
  
  insert into Ingredients_food values(322, 69, 53, 500);
  insert into Ingredients_food values(323, 69, 58, 200);
  insert into Ingredients_food values(324, 69, 98, 150);
  
    
  insert into Ingredients_food values(325, 70, 84, 600);
  insert into Ingredients_food values(326, 70, 90, 200);
  insert into Ingredients_food values(327, 70, 62, 100);
  
  insert into Ingredients_food values(328, 71, 101, 800);
  insert into Ingredients_food values(329, 71, 11, 400);
  insert into Ingredients_food values(330, 71, 14, 800);
  
  insert into Ingredients_food values(331, 72, 84, 600);
  insert into Ingredients_food values(332, 72, 102, 800);
  insert into Ingredients_food values(333, 72, 60, 200);
  
  update Ingredients_food set quantity=quantity/15;