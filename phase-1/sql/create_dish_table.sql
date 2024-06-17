DROP TABLE IF EXISTS dish;
CREATE TABLE dish (
id VARCHAR(255) NOT NULL PRIMARY KEY,
name varchar(255),
description VARCHAR(255),
menus_appeared NUMERIC,
times_appeared NUMERIC,
first_appeared NUMERIC,
last_appeared NUMERIC,
lowest_price NUMERIC,
highest_price NUMERIC
);
