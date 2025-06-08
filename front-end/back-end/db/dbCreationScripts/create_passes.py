import csv
import random
import os
import string
import pandas as pd
from datetime import datetime, timedelta

toll_prices_df = pd.read_excel("back-end/tollAndPrices.xlsx", sheet_name="Sheet1")
toll_prices_dict = toll_prices_df.set_index("TollID").T.to_dict()



# Operators list
operatorsIDS = [
'AM01', 'AM02', 'AM03', 'AM04', 'AM05', 'AM06', 'AM07', 'AM08', 'AM09', 'AM10',
'AM11', 'AM12', 'AM13', 'AM14', 'AM15', 'AM16', 'AM17', 'AM18', 'AM19', 'AM20',
'AM21', 'AM22', 'AM23', 'AM24', 'AM25', 'AM26', 'AM27', 'AM28', 'AM29', 'AM30',
'EG01', 'EG02', 'EG03', 'EG04', 'EG05', 'EG06', 'EG07', 'EG08', 'EG09', 'EG10',
'EG11', 'EG12', 'EG13', 'EG14', 'EG15', 'EG16', 'EG17', 'EG18', 'EG19', 'EG20',
'EG21', 'EG22', 'EG23', 'EG24', 'EG25', 'EG26', 'EG27', 'EG28', 'EG29', 'EG30',
'EG31', 'EG32', 'EG33', 'EG34', 'EG35', 'EG36', 'EG37', 'EG38', 'EG39', 'EG40',
'EG41', 'EG42', 'EG43', 'EG44', 'EG45', 'EG46', 'EG47', 'EG48', 'EG49', 'EG50',
'EG51', 'EG52', 'EG53', 'EG54', 'EG55', 'EG56', 'EG57', 'EG58', 'EG59', 'EG60',
'EG61', 'EG62', 'EG63', 'EG64', 'EG65', 'EG66', 'EG67', 'EG68', 'EG69', 'EG70',
'EG71', 'EG72', 'EG73', 'EG74', 'GE01', 'GE02', 'KO01', 'KO02', 'KO03', 'KO04',
'KO05', 'KO06', 'KO07', 'KO08', 'KO09', 'KO10', 'KO11', 'KO12', 'KO13', 'KO14',
'KO15', 'KO16', 'KO17', 'KO18', 'KO19', 'KO20', 'KO21', 'KO22', 'KO23', 'KO24',
'KO25', 'KO26', 'MO01', 'MO02', 'MO03', 'MO04', 'MO05', 'MO06', 'MO07', 'MO08',
'MO09', 'MO10', 'MO11', 'MO12', 'MO13', 'MO14', 'MO15', 'MO16', 'MO17', 'MO18',
'NAO01', 'NAO02', 'NAO03', 'NAO04', 'NAO05', 'NAO06', 'NAO07', 'NAO08', 'NAO09', 'NAO10',
'NAO11', 'NAO12', 'NAO13', 'NAO14', 'NAO15', 'NAO16', 'NAO17', 'NAO18', 'NAO19', 'NAO20',
'NAO21', 'NAO22', 'NAO23', 'NAO24', 'NAO25', 'NAO26', 'NAO27', 'NAO28', 'NAO29', 'NAO30',
'NAO31', 'NAO32', 'NAO33', 'NAO34', 'NAO35', 'NAO36', 'NAO37', 'NAO38', 'NAO39', 'NAO40',
'NAO41', 'NO01', 'NO02', 'NO03', 'NO04', 'NO05', 'NO06', 'NO07', 'NO08', 'NO09', 'NO10',
'NO11', 'NO12', 'NO13', 'NO14', 'NO15', 'NO16', 'NO17', 'NO18', 'NO19', 'NO20',
'NO21', 'NO22', 'NO23', 'NO24', 'NO25', 'NO26', 'NO27', 'NO28', 'NO29', 'NO30',
'NO31', 'NO32', 'NO33', 'NO34', 'OO01', 'OO02', 'OO03', 'OO04', 'OO05', 'OO06',
'OO07', 'OO08', 'OO09', 'OO10', 'OO11', 'OO12', 'OO13', 'OO14', 'OO15', 'OO16',
'OO17', 'OO18', 'OO19', 'OO20', 'OO21', 'OO22', 'OO23', 'OO24', 'OO25', 'OO26',
'OO27', 'OO28'
]

operators = ["AM", "EG", "GE", "KO", "MO", "NAO", "NO", "OO"]

# Generate a toll ID: OPXX
def generate_toll_id():
    operatorid = random.choice(operatorsIDS)
    return operatorid

# Generate a tagRef: OPXXXXXXX
def generate_tag_ref():
    operator = random.choice(operators)
    random_string = ''.join(random.choices(string.ascii_uppercase + string.digits, k=7))
    return f"{operator}{random_string}"

# Generate random timestamps
def generate_timestamp(start_time, end_time):
    delta = end_time - start_time
    random_seconds = random.randint(0, int(delta.total_seconds()))
    return start_time + timedelta(seconds=random_seconds)

# Generate random charges based on tollID
def generate_charge(toll_id):
    if toll_id in toll_prices_dict:
        prices = [
            toll_prices_dict[toll_id]['Price1'],
            toll_prices_dict[toll_id]['Price2'],
            toll_prices_dict[toll_id]['Price3'],
            toll_prices_dict[toll_id]['Price4']
        ]
        return random.choice(prices)
    else:
        return round(random.uniform(1.0, 10.0), 2)  # Default if tollID is not found
# Create the CSV file
def create_csv(filename, num_entries):
    # Ensure the 'back-end' folder exists
    folder_path = "back-end"
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)

    # Set the full file path to the back-end folder
    file_path = os.path.join(folder_path, filename)

    # Open the file with the full path
    with open(file_path, 'w', newline='') as csvfile:
        absolute_path = os.path.abspath(file_path)
        fieldnames = ["timestamp", "tollID", "tagRef", "tagHomeID", "charge"]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        
        # Define start and end time
        start_time = datetime(2022, 1, 1, 0, 0)
        end_time = datetime(2022, 1, 2, 0, 0)
        
        # Write random entries
        for _ in range(num_entries):
            toll_id = generate_toll_id()
            operator = toll_id[:-2]  # Extract operator from toll ID
            writer.writerow({
                "timestamp": generate_timestamp(start_time, end_time).strftime("%d-%m-%y %H:%M"),
                "tollID": toll_id,
                "tagRef": generate_tag_ref(),
                "tagHomeID": operator,
                "charge": generate_charge(toll_id)
            })
    print(f"CSV file '{absolute_path}' created successfully with {num_entries} entries.")

if __name__ == "__main__":
    create_csv("toll_data.csv", 200)  # Save the CSV file in 'back-end'
