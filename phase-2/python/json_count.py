import json
import os
import glob
import pandas as pd

def analyze_openrefine_history(file_path):
    with open(file_path, 'r') as file:
        history = json.load(file)
    operation_count = len(history)
    operation_types = {}
    values_consolidated = 0
    for entry in history:
        if isinstance(entry, dict):
            if 'op' in entry:
                op_type = entry['op']
                operation_types[op_type] = operation_types.get(op_type, 0) + 1
            if 'operation' in entry and 'mass_edit' in entry['operation']:
                for edit in entry['operation']['mass_edit']:
                    values_consolidated += len(edit['from'])
    most_common_op = max(operation_types, key=operation_types.get) if operation_types else "N/A"
    return operation_count, most_common_op, values_consolidated

def load_data(file_name):
    raw_path = os.path.join('data', 'raw', f'{file_name}.csv')
    cleaned_path = os.path.join('data', 'cleaned', f'{file_name}_cleaned_v2.csv')
    return pd.read_csv(raw_path), pd.read_csv(cleaned_path)

def compare_datasets(raw, clean):
    columns_changed = 0
    net_unique_reduction = 0
    nulls_created = 0
    nulls_eliminated = 0
    for column in raw.columns:
        if column in clean.columns:
            unique_diff = raw[column].nunique() - clean[column].nunique()
            null_diff = clean[column].isnull().sum() - raw[column].isnull().sum()
            if unique_diff != 0 or null_diff != 0:
                columns_changed += 1
            net_unique_reduction += unique_diff
            if null_diff > 0:
                nulls_created += null_diff
            else:
                nulls_eliminated += abs(null_diff)
    return columns_changed, net_unique_reduction, nulls_created, nulls_eliminated

phase2_dir = os.path.join('phase-2', 'yw', 'history')

summary_data = []

for dataset in ['Menu', 'Dish', 'MenuItem', 'MenuPage']:
    history_file = os.path.join(phase2_dir, f'{dataset.lower()}-openrefine-history-v2.json')
    operation_count, most_common_op, values_consolidated = analyze_openrefine_history(history_file)
    
    # Analyze dataset changes
    raw, clean = load_data(dataset)
    columns_changed, net_unique_reduction, nulls_created, nulls_eliminated = compare_datasets(raw, clean)
    
    summary_data.append({
        'Dataset': dataset,
        'Total Operations': operation_count,
        'Most Common Operation': most_common_op,
        'Values Consolidated': values_consolidated,
        'Nulls Created': nulls_created,
        'Columns Changed': columns_changed
    })

# Create DataFrame and save as TSV
summary_df = pd.DataFrame(summary_data)
summary_df.to_csv('data_cleaning_summary.tsv', sep='\t', index=False)
print("Summary saved to data_cleaning_summary.tsv")
print(summary_df.to_string(index=False))