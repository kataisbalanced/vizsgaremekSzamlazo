SELECT * FROM buyers;
SELECT id 'Product ID',productName 'Product name',price $  FROM products;
SELECT * FROM owner;

-- Szamlalo adatbazis legeneralasa

CREATE DATABASE szamlalo
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;

-- Termekek tabla 
CREATE TABLE szamlalo.products (
  id INT(11) NOT NULL AUTO_INCREMENT,
  productName VARCHAR(255) DEFAULT NULL,
  price INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;


-- Szamlatetel tabla
CREATE TABLE szamlalo.szamlatetel (
  id INT(11) NOT NULL AUTO_INCREMENT, -- Szamlazo tabla ID-je. Ez a fo ID.
  szamlafejid INT(11) DEFAULT NULL, -- Szamlafej tabla ID-je itt csatlakozik ossze.
  termekid INT(11) DEFAULT NULL, -- Termekek tabla ID-je itt csatlakozik ossze.
  mennyiseg INT(11) DEFAULT NULL, -- Mennyisége a dolgoknak.
  mennyisegiegyseg VARCHAR(255) DEFAULT NULL, -- Mennyiseg egysege.
  bruttoegysegar INT(11) DEFAULT NULL, -- Ara a vett termeknek.
  afaszazalek INT(11) DEFAULT NULL, -- Afa ara.
  PRIMARY KEY (id)
)
ENGINE = INNODB;


-- Szamlafej tabla
CREATE TABLE szamlalo.szamlafej (
  id INT(11) NOT NULL AUTO_INCREMENT, -- Szamlafej tabla ID-je. Ezen keresztul fog csatlakozni a Szamlatetelhez.
  szamlaszam INT(11) DEFAULT NULL,  -- Szamlaszam amin kereszt?l fizet a vevo.
  kelt VARCHAR(255) DEFAULT NULL, -- Mikor kelt a szamla.
  teljesites VARCHAR(255) DEFAULT NULL, -- ?XDKYS
  vevoid INT(11) DEFAULT NULL, -- VevoID. Ezen keresztul fog csatlakozni a vevo tablahoz.
  PRIMARY KEY (id)
)
ENGINE = INNODB;


 -- Vevok tabla
CREATE TABLE szamlalo.buyers (
  id INT(11) NOT NULL AUTO_INCREMENT, -- szamlalo 
  name VARCHAR(255) DEFAULT NULL,
  postalCode INT(11) DEFAULT NULL,
  settlement VARCHAR(255) DEFAULT NULL,
  streetAddress VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;


-- Users tabla
CREATE TABLE szamlalo.users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(255) DEFAULT NULL,
  lastName VARCHAR(255) DEFAULT NULL,
  gender VARCHAR(255) DEFAULT NULL,
  userName VARCHAR(255) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  password VARCHAR(255) DEFAULT NULL,
  number INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB;


-- Fileba olvasas (products)


insert into products(productName,price) VALUES
('Celestron NexStar Evolution 9.25"', '6432'),
('Celestron Inspire 100AZ Refractor', '2345'),
('Celestron Astro Fi 102', '586'),
('Celestron NexStar 5SE', '8890'),
('Celestron NexStar 4SE', '544'),
('Celestron StarSense Explorer LT 114AZ', '2269'),
('Celestron NexStar Evolution 9.25', '2840'),
('Celestron NexStar Evolution 6', '179'),
('Celestron NexStar Evolution 8', '219'),
('Celestron AstroFi 130/650 Newton', '359'),
('130/900 SkyWatcher Explorer-130 Newton EQ2', '365'),
('SkyWatcher Virtuoso Gti 130/650 Dobson','894'),
('Celestron CPC Deluxe 1100 HD', '5098'),
('Celestron NexStar Evolution 9.25"', '2570'),
('Celestron Inspire 100AZ Refractor', '267'),
('Celestron Astro Fi 102', '585'),
('Celestron NexStar 5SE', '840'),
('Celestron NexStar 4SE', '543'),
('Celestron StarSense Explorer LT 114AZ', '219'),
('Celestron NexStar Evolution B 9.25', '2840'),
('Celestron NexStar Evolution B 6', '16125'),
('Celestron NexStar Evolution B 8', '2142'),
('Celestron AstroFi 130/650 Newton B', '300'),
('130/900 SkyWatcher Explorer-130 Newton EQ2B', '325'),
('SkyWatcher Virtuoso Gti 130/650 Dobson B', '394'),
('Celestron CPC Deluxe 1100 HD B', '50939'),
('Celestron NexStar Evolution A 9.25 C"', '23550'),
('Celestron Inspire 100AZ Refractor D', '2237'),
('Celestron Astro Fi 102 G', '5827'),
('Celestron NexStar 5SE G', '8001'),
('Celestron NexStar 4SE G', '5446'),
('Celestron StarSense Explorer LTA 114AZG', '2296'),
('Celestron NexStar Evolution 9.25 AG', '28408'),
('Celestron NexStar Evolution 6 C', '16795'),
('Celestron NexStar Evolution 8 AC', '21997'),
('Celestron AstroFi 130/650 Newton C', '6895'),
('130/900 SkyWatcher Explorer-130 Newton EQ2 C', '3645'),
('SkyWatcher Virtuoso Gti 130/650 Dobson C', '3943'),
('Celestron CPC Deluxe 1100 HD C', '509'),
('Celestron NexStar Evolution 9.25 C"', '2370'),
('Celestron Inspire 100AZ Refractor S', '2270'),
('Celestron Astro Fi 102 C', '5873'),
('Celestron NexStar 5SE E', '800'),
('Celestron NexStar 4SE E', '544'),
('Celestron StarSense Explorer LT 114AZ U', '2029'),
('Celestron NexStar Evolutionb 9.25 U', '28403'),
('Celestron NexStar Evolution 6 U', '167924'),
('Celestron NexStar Evolution 8 U', '219932'),
('Celestron AstroFi 130/650 Newton U', '68914'),
('130/900 SkyWatcher Explorer-130 Newton EQ2 U', '33265');


insert into buyers(name,postalCode,settlement,streetAddress) VALUES
  ('Kovacs Roland','5000','Szolnok','Sziget utca 4'),
  ('Nagy Ibolya','1051','Budapest','Nefelejcs ut 7'),
  ('Ady Endre','1051','Budapest','Fortuna utca 16'),
  ('Kossuth Andras','5100','Jaszbereny','Sulloi ut 1'),
  ('Rakoczy Peter','2740','Abony','Prohaszka utca 10');

insert into owner(id,companyName) VALUES
  (1,'Pablo Számlázó KKK Kft.');