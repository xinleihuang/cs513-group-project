DROP TABLE IF EXISTS MenuPage_csv;
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
