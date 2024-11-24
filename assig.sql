CREATE DATABASE store_management COLLATE utf8mb4_unicode_ci;

CREATE TABLE `governorates` (
 `governorate_id` INT  AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(50) not null  UNIQUE  
);

CREATE TABLE `stores`(
 `store_id` INT not null AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(50) not null,
  `address` varchar (80),
  `governorate_id` INT,
   FOREIGN KEY (governorate_id) REFERENCES governorates (governorate_id)
);

CREATE TABLE `suppliers`(
  `supplier_id` int not null AUTO_INCREMENT PRIMARY KEY,
   `name` varchar(25)  not NULL,
   `phone` varchar(15) not NULL,
   `email` varchar(30) NOT NULL UNIQUE,
   `brief_data` TEXT
);

CREATE TABLE `products` (
  `product_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `name` varchar(25) NOT NULL,
   `code` varchar(30) NOT NULL UNIQUE,
   `description` TEXT,
   `price` DECIMAL (10,2),
   `supplier_id` INT,
   FOREIGN KEY(supplier_id) REFERENCES suppliers(suppliers_id)
);

CREATE TABLE `store_product`(
  `store_product_id` INT AUTO_INCREMENT PRIMARY KEY,
  `store_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  FOREIGN KEY (store_id) REFERENCES stores(store_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id),
  UNIQUE (store_id, product_id)  
);