import csv
import os

# Function to generate INSERT statements from CSV for tag and pass
def generate_tag_and_pass_inserts(csv_file, output_sql_file):
    try:
        # Use a set to keep track of unique Tag entries
        tag_entries = set()

        # Open the output SQL file in write mode
        with open(output_sql_file, 'w', encoding='utf-8') as sql_file:
            # Open the input CSV file
            with open(csv_file, 'r', encoding='utf-8') as file:
                reader = csv.reader(file)
                headers = next(reader)  # Skip the headers

                # Iterate through each line in the CSV
                for row in reader:
                    timestamp, tollID, tagRef, tagHomeID, charge = row

                    # Generate INSERT for the Tag table (if not already added) 
                    if tagRef not in tag_entries:
                        tag_insert = (
                            f"INSERT INTO Tag (ID, OperatorID) "
                            f"VALUES ('{tagRef}', '{tagHomeID}');"
                        )
                        sql_file.write(tag_insert + "\n")
                        tag_entries.add(tagRef)

                    # Generate INSERT for the Pass table
                    pass_insert = (
                        f"INSERT INTO Pass (Timestamp, Amount, Toll_StationID, TagID) "
                        f"VALUES ('{timestamp}', {float(charge)}, '{tollID}', '{tagRef}');"
                    )
                    sql_file.write(pass_insert + "\n")

        print(f"SQL file '{output_sql_file}' generated successfully!")
    except Exception as e:
        print(f"Error: {e}")



# Main function
if __name__ == "__main__":
    # Specify the CSV file and table name
    csv_file_path = r"back-end\passes-sample.csv"
    table_name = "Toll_Station"
    
    # Generate the output SQL file path
    output_sql_file_path = r"back-end\inserts_passes.sql"
    
    # Generate INSERT statements for toll stations
    generate_tag_and_pass_inserts(csv_file_path,output_sql_file_path)