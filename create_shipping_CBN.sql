DROP DATABASE IF EXISTS shipping;

CREATE DATABASE shipping;

USE shipping;

CREATE TABLE port (
portName VARCHAR(15) NOT NULL,
city VARCHAR(20) NOT NULL,
country VARCHAR(20) NOT NULL,
PRIMARY KEY (portName, city)
);

CREATE TABLE ship (
shipName VARCHAR(15) NOT NULL UNIQUE,
displacement DECIMAL(6,0) NOT NULL,
builtYear YEAR NOT NULL,
portName VARCHAR(15) NOT NULL,
city VARCHAR(20) NOT NULL,
captName VARCHAR(25) NOT NULL,
crew INT NOT NULL,
PRIMARY KEY(shipName),
FOREIGN KEY(portName, city) REFERENCES port (portName, city)
);

CREATE TABLE container (
containerID CHAR(6) NOT NULL UNIQUE,
height INT NOT NULL,
width INT NOT NULL,
length INT NOT NULL,
weight INT NOT NULL,
shipName VARCHAR(15) NULL,
FOREIGN KEY(shipName) REFERENCES ship(shipName)
);





