import pandas as pd
import os

def load_data(file_name):
    raw_path = os.path.join('data', 'raw', f'{file_name}.csv')
    cleaned_path = os.path.join('data', 'cleaned', f'{file_name}_cleaned_v2.csv')
    return pd.read_csv(raw_path), pd.read_csv(cleaned_path)

def compare_datasets(raw, clean, name):
    if not hasattr(compare_datasets, 'first_time_called'):
        print(f"Dataset\tColumn\tRaw Unique\tCleaned Unique\tRaw Null\tCleaned Null")
        compare_datasets.first_time_called = True

    for column in raw.columns:
        if column in clean.columns:
            print(f"{name}\t{column}\t{raw[column].nunique()}\t{clean[column].nunique()}\t{raw[column].isnull().sum()}\t{clean[column].isnull().sum()}")

for dataset in ['Menu', 'Dish', 'MenuItem', 'MenuPage']:
    raw, clean = load_data(dataset)
    compare_datasets(raw, clean, dataset)