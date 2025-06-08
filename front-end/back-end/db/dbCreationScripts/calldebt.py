operators = ["AM" ,"EG","GE","KO","MO","NAO","NO", "OO"]
for operator1 in operators:
    for operator2 in operators:
        if operator1 != operator2:
            print(f"Call Debt('{operator1}','{operator2}');")