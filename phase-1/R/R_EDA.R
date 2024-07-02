library(dplyr)
library(ggplot2)
library(data.table)
library(tidyverse)

raw_dish <- fread("data/raw/Dish.csv")
raw_menu <- fread("data/raw/Menu.csv")
raw_menu_item <- fread("data/raw/MenuItem.csv")
raw_menu_page <- fread("data/raw/MenuPage.csv")

cleaned_dish <- fread("data/cleaned/Dish_cleaned_v2.csv")
cleaned_menu <- fread("data/cleaned/Menu_cleaned_v2.csv")
cleaned_menu_item <- fread("data/cleaned/MenuItem_cleaned_v2.csv")
cleaned_menu_page <- fread("data/cleaned/MenuPage_cleaned_v2.csv")
