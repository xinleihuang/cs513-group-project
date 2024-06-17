DROP TABLE IF EXISTS Menu;
CREATE TABLE menu (
id VARCHAR(255) NOT NULL PRIMARY KEY,
name VARCHAR(255),
sponsor VARCHAR(255),
event VARCHAR(255),
venue VARCHAR(255),
place VARCHAR(255),
physical_description VARCHAR(255),
occasion VARCHAR(255),
notes VARCHAR(255),
call_number VARCHAR(255),
date DATE,
location VARCHAR(255),
currency VARCHAR(255),
currency_symbol VARCHAR(255),
status VARCHAR(255),
page_count NUMERIC,
dish_count NUMERIC
);
