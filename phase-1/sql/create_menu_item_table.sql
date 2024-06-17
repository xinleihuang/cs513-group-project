DROP TABLE IF EXISTS menu_item;
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
