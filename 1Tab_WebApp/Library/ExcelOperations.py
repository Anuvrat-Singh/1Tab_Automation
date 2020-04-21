import pandas as pd


def get_row_count(path, sheet_name):
    num_of_rows = pd.read_excel(path, sheet_name).shape[0]
    return num_of_rows


def get_column_count(path, sheet_name):
    num_of_cols = pd.read_excel(path, sheet_name).shape[1]
    return num_of_cols


def read_data_from_excel(path, sheet_name, row_num, col_num):
    df = pd.read_excel(path, sheet_name)
    return df.iat[row_num, col_num]


def write_data_to_excel(path, sheet_name, row_num, col_num, data):
    df = pd.read_excel(path, sheet_name)
    df.iat[row_num, col_num] = data
    writer = pd.ExcelWriter("../Results/TestResult.xlsx", engine='xlsxwriter')
    df.to_excel(writer, sheet_name=sheet_name)
    writer.save()