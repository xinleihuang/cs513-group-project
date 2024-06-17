PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
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
CREATE TABLE menu_page (
id VARCHAR(255) NOT NULL PRIMARY KEY,
menu_id VARCHAR(255),
page_number NUMERIC,
image_id VARCHAR(255),
full_height NUMERIC,
full_width NUMERIC,
uuid VARCHAR(255),
FOREIGN KEY (menu_id)
  REFERENCES menu (id)
);
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
CREATE TABLE menu_item (
id VARCHAR(255) NOT NULL PRIMARY KEY,
menu_page_id VARCHAR(255),
price NUMERIC,
high_price NUMERIC,
dish_id NUMERIC,
created_at DATE,
updated_at DATE,
xpos NUMERIC,
ypos NUMERIC,
FOREIGN KEY (menu_page_id)
  REFERENCES menu_page (id)
);
COMMIT;
