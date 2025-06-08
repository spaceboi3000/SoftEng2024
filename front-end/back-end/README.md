#  Backend - SE2407 Σύστημα Διαχείρισης Διοδίων

Το **backend** αποτελεί το API και τη βάση δεδομένων του **SE2407**, παρέχοντας endpoints για τη διαχείριση διελεύσεων, χρηστών και σταθμών διοδίων.

---

## 📂 Δομή του Backend

```
back-end/
│── app/              # Κύριος κώδικας εφαρμογής (API endpoints, μοντέλα, controllers)
│── db/               # Σχεδιασμός και αρχικοποίηση βάσης δεδομένων
│── queries/          # SQL queries και βοηθητικά scripts
│── passes-sample.csv # Δείγμα αρχείου διελεύσεων
│── toll_data.csv     # Δεδομένα σταθμών διοδίων
│── tollstations2024.csv # Νεότερα δεδομένα διοδίων
│── tollAndPrices.xlsx # Τιμές και στατιστικά διοδίων
```

---

## 🔧 Τεχνολογίες που χρησιμοποιούνται
- **Backend Framework:** Flask / FastAPI
- **Database:** SQL
- **Authentication:** JWT Tokens
