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

## Menu EDA ####

raw_menu %>%
  filter(location != "") %>%
  count(location) %>%
  arrange(desc(n)) %>%
  head(1)

raw_menu %>%
  filter(place != "") %>%
  count(place) %>%
  arrange(desc(n)) %>%
  head(10)

raw_menu %>%
  filter(event != "") %>%
  count(event) %>%
  arrange(desc(n)) %>%
  head(20)

raw_menu %>%
  filter(page_count != "") %>%
  count(page_count) %>%
  arrange(desc(n)) %>%
  head(5)

raw_menu %>%
  filter(sponsor != "") %>%
  count(sponsor) %>%
  arrange(desc(n)) %>%
  head(1)

raw_menu %>%
  filter(event != "") %>%
  count(event) %>%
  arrange(desc(n)) %>%
  head(1)

raw_menu$date <- as.Date(raw_menu$date, format = "%m/%d/%Y")

min_date <- as.Date("1900-01-01")
max_date <- as.Date("2024-06-30")

cleaned_dates <- raw_menu %>%
  filter(date >= min_date & date <= max_date | is.na(date))

cleaned_dates <- cleaned_dates %>%
  filter(!is.na(date))

summary(cleaned_dates$date)

ggplot(cleaned_dates, aes(x = date)) +
  geom_histogram(binwidth = 365, color = "black", fill = "lightblue") +
  labs(title = "Distribution of Menus Over Time", x = "Date", y = "Frequency") +
  theme_minimal()

## Menu Page EDA ####

raw_menu_page %>%
  filter(page_number != "") %>%
  count(page_number) %>%
  arrange(desc(n)) %>%
  head(5)

## Menu Item EDA ####

raw_menu_item

# raw_menu_item %>%
#   filter(price != "") %>%
#   count(price) %>%
#   arrange(desc(n)) %>%
#   head(5)

raw_dish

raw_dish %>%
  filter(menus_appeared != "") %>%
  count(menus_appeared) %>%
  arrange(desc(n)) %>%
  head(5)

raw_dish %>%
  filter(times_appeared != "") %>%
  count(times_appeared) %>%
  arrange(desc(n)) %>%
  head(5)

raw_dish %>%
  filter(lowest_price != "") %>%
  count(lowest_price) %>%
  arrange(desc(n)) %>%
  head(20)

library(skimr)

skim(raw_dish)



