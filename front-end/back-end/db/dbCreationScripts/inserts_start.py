import csv
import os

# Function to generate INSERT statements from CSV for toll stations
def generate_toll_stations(csv_file, table_name, output_sql_file):
    try:
        # Open the SQL file to write
        with open(output_sql_file, 'w', encoding='utf-8') as sql_file:
            # Write the CREATE TABLE statement
            sql_file.write(f"-- Create the insterts for the {table_name} table --\n")
            
            # Open the CSV file
            with open(csv_file, 'r', encoding='utf-8') as file:
                reader = csv.reader(file)
                headers = next(reader)  # Read the first row as column names
                
                # Write the INSERT statements
                for row in reader:
                    # Extract and format the row values
                    values = {
                        "TollID": row[2],
                        "Name": row[3],
                        "Road": row[6],
                        "Lat": row[7],
                        "Long_": row[8],
                        "Locality": row[5],
                        "Email": row[9],
                        "PM": row[4],
                        "Price1": row[10],
                        "Price2": row[11],
                        "Price3": row[12],
                        "Price4": row[13],
                        "OperatorID": row[0],
                    }
                    
                    # Construct the INSERT statement
                    insert_statement = (
                        f"INSERT INTO {table_name} "
                        f"(ID, Name, Road, Lat, Long_, Locality, Email, PM, Price1, Price2, Price3, Price4, OperatorID) "
                        f"VALUES ('{values['TollID']}', '{values['Name']}', '{values['Road']}', {values['Lat']}, {values['Long_']}, '{values['Locality']}', '{values['Email']}', '{values['PM']}', "
                        f"{values['Price1']}, {values['Price2']}, {values['Price3']}, {values['Price4']}, '{values['OperatorID']}');"
                    )
                    # Write the INSERT statement to the SQL file
                    sql_file.write(insert_statement + "\n")
        
        print(f"SQL file '{output_sql_file}' generated successfully!")
    except Exception as e:
        print(f"Error: {e}")

# Function to generate INSERT statements from CSV for operators
def append_operator_inserts(output_sql_file):
    # Data for the Operator table
    operator_data = [
        {"ID": "AM", "Name": "aegeanmotorway"},
        {"ID": "EG", "Name": "egnatia"},
        {"ID": "GE", "Name": "gefyra"},
        {"ID": "KO", "Name": "kentrikiodos"},
        {"ID": "MO", "Name": "moreas"},
        {"ID": "NAO", "Name": "naodos"},
        {"ID": "NO", "Name": "neaodos"},
        {"ID": "OO", "Name": "olympiaodos"},
        {"ID": "admin", "Name": "admin"},
    ]

    try:
        # Open the output file in append mode
        with open(output_sql_file, 'a', encoding='utf-8') as sql_file:
            sql_file.write(f"-- Create the insterts for the operators table --\n")
            # Write the INSERT statements
            for operator in operator_data:
                insert_statement = (
                    f"INSERT INTO Operator (ID, Name) "
                    f"VALUES ('{operator['ID']}', '{operator['Name']}');\n"
                )
                sql_file.write(insert_statement)

        print(f"INSERT statements for 'Operator' table appended to '{output_sql_file}' successfully!")
    except Exception as e:
        print(f"Error: {e}")


# Function to generate INSERT statements for users
def append_user_inserts(output_sql_file):
    # Data for the User table
    user_data = [
        {"Role": "aegeanmotorway", "Password": "aegeanmotorway", "OperatorID": "AM"},
        {"Role": "egnatia", "Password": "egnatia", "OperatorID": "EG"},
        {"Role": "gefyra", "Password": "gefyra", "OperatorID": "GE"},
        {"Role": "kentrikiodos", "Password": "kentrikiodos", "OperatorID": "KO"},
        {"Role": "moreas", "Password": "moreas", "OperatorID": "MO"},
        {"Role": "naodos", "Password": "naodos", "OperatorID": "NAO"},
        {"Role": "neaodos", "Password": "neaodos", "OperatorID": "NO"},
        {"Role": "olympiaodos", "Password": "olympiaodos", "OperatorID": "OO"},
        {"Role": "admin", "Password": "admin", "OperatorID": "admin"}, 
    ]

    try:
        # Open the output file in append mode
        with open(output_sql_file, 'a', encoding='utf-8') as sql_file:
            sql_file.write(f"-- Create the insterts for the users table --\n")
            # Write the INSERT statements
            for user in user_data:
                operator_id = f"'{user['OperatorID']}'" if user['OperatorID'] != "NULL" else "NULL"
                insert_statement = (
                    f"INSERT INTO User (Role, Password, OperatorID) "
                    f"VALUES ('{user['Role']}', '{user['Password']}', {operator_id});\n"
                )
                sql_file.write(insert_statement)

        print(f"INSERT statements for 'User' table appended to '{output_sql_file}' successfully!")
    except Exception as e:
        print(f"Error: {e}")

#Function to initialize the debts table
def generate_debt_inserts(output_file):
    # List of OpIDs
    op_ids = ['AM', 'EG', 'GE', 'KO', 'MO', 'NAO', 'NO', 'OO']
    try:
        with open(output_file, 'a', encoding='utf-8') as file:
            file.write(f"-- Create the insterts for the Debts table --\n")
            for from_op in op_ids:
                for to_op in op_ids:
                    if from_op != to_op:  # Avoid same operator combinations
                        insert_statement = (
                            f"INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator) "
                            f"VALUES (0, NULL, '{to_op}', '{from_op}');\n"
                        )
                        file.write(insert_statement)
        print(f"INSERT statements successfully appended to {output_file}!")
    except Exception as e:
        print(f"Error: {e}")



# Main function
if __name__ == "__main__":
    # Specify the CSV file and table name
    csv_file_path = r"back-end\tollstations2024.csv"
    table_name = "Toll_Station"
    
    # Generate the output SQL file path
    output_sql_file_path = r"back-end\inserts_start.sql"
    
    # Generate INSERT statements for toll stations
    generate_toll_stations(csv_file_path, table_name, output_sql_file_path)

    # Generate INSERT statements for Operators
    append_operator_inserts(output_sql_file_path)

    # Generate INSERT statements for Users
    append_user_inserts(output_sql_file_path)

    # Generate INSERT statements for Debts (initialization)
    generate_debt_inserts(output_sql_file_path)   