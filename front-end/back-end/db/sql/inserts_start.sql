-- Create the insterts for the operators table --
INSERT INTO Operator (ID, Name)
VALUES ('AM', 'aegeanmotorway');
INSERT INTO Operator (ID, Name)
VALUES ('EG', 'egnatia');
INSERT INTO Operator (ID, Name)
VALUES ('GE', 'gefyra');
INSERT INTO Operator (ID, Name)
VALUES ('KO', 'kentrikiodos');
INSERT INTO Operator (ID, Name)
VALUES ('MO', 'moreas');
INSERT INTO Operator (ID, Name)
VALUES ('NAO', 'naodos');
INSERT INTO Operator (ID, Name)
VALUES ('NO', 'neaodos');
INSERT INTO Operator (ID, Name)
VALUES ('OO', 'olympiaodos');
INSERT INTO Operator (ID, Name)
VALUES ('admin', 'admin');
-- Create the insterts for the Toll_Station table --
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM01',
        'Σταθμός Διοδίων Κλειδίου Μετωπικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        40.51974,
        22.57247,
        'Ημαθίας-Κλειδί',
        'customercare@aegeanmotorway.gr',
        'ΜΤ',
        1.40,
        2.00,
        5.90,
        8.30,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM02',
        'Σταθμός Διοδίων Κλειδίου Μετωπικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        40.51943,
        22.57290,
        'Ημαθίας-Κλειδί',
        'customercare@aegeanmotorway.gr',
        'ΜΤ',
        1.40,
        2.00,
        5.90,
        8.30,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM03',
        'Σταθμός Διοδίων Μακρυχωρίου Μετωπικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.80461,
        22.50252,
        'Λάρισας-Μακρυχώρι',
        'customercare@aegeanmotorway.gr',
        'ΜΤ',
        1.60,
        2.20,
        6.80,
        9.60,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM04',
        'Σταθμός Διοδίων Μακρυχωρίου Μετωπικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.80427,
        22.50270,
        'Λάρισας-Μακρυχώρι',
        'customercare@aegeanmotorway.gr',
        'ΜΤ',
        1.60,
        2.20,
        6.80,
        9.60,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM05',
        'Σταθμός Διοδίων Μοσχοχωρίου Μετωπικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.52294,
        22.55670,
        'Λάρισας-Μοσχοχώρι',
        'customercare@aegeanmotorway.gr',
        'ΜΤ',
        2.50,
        3.60,
        10.80,
        15.10,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM06',
        'Σταθμός Διοδίων Μοσχοχωρίου Μετωπικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.52292,
        22.55705,
        'Λάρισας-Μοσχοχώρι',
        'customercare@aegeanmotorway.gr',
        'ΜΤ',
        2.50,
        3.60,
        10.80,
        15.10,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM07',
        'Σταθμός Διοδίων Λεπτοκαρυάς Μετωπικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        40.03581,
        22.56973,
        'Πιερίας-Λεπτοκαρυά',
        'customercare@aegeanmotorway.gr',
        'ΜΤ',
        2.00,
        2.80,
        8.60,
        12.00,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM08',
        'Σταθμός Διοδίων Λεπτοκαρυάς Μετωπικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        40.03565,
        22.56999,
        'Πιερίας-Λεπτοκαρυά',
        'customercare@aegeanmotorway.gr',
        'ΜΤ',
        2.00,
        2.80,
        8.60,
        12.00,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM09',
        'Σταθμός Διοδίων Πελασγίας Μετωπικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.92051,
        22.84637,
        'Φθιώτιδος-Πελασγία',
        'customercare@aegeanmotorway.gr',
        'ΜΤ',
        2.20,
        3.10,
        9.40,
        13.10,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM10',
        'Σταθμός Διοδίων Πελασγίας Μετωπικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.92015,
        22.84633,
        'Φθιώτιδος-Πελασγία',
        'customercare@aegeanmotorway.gr',
        'ΜΤ',
        2.20,
        3.10,
        9.40,
        13.10,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM11',
        'Σταθμός Διοδίων Γυρτώνης Πλευρικά (Από Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.74348,
        22.47595,
        'Λάρισας-Γυρτώνη',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        0.40,
        0.60,
        1.90,
        2.70,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM12',
        'Σταθμός Διοδίων Γυρτώνης Πλευρικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.74499,
        22.47529,
        'Λάρισας-Γυρτώνη',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        0.40,
        0.60,
        1.90,
        2.70,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM13',
        'Σταθμός Διοδίων Ευαγγελισμού Πλευρικά (Από Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.82932,
        22.51144,
        'Λάρισας-Ευαγγελισμός',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        0.70,
        1.10,
        3.20,
        4.50,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM14',
        'Σταθμός Διοδίων Ευαγγελισμού Πλευρικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.82932,
        22.51359,
        'Λάρισας-Ευαγγελισμός',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        0.70,
        1.10,
        3.20,
        4.50,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM15',
        'Σταθμός Διοδίων Κιλελέρ Πλευρικά (Από Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.49450,
        22.62619,
        'Λάρισας-Κιλελέρ',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        1.50,
        2.10,
        6.40,
        9.00,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM16',
        'Σταθμός Διοδίων Κιλελέρ Πλευρικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.49332,
        22.61891,
        'Λάρισας-Κιλελέρ',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        1.50,
        2.10,
        6.40,
        9.00,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM17',
        'Σταθμός Διοδίων Μακρυχωρίου Πλευρικά (Από Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.79680,
        22.49904,
        'Λάρισας-Μακρυχώρι',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        0.70,
        1.00,
        3.00,
        4.20,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM18',
        'Σταθμός Διοδίων Μεγάλου Μοναστηρίου Πλευρικά (Από Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.44227,
        22.68931,
        'Λάρισας-Μεγάλο Μοναστήρι',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        1.20,
        1.70,
        5.00,
        7.00,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM19',
        'Σταθμός Διοδίων Μεγάλου Μοναστηρίου Πλευρικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.44117,
        22.68652,
        'Λάρισας-Μεγάλο Μοναστήρι',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        1.20,
        1.70,
        5.00,
        7.00,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM20',
        'Σταθμός Διοδίων Πυργετού Πλευρικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.90926,
        22.62438,
        'Λάρισας-Πυργετός',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        1.00,
        1.50,
        4.50,
        6.30,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM21',
        'Σταθμός Διοδίων Πυργετού Πλευρικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.90894,
        22.62438,
        'Λάρισας-Πυργετός',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        1.00,
        1.50,
        4.50,
        6.30,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM22',
        'Σταθμός Διοδίων Βελεστίνου Πλευρικά (Από Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.38855,
        22.76817,
        'Μαγνησίας-Βελεστίνο',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        0.80,
        1.10,
        3.30,
        4.60,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM23',
        'Σταθμός Διοδίων Βελεστίνου Πλευρικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.38900,
        22.76446,
        'Μαγνησίας-Βελεστίνο',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        0.80,
        1.10,
        3.30,
        4.60,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM24',
        'Σταθμός Διοδίων Βελεστίνου Πλευρικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.39075,
        22.76492,
        'Μαγνησίας-Βελεστίνο',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        0.80,
        1.10,
        3.30,
        4.60,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM25',
        'Σταθμός Διοδίων Λεπτοκαρυάς Πλευρικά (Από Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        40.04498,
        22.56406,
        'Πιερίας-Λεπτοκαρυά',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        1.10,
        1.60,
        4.90,
        6.80,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM26',
        'Σταθμός Διοδίων Λεπτοκαρυάς Πλευρικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        40.04503,
        22.56537,
        'Πιερίας-Λεπτοκαρυά',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        1.10,
        1.60,
        4.90,
        6.80,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM27',
        'Σταθμός Διοδίων Πλαταμώνα Πλευρικά (Από Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.98173,
        22.62521,
        'Πιερίας-Πλαταμώνας',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        0.40,
        0.60,
        1.80,
        2.50,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM28',
        'Σταθμός Διοδίων Πλαταμώνα Πλευρικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        39.98173,
        22.62488,
        'Πιερίας-Πλαταμώνας',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        0.40,
        0.60,
        1.80,
        2.50,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM29',
        'Σταθμός Διοδίων Γλύφας Πλευρικά (Από Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.94941,
        22.87566,
        'Φθιώτιδος-Γλύφα',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        1.60,
        2.30,
        6.90,
        9.60,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'AM30',
        'Σταθμός Διοδίων Γλύφας Πλευρικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.94799,
        22.87658,
        'Φθιώτιδος-Γλύφα',
        'customercare@aegeanmotorway.gr',
        'ΠΛ',
        1.60,
        2.30,
        6.90,
        9.60,
        'AM'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG01',
        'Σταθμός Διοδίων Σήραγγας Ακτίου Μετωπικά (Προς Αγρίνιο)',
        'Ακτίου-Πρέβεζας',
        38.94008,
        20.76598,
        'Αιτωλοακαρνανίας-Άκτιο',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.70,
        3.00,
        7.50,
        10.50,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG02',
        'Σταθμός Διοδίων Σήραγγας Ακτίου Μετωπικά (Προς Πρέβεζα)',
        'Ακτίου-Πρέβεζας',
        38.94000,
        20.76634,
        'Αιτωλοακαρνανίας-Άκτιο',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.70,
        3.00,
        7.50,
        10.50,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG03',
        'Σταθμός Διοδίων Αρδανίου Μετωπικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.94466,
        26.20525,
        'Έβρου-Αρδάνι',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.80,
        1.20,
        3.00,
        4.20,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG04',
        'Σταθμός Διοδίων Αρδανίου Μετωπικά (Προς Κήπους)',
        'Εγνατία Οδός',
        40.94448,
        26.20509,
        'Έβρου-Αρδάνι',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.80,
        1.20,
        3.00,
        4.20,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG05',
        'Σταθμός Διοδίων Μεστής Μετωπικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        41.01349,
        25.53327,
        'Έβρου-Μεστή',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.20,
        1.70,
        4.30,
        6.00,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG06',
        'Σταθμός Διοδίων Μεστής Μετωπικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        41.01347,
        25.53349,
        'Έβρου-Μεστή',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.20,
        1.70,
        4.30,
        6.00,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG07',
        'Σταθμός Διοδίων Ανάληψης Μετωπικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.70685,
        23.19131,
        'Θεσσαλονίκης-Ανάληψη',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.30,
        1.80,
        4.50,
        6.30,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG08',
        'Σταθμός Διοδίων Ανάληψης Μετωπικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.70687,
        23.19166,
        'Θεσσαλονίκης-Ανάληψη',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.30,
        1.80,
        4.50,
        6.30,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG09',
        'Σταθμός Διοδίων Ασπροβάλτας Μετωπικά (Προς Αλεξανδρούπολη)',
        'Εγνατία Οδός',
        40.72626,
        23.69369,
        'Θεσσαλονίκης-Ασπροβάλτα',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.60,
        0.90,
        2.30,
        3.20,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG10',
        'Σταθμός Διοδίων Ασπροβάλτας Μετωπικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.72651,
        23.69370,
        'Θεσσαλονίκης-Ασπροβάλτα',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.60,
        0.90,
        2.30,
        3.20,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG11',
        'Σταθμός Διοδίων Θεσσαλονίκης Μετωπικά (Προς Αλεξανδρούπολη)',
        'Εγνατία Οδός',
        40.69605,
        22.89561,
        'Θεσσαλονίκης-Θεσσαλονίκη',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.30,
        0.50,
        1.00,
        1.50,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG12',
        'Σταθμός Διοδίων Θεσσαλονίκης Μετωπικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.69621,
        22.89602,
        'Θεσσαλονίκης-Θεσσαλονίκη',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.30,
        0.50,
        1.00,
        1.50,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG13',
        'Σταθμός Διοδίων Μαλγάρων Μετωπικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        40.60257,
        22.69825,
        'Θεσσαλονίκης-Μάλγαρα',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.80,
        1.20,
        3.00,
        4.20,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG14',
        'Σταθμός Διοδίων Μαλγάρων Μετωπικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        40.60222,
        22.69828,
        'Θεσσαλονίκης-Μάλγαρα',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.80,
        1.20,
        3.00,
        4.20,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG15',
        'Σταθμός Διοδίων Παμβώτιδας Μετωπικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        39.61861,
        20.94787,
        'Ιωαννίνων-Ιωάννινα',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.80,
        1.20,
        3.00,
        4.20,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG16',
        'Σταθμός Διοδίων Παμβώτιδας Μετωπικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        39.61887,
        20.94798,
        'Ιωαννίνων-Ιωάννινα',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.80,
        1.20,
        3.00,
        4.20,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG17',
        'Σταθμός Διοδίων Τύριας Μετωπικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        39.54018,
        20.67424,
        'Ιωαννίνων-Τύρια',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.50,
        2.10,
        5.30,
        7.40,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG18',
        'Σταθμός Διοδίων Τύριας Μετωπικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        39.54018,
        20.67446,
        'Ιωαννίνων-Τύρια',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.50,
        2.10,
        5.30,
        7.40,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG19',
        'Σταθμός Διοδίων Καβάλας Μετωπικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.95970,
        24.47231,
        'Καβάλας-Άσπρη Άμμος',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.00,
        1.40,
        3.50,
        4.90,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG20',
        'Σταθμός Διοδίων Καβάλας Μετωπικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.95996,
        24.47252,
        'Καβάλας-Άσπρη Άμμος',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.00,
        1.40,
        3.50,
        4.90,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG21',
        'Σταθμός Διοδίων Μουσθένης Μετωπικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.85810,
        24.16227,
        'Καβάλας-Μουσθένη',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.10,
        1.60,
        4.00,
        5.60,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG22',
        'Σταθμός Διοδίων Μουσθένης Μετωπικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.85828,
        24.16236,
        'Καβάλας-Μουσθένη',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.10,
        1.60,
        4.00,
        5.60,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG23',
        'Σταθμός Διοδίων Ιεροπηγής Μετωπικά (Προς Κρυσταλλοπηγή)',
        'Α/Δ Σιάτιστας-Κρυσταλλοπηγής',
        40.57450,
        21.06155,
        'Καστοριάς-Ιεροπηγή',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.00,
        1.40,
        3.50,
        4.90,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG24',
        'Σταθμός Διοδίων Ιεροπηγής Μετωπικά (Προς Σιάτιστα)',
        'Α/Δ Σιάτιστας-Κρυσταλλοπηγής',
        40.57463,
        21.06136,
        'Καστοριάς-Ιεροπηγή',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.00,
        1.40,
        3.50,
        4.90,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG25',
        'Σταθμός Διοδίων Ευζώνων Μετωπικά (Προς Μάλγαρα)',
        'Α/Δ ΠΑΘΕ',
        41.10873,
        22.55840,
        'Κιλκίς-Εύζωνοι',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.30,
        1.80,
        4.50,
        6.30,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG26',
        'Σταθμός Διοδίων Ευζώνων Μετωπικά (Προς Σύνορα)',
        'Α/Δ ΠΑΘΕ',
        41.10865,
        22.55872,
        'Κιλκίς-Εύζωνοι',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.30,
        1.80,
        4.50,
        6.30,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG27',
        'Σταθμός Διοδίων Πολύμυλου Μετωπικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.36719,
        22.06011,
        'Κοζάνης-Πολύμυλος',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.00,
        1.40,
        3.50,
        4.90,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG28',
        'Σταθμός Διοδίων Πολύμυλου Μετωπικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.36724,
        22.06038,
        'Κοζάνης-Πολύμυλος',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.00,
        1.40,
        3.50,
        4.90,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG29',
        'Σταθμός Διοδίων Σιάτιστας Μετωπικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.25640,
        21.63294,
        'Κοζάνης-Σιάτιστα',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.10,
        1.50,
        3.80,
        5.30,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG30',
        'Σταθμός Διοδίων Σιάτιστας Μετωπικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.25663,
        21.63296,
        'Κοζάνης-Σιάτιστα',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.10,
        1.50,
        3.80,
        5.30,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG31',
        'Σταθμός Διοδίων Ίασμου Μετωπικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        41.12035,
        25.08013,
        'Ροδόπης-Ίασμος',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.00,
        1.40,
        3.50,
        4.90,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG32',
        'Σταθμός Διοδίων Ίασμου Μετωπικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        41.12048,
        25.08019,
        'Ροδόπης-Ίασμος',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.00,
        1.40,
        3.50,
        4.90,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG33',
        'Σταθμός Διοδίων Προμαχώνα Μετωπικά (Προς Προμαχώνα)',
        'Α/Δ Σερρών-Προμαχώνα',
        41.36410,
        23.35685,
        'Σερρών-Προμαχώνας',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.40,
        2.00,
        5.00,
        7.00,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG34',
        'Σταθμός Διοδίων Προμαχώνα Μετωπικά (Προς Σέρρες)',
        'Α/Δ Σερρών-Προμαχώνα',
        41.36428,
        23.35673,
        'Σερρών-Προμαχώνας',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.40,
        2.00,
        5.00,
        7.00,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG35',
        'Σταθμός Διοδίων Στρυμονικού Μετωπικά (Προς Θεσσαλονίκη)',
        'Α/Δ Θεσσαλονίκης-Σερρών',
        41.04377,
        23.29506,
        'Σερρών-Στρυμονικό',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.70,
        1.00,
        2.50,
        3.50,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG36',
        'Σταθμός Διοδίων Στρυμονικού Μετωπικά (Προς Σέρρες)',
        'Α/Δ Θεσσαλονίκης-Σερρών',
        41.04362,
        23.29504,
        'Σερρών-Στρυμονικό',
        'eoae@egnatia.gr',
        'ΜΤ',
        0.70,
        1.00,
        2.50,
        3.50,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG37',
        'Σταθμός Διοδίων Μαλακασίου Μετωπικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        39.78944,
        21.26681,
        'Τρικάλων-Μαλακάσι',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.00,
        1.40,
        3.50,
        4.90,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG38',
        'Σταθμός Διοδίων Μαλακασίου Μετωπικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        39.78979,
        21.26626,
        'Τρικάλων-Μαλακάσι',
        'eoae@egnatia.gr',
        'ΜΤ',
        1.00,
        1.40,
        3.50,
        4.90,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG39',
        'Σταθμός Διοδίων Μεστής Πλευρικά (Από Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.96176,
        25.64339,
        'Έβρου-Μεστή',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.60,
        0.80,
        2.00,
        2.80,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG40',
        'Σταθμός Διοδίων Μεστής Πλευρικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.96122,
        25.64278,
        'Έβρου-Μεστή',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.60,
        0.80,
        2.00,
        2.80,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG41',
        'Σταθμός Διοδίων Βαϊοχωρίου Πλευρικά (Από Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.70133,
        23.37106,
        'Θεσσαλονίκης-Βαϊοχώρι',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.40,
        0.60,
        1.50,
        2.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG42',
        'Σταθμός Διοδίων Βαϊοχωρίου Πλευρικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.70003,
        23.37042,
        'Θεσσαλονίκης-Βαϊοχώρι',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.40,
        0.60,
        1.50,
        2.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG43',
        'Σταθμός Διοδίων Λαγκαδά Πλευρικά (Είσοδος Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.74036,
        23.01134,
        'Θεσσαλονίκης-Λαγυνά',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG44',
        'Σταθμός Διοδίων Λαγκαδά Πλευρικά (Είσοδος Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.74041,
        23.00921,
        'Θεσσαλονίκης-Λαγυνά',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG45',
        'Σταθμός Διοδίων Λαγκαδά Πλευρικά (Έξοδος Από Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.73708,
        23.00886,
        'Θεσσαλονίκης-Λαγυνά',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG46',
        'Σταθμός Διοδίων Ασπροβάλτας Πλευρικά (Από Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.70963,
        23.68233,
        'Θεσσαλονίκης-Νέα Βρασνά',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG47',
        'Σταθμός Διοδίων Ασπροβάλτας Πλευρικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.70969,
        23.68007,
        'Θεσσαλονίκης-Νέα Βρασνά',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG48',
        'Σταθμός Διοδίων Προφήτη Πλευρικά (Από Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.68507,
        23.25728,
        'Θεσσαλονίκης-Προφήτης',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.60,
        0.90,
        2.30,
        3.20,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG49',
        'Σταθμός Διοδίων Προφήτη Πλευρικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.68298,
        23.26014,
        'Θεσσαλονίκης-Προφήτης',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.60,
        0.90,
        2.30,
        3.20,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG50',
        'Σταθμός Διοδίων Αγίου Ανδρέα Πλευρικά (Από Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.87301,
        24.29632,
        'Καβάλας-Άγιος Ανδρέας',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.30,
        0.40,
        1.00,
        1.40,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG51',
        'Σταθμός Διοδίων Αγίου Ανδρέα Πλευρικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.87425,
        24.29886,
        'Καβάλας-Άγιος Ανδρέας',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.30,
        0.40,
        1.00,
        1.40,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG52',
        'Σταθμός Διοδίων Άσπρων Χωμάτων Πλευρικά (Από Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.95475,
        24.46490,
        'Καβάλας-Άσπρη Άμμος',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG53',
        'Σταθμός Διοδίων Άσπρων Χωμάτων Πλευρικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.95614,
        24.46335,
        'Καβάλας-Άσπρη Άμμος',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG54',
        'Σταθμός Διοδίων Ελευθερούπολης Πλευρικά (Από Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.88656,
        24.23466,
        'Καβάλας-Εξοχή',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.50,
        0.60,
        1.50,
        2.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG55',
        'Σταθμός Διοδίων Ελευθερούπολης Πλευρικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.88405,
        24.23595,
        'Καβάλας-Εξοχή',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.50,
        0.60,
        1.50,
        2.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG56',
        'Σταθμός Διοδίων Μουσθένης Πλευρικά (Από Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.83828,
        24.11487,
        'Καβάλας-Μουσθένη',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.60,
        0.80,
        2.00,
        2.80,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG57',
        'Σταθμός Διοδίων Μουσθένης Πλευρικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.84142,
        24.11660,
        'Καβάλας-Μουσθένη',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.60,
        0.80,
        2.00,
        2.80,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG58',
        'Σταθμός Διοδίων Γαληψού Ορφανίου Πλευρικά (Από Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.78273,
        23.95742,
        'Καβάλας-Ορφάνιο',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG59',
        'Σταθμός Διοδίων Γαληψού Ορφανίου Πλευρικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.78738,
        23.95591,
        'Καβάλας-Ορφάνιο',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG60',
        'Σταθμός Διοδίων Πολυκάστρου Πλευρικά (Από Πολύκαστρο)',
        'Α/Δ ΠΑΘΕ',
        40.98913,
        22.60377,
        'Κιλκίς-Πολύκαστρο',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.90,
        1.30,
        3.30,
        4.60,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG61',
        'Σταθμός Διοδίων Πολυκάστρου Πλευρικά (Προς Πολύκαστρο)',
        'Α/Δ ΠΑΘΕ',
        40.98902,
        22.60492,
        'Κιλκίς-Πολύκαστρο',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.90,
        1.30,
        3.30,
        4.60,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG62',
        'Σταθμός Διοδίων Καλαμιάς Πλευρικά (Από Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.29780,
        21.68065,
        'Κοζάνης-Καλαμιά',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.30,
        0.40,
        1.00,
        1.40,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG63',
        'Σταθμός Διοδίων Καλαμιάς Πλευρικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        40.30186,
        21.69036,
        'Κοζάνης-Καλαμιά',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.30,
        0.40,
        1.00,
        1.40,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG64',
        'Σταθμός Διοδίων Σιάτιστας Ανατολικά Πλευρικά (Από Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.23622,
        21.57988,
        'Κοζάνης-Σιάτιστα',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.50,
        0.70,
        1.80,
        2.50,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG65',
        'Σταθμός Διοδίων Σιάτιστας Ανατολικά Πλευρικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        40.23697,
        21.57984,
        'Κοζάνης-Σιάτιστα',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.50,
        0.70,
        1.80,
        2.50,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG66',
        'Σταθμός Διοδίων Βαφέικων Πλευρικά (Από Ηγουμενίτσα Προς Ξάνθη)',
        'Εγνατία Οδός',
        41.09622,
        24.94660,
        'Ξάνθης-Βαφέικα',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG67',
        'Σταθμός Διοδίων Βαφέικων Πλευρικά (Από Ηγουμενίτσα Προς Πόρτο Λάγος)',
        'Εγνατία Οδός',
        41.09518,
        24.94467,
        'Ξάνθης-Βαφέικα',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG68',
        'Σταθμός Διοδίων Βαφέικων Πλευρικά (Από Ξάνθη Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        41.09463,
        24.93714,
        'Ξάνθης-Βαφέικα',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG69',
        'Σταθμός Διοδίων Βαφέικων Πλευρικά (Από Πόρτο Λάγος Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        41.09820,
        24.94494,
        'Ξάνθης-Βαφέικα',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG70',
        'Σταθμός Διοδίων Ίασμου Πλευρικά (Από Αλεξ/πολη)',
        'Εγνατία Οδός',
        41.11714,
        25.18443,
        'Ροδόπης-Ίασμος',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.40,
        0.50,
        1.30,
        1.80,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG71',
        'Σταθμός Διοδίων Ίασμου Πλευρικά (Προς Αλεξ/πολη)',
        'Εγνατία Οδός',
        41.11562,
        25.18446,
        'Ροδόπης-Ίασμος',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.40,
        0.50,
        1.30,
        1.80,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG72',
        'Σταθμός Διοδίων ΒΙ.ΠΕ. Κομοτηνής Πλευρικά (Από Ηγουμενίτσα)',
        'Εγνατία Οδός',
        41.05960,
        25.47539,
        'Ροδόπης-Φύλακας',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG73',
        'Σταθμός Διοδίων ΒΙ.ΠΕ. Κομοτηνής Πλευρικά (Προς Ηγουμενίτσα)',
        'Εγνατία Οδός',
        41.06149,
        25.47661,
        'Ροδόπης-Φύλακας',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.20,
        0.30,
        0.80,
        1.10,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'EG74',
        'Σταθμός Διοδίων Παναγιάς Πλευρικά',
        'Εγνατία Οδός',
        39.78578,
        21.29482,
        'Τρικάλων-Μαλακάσι',
        'eoae@egnatia.gr',
        'ΠΛ',
        0.70,
        1.00,
        2.50,
        3.50,
        'EG'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'GE01',
        'Σταθμός Διοδίων Γέφυρας Ρίου Αντιρρίου Μετωπικά (Προς Αντίρριο)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.33383,
        21.76604,
        'Αιτωλοακαρνανίας-Αντίρριο',
        'info@gefyra.gr',
        'ΜΤ',
        2.00,
        14.70,
        46.50,
        74.50,
        'GE'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'GE02',
        'Σταθμός Διοδίων Γέφυρας Ρίου Αντιρρίου Μετωπικά (Προς Ρίο)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.33381,
        21.76581,
        'Αιτωλοακαρνανίας-Αντίρριο',
        'info@gefyra.gr',
        'ΜΤ',
        2.00,
        14.70,
        46.50,
        74.50,
        'GE'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO01',
        'Σταθμός Διοδίων Σοφάδων Μετωπικά (Προς Λαμία)',
        'Α/Δ Λαμίας-Τρικάλων',
        39.25717,
        22.08299,
        'Καρδίτσας-Μαυραχάδες',
        'customercare@kentrikiodos.gr',
        'ΜΤ',
        2.35,
        3.40,
        8.50,
        11.95,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO02',
        'Σταθμός Διοδίων Σοφάδων Μετωπικά (Προς Τρίκαλα)',
        'Α/Δ Λαμίας-Τρικάλων',
        39.25691,
        22.08320,
        'Καρδίτσας-Μαυραχάδες',
        'customercare@kentrikiodos.gr',
        'ΜΤ',
        2.35,
        3.40,
        8.50,
        11.95,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO03',
        'Σταθμός Διοδίων Τρικάλων Μετωπικά (Προς Λαμία)',
        'Α/Δ Λαμίας-Τρικάλων',
        39.52040,
        21.83212,
        'Τρικάλων-Λόγγος',
        'customercare@kentrikiodos.gr',
        'ΜΤ',
        2.05,
        2.95,
        7.45,
        10.45,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO04',
        'Σταθμός Διοδίων Τρικάλων Μετωπικά (Προς Τρίκαλα)',
        'Α/Δ Λαμίας-Τρικάλων',
        39.52022,
        21.83249,
        'Τρικάλων-Λόγγος',
        'customercare@kentrikiodos.gr',
        'ΜΤ',
        2.05,
        2.95,
        7.45,
        10.45,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO05',
        'Σταθμός Διοδίων Αγίας Τριάδας Μετωπικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.80835,
        22.60256,
        'Φθιώτιδος-Αγία Τριάδα',
        'customercare@kentrikiodos.gr',
        'ΜΤ',
        1.35,
        1.90,
        4.80,
        6.75,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO06',
        'Σταθμός Διοδίων Αγίας Τριάδας Μετωπικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.80869,
        22.60270,
        'Φθιώτιδος-Αγία Τριάδα',
        'customercare@kentrikiodos.gr',
        'ΜΤ',
        1.35,
        1.90,
        4.80,
        6.75,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO07',
        'Σταθμός Διοδίων Λειανοκλαδίου Μετωπικά (Προς Λαμία)',
        'Κεντρική Οδός',
        38.91517,
        22.34873,
        'Φθιώτιδος-Σταυρός',
        'customercare@kentrikiodos.gr',
        'ΜΤ',
        1.30,
        1.85,
        4.70,
        6.60,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO08',
        'Σταθμός Διοδίων Λειανοκλαδίου Μετωπικά (Προς Τρίκαλα)',
        'Κεντρική Οδός',
        38.91495,
        22.34906,
        'Φθιώτιδος-Σταυρός',
        'customercare@kentrikiodos.gr',
        'ΜΤ',
        1.30,
        1.85,
        4.70,
        6.60,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO09',
        'Σταθμός Διοδίων Μαυρομαντήλας Μετωπικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.90419,
        22.52794,
        'Φθιώτιδος-Στυλίδα',
        'customercare@kentrikiodos.gr',
        'ΜΤ',
        1.45,
        2.05,
        5.15,
        7.25,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO10',
        'Σταθμός Διοδίων Μαυρομαντήλας Μετωπικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.90403,
        22.52754,
        'Φθιώτιδος-Στυλίδα',
        'customercare@kentrikiodos.gr',
        'ΜΤ',
        1.45,
        2.05,
        5.15,
        7.25,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO11',
        'Σταθμός Διοδίων Ανάβρας Πλευρικά (Από Λαμία)',
        'Α/Δ Λαμίας-Τρικάλων',
        39.21048,
        22.06925,
        'Καρδίτσας-Ανάβρα',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        1.40,
        2.00,
        5.00,
        7.00,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO12',
        'Σταθμός Διοδίων Ανάβρας Πλευρικά (Προς Λαμία)',
        'Α/Δ Λαμίας-Τρικάλων',
        39.21025,
        22.06905,
        'Καρδίτσας-Ανάβρα',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        1.40,
        2.00,
        5.00,
        7.00,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO13',
        'Σταθμός Διοδίων Προαστίου Πλευρικά (Από Λαμία)',
        'Α/Δ Λαμίας-Τρικάλων',
        39.47480,
        21.90310,
        'Καρδίτσας-Προάστιο',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.80,
        1.15,
        2.85,
        4.05,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO14',
        'Σταθμός Διοδίων Προαστίου Πλευρικά (Προς Λαμία)',
        'Α/Δ Λαμίας-Τρικάλων',
        39.47460,
        21.90324,
        'Καρδίτσας-Προάστιο',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.80,
        1.15,
        2.85,
        4.05,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO15',
        'Σταθμός Διοδίων Καλαμπάκας Πλευρικά (Από Καλαμπάκα)',
        'Κεντρική Οδός',
        39.70028,
        21.60858,
        'Τρικάλων-Καλαμπάκα',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.60,
        0.90,
        2.25,
        3.15,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO16',
        'Σταθμός Διοδίων Καλαμπάκας Πλευρικά (Προς Καλαμπάκα)',
        'Κεντρική Οδός',
        39.69975,
        21.61080,
        'Τρικάλων-Καλαμπάκα',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.60,
        0.90,
        2.25,
        3.15,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO17',
        'Σταθμός Διοδίων Τρικάλων Πλευρικά (Από Τρίκαλα)',
        'Κεντρική Οδός',
        39.56901,
        21.81829,
        'Τρικάλων-Τρίκαλα',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.55,
        0.80,
        2.05,
        2.90,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO18',
        'Σταθμός Διοδίων Τρικάλων Πλευρικά (Προς Τρίκαλα)',
        'Κεντρική Οδός',
        39.56879,
        21.81811,
        'Τρικάλων-Τρίκαλα',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.55,
        0.80,
        2.05,
        2.90,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO19',
        'Σταθμός Διοδίων Αγίας Μαρίνας Πλευρικά (Από Θεσ/νίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.90377,
        22.57063,
        'Φθιώτιδος-Αγία Μαρίνα',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.90,
        1.30,
        3.30,
        4.60,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO20',
        'Σταθμός Διοδίων Αγίας Μαρίνας Πλευρικά (Προς Θεσ/νίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.90305,
        22.56907,
        'Φθιώτιδος-Αγία Μαρίνα',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.90,
        1.30,
        3.30,
        4.60,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO21',
        'Σταθμός Διοδίων Θερμοπυλών Πλευρικά (Από Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.79929,
        22.50926,
        'Φθιώτιδος-Θερμοπύλες',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.45,
        0.65,
        1.65,
        2.35,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO22',
        'Σταθμός Διοδίων Θερμοπυλών Πλευρικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.79959,
        22.51118,
        'Φθιώτιδος-Θερμοπύλες',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.45,
        0.65,
        1.65,
        2.35,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO23',
        'Σταθμός Διοδίων Μώλου Πλευρικά (Από Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.80267,
        22.64938,
        'Φθιώτιδος-Μώλος',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.25,
        0.35,
        0.90,
        1.30,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO24',
        'Σταθμός Διοδίων Μώλου Πλευρικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.80290,
        22.64952,
        'Φθιώτιδος-Μώλος',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.25,
        0.35,
        0.90,
        1.30,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO25',
        'Σταθμός Διοδίων Στυλίδας Πλευρικά (Από Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.91363,
        22.65900,
        'Φθιώτιδος-Στυλίδα',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.50,
        0.70,
        1.75,
        2.50,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'KO26',
        'Σταθμός Διοδίων Στυλίδας Πλευρικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.91357,
        22.65774,
        'Φθιώτιδος-Στυλίδα',
        'customercare@kentrikiodos.gr',
        'ΠΛ',
        0.50,
        0.70,
        1.75,
        2.50,
        'KO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO01',
        'Σταθμός Διοδίων Βελιγοστής Μετωπικά (Προς Καλαμάτα)',
        'Α/Δ Μορέας',
        37.34516,
        22.11037,
        'Αρκαδίας-Βελιγοστή',
        'info@moreas.com.gr',
        'ΜΤ',
        0.90,
        1.35,
        3.40,
        4.80,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO02',
        'Σταθμός Διοδίων Βελιγοστής Μετωπικά (Προς Κόρινθο)',
        'Α/Δ Μορέας',
        37.34483,
        22.11030,
        'Αρκαδίας-Βελιγοστή',
        'info@moreas.com.gr',
        'ΜΤ',
        0.90,
        1.35,
        3.40,
        4.80,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO03',
        'Σταθμός Διοδίων Γέφυρας Μάναρη Μετωπικά (Προς Καλαμάτα)',
        'Α/Δ Μορέας',
        37.41249,
        22.30764,
        'Αρκαδίας-Μάναρης',
        'info@moreas.com.gr',
        'ΜΤ',
        1.40,
        2.10,
        5.25,
        7.40,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO04',
        'Σταθμός Διοδίων Γέφυρας Μάναρη Μετωπικά (Προς Κόρινθο)',
        'Α/Δ Μορέας',
        37.41220,
        22.30776,
        'Αρκαδίας-Μάναρης',
        'info@moreas.com.gr',
        'ΜΤ',
        1.40,
        2.10,
        5.25,
        7.40,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO05',
        'Σταθμός Διοδίων Νεστάνης Μετωπικά (Προς Καλαμάτα)',
        'Α/Δ Μορέας',
        37.60085,
        22.44646,
        'Αρκαδίας-Νεστάνη',
        'info@moreas.com.gr',
        'ΜΤ',
        1.80,
        2.60,
        6.50,
        9.10,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO06',
        'Σταθμός Διοδίων Νεστάνης Μετωπικά (Προς Κόρινθο)',
        'Α/Δ Μορέας',
        37.60057,
        22.44655,
        'Αρκαδίας-Νεστάνη',
        'info@moreas.com.gr',
        'ΜΤ',
        1.80,
        2.60,
        6.50,
        9.10,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO07',
        'Σταθμός Διοδίων Πετρίνας Μετωπικά (Προς Κόρινθο-Καλαμάτα)',
        'Α/Δ Μορέας',
        37.29864,
        22.21032,
        'Αρκαδίας-Πετρίνα',
        'info@moreas.com.gr',
        'ΜΤ',
        2.20,
        3.15,
        7.90,
        11.10,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO08',
        'Σταθμός Διοδίων Πετρίνας Μετωπικά (Προς Σπάρτη)',
        'Α/Δ Μορέας',
        37.29884,
        22.21009,
        'Αρκαδίας-Πετρίνα',
        'info@moreas.com.gr',
        'ΜΤ',
        2.20,
        3.15,
        7.90,
        11.10,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO09',
        'Σταθμός Διοδίων Σπαθοβουνίου Μετωπικά (Προς Καλαμάτα)',
        'Α/Δ Μορέας',
        37.83599,
        22.80797,
        'Κορινθίας-Σπαθοβούνι',
        'info@moreas.com.gr',
        'ΜΤ',
        1.90,
        2.70,
        6.85,
        9.60,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO10',
        'Σταθμός Διοδίων Σπαθοβουνίου Μετωπικά (Προς Κόρινθο)',
        'Α/Δ Μορέας',
        37.83565,
        22.80808,
        'Κορινθίας-Σπαθοβούνι',
        'info@moreas.com.gr',
        'ΜΤ',
        1.90,
        2.70,
        6.85,
        9.60,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO11',
        'Σταθμός Διοδίων Καλαμάτας Μετωπικά (Προς Καλαμάτα)',
        'Α/Δ Μορέας',
        37.13694,
        22.03779,
        'Μεσσηνίας-Καλαμάτα',
        'info@moreas.com.gr',
        'ΜΤ',
        1.40,
        2.05,
        5.15,
        7.25,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO12',
        'Σταθμός Διοδίων Καλαμάτας Μετωπικά (Προς Κόρινθο)',
        'Α/Δ Μορέας',
        37.13675,
        22.03810,
        'Μεσσηνίας-Καλαμάτα',
        'info@moreas.com.gr',
        'ΜΤ',
        1.40,
        2.05,
        5.15,
        7.25,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO13',
        'Σταθμός Διοδίων Αρφαρών Πλευρικά (Από Κόρινθο)',
        'Α/Δ Μορέας',
        37.15246,
        22.02610,
        'Μεσσηνίας-Αρφαρά',
        'info@moreas.com.gr',
        'ΠΛ',
        0.50,
        0.80,
        2.05,
        2.85,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO14',
        'Σταθμός Διοδίων Αρφαρών Πλευρικά (Προς Κόρινθο)',
        'Α/Δ Μορέας',
        37.15349,
        22.02565,
        'Μεσσηνίας-Αρφαρά',
        'info@moreas.com.gr',
        'ΠΛ',
        0.50,
        0.80,
        2.05,
        2.85,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO15',
        'Σταθμός Διοδίων Θουρίας Πλευρικά (Από Καλαμάτα)',
        'Α/Δ Μορέας',
        37.07192,
        22.04808,
        'Μεσσηνίας-Θουρία',
        'info@moreas.com.gr',
        'ΠΛ',
        0.30,
        0.50,
        1.30,
        1.85,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO16',
        'Σταθμός Διοδίων Θουρίας Πλευρικά (Προς Καλαμάτα)',
        'Α/Δ Μορέας',
        37.07162,
        22.04731,
        'Μεσσηνίας-Θουρία',
        'info@moreas.com.gr',
        'ΠΛ',
        0.30,
        0.50,
        1.30,
        1.85,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO17',
        'Σταθμός Διοδίων Παραδείσιων Πλευρικά (Από Καλαμάτα)',
        'Α/Δ Μορέας',
        37.33067,
        22.07845,
        'Μεσσηνίας-Παραδείσια',
        'info@moreas.com.gr',
        'ΠΛ',
        0.50,
        0.80,
        2.05,
        2.90,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'MO18',
        'Σταθμός Διοδίων Παραδείσιων Πλευρικά (Προς Καλαμάτα)',
        'Α/Δ Μορέας',
        37.33179,
        22.07778,
        'Μεσσηνίας-Παραδείσια',
        'info@moreas.com.gr',
        'ΠΛ',
        0.50,
        0.80,
        2.05,
        2.90,
        'MO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO01',
        'Σταθμός Διοδίων Αγίας Παρασκευής Πλευρικά (Προς Καρέα)',
        'Περιφ. Υμηττού',
        38.00812,
        23.83668,
        'Αττικής-Αγία Παρασκευή',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO02',
        'Σταθμός Διοδίων Αγίας Παρασκευής Πλευρικά (Προς Παλλήνη)',
        'Περιφ. Υμηττού',
        38.00910,
        23.84211,
        'Αττικής-Αγία Παρασκευή',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO03',
        'Σταθμός Διοδίων Δημόκριτου Πλευρικά (Προς Παλλήνη)',
        'Περιφ. Υμηττού',
        37.99958,
        23.82120,
        'Αττικής-Αγία Παρασκευή',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO04',
        'Σταθμός Διοδίων Ανθούσας Πλευρικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        38.01688,
        23.86606,
        'Αττικής-Ανθούσα',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO05',
        'Σταθμός Διοδίων Περιφεριακής Αιγάλεω Πλευρικά (Προς Αεροδρόμιο)',
        'Αττική Οδός',
        38.07565,
        23.67635,
        'Αττικής-Άνω Λιόσια',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO06',
        'Σταθμός Διοδίων Περιφεριακής Αιγάλεω Πλευρικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        38.08009,
        23.67856,
        'Αττικής-Άνω Λιόσια',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO07',
        'Σταθμός Διοδίων Ασπροπύργου Πλευρικά (Προς Αεροδρόμιο)',
        'Αττική Οδός',
        38.08919,
        23.62220,
        'Αττικής-Ασπρόπυργος',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO08',
        'Σταθμός Διοδίων Ασπροπύργου Πλευρικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        38.09040,
        23.61994,
        'Αττικής-Ασπρόπυργος',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO09',
        'Σταθμός Διοδίων Λεωφ. Δουκίσσης Πλακεντίας Πλευρικά (Προς Αεροδρόμιο)',
        'Αττική Οδός',
        38.02401,
        23.83473,
        'Αττικής-Βριλήσσια',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO10',
        'Σταθμός Διοδίων Λεωφ. Δουκίσσης Πλακεντίας Πλευρικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        38.02517,
        23.83393,
        'Αττικής-Βριλήσσια',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO11',
        'Σταθμός Διοδίων Λεωφ. Δουκίσσης Πλακεντίας Πλευρικά (Προς Καρέα)',
        'Περιφ. Υμηττού',
        38.01935,
        23.83767,
        'Αττικής-Βριλήσσια',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO12',
        'Σταθμός Διοδίων Λεωφ. Πεντέλης Πλευρικά (Προς Αεροδρόμιο)',
        'Αττική Οδός',
        38.02703,
        23.82915,
        'Αττικής-Βριλήσσια',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO13',
        'Σταθμός Διοδίων Λεωφ. Πεντέλης Πλευρικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        38.03427,
        23.82164,
        'Αττικής-Βριλήσσια',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO14',
        'Σταθμός Διοδίων Γλυκών Νερών Πλευρικά (Προς Καρέα)',
        'Περιφ. Υμηττού',
        37.99753,
        23.84944,
        'Αττικής-Γλυκά Νερά',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO15',
        'Σταθμός Διοδίων Γλυκών Νερών Πλευρικά (Προς Παλλήνη)',
        'Περιφ. Υμηττού',
        37.99710,
        23.85116,
        'Αττικής-Γλυκά Νερά',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO16',
        'Σταθμός Διοδίων Λεωφ. Δημοκρατίας Πλευρικά (Προς Αεροδρόμιο)',
        'Αττική Οδός',
        38.06607,
        23.73427,
        'Αττικής-Ζεφύρι',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO17',
        'Σταθμός Διοδίων Λεωφ. Δημοκρατίας Πλευρικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        38.06741,
        23.73161,
        'Αττικής-Ζεφύρι',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO18',
        'Σταθμός Διοδίων Λεωφ. Ηρακλείου Πλευρικά (Προς Αεροδρόμιο)',
        'Αττική Οδός',
        38.05641,
        23.77234,
        'Αττικής-Ηράκλειο',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO19',
        'Σταθμός Διοδίων Λεωφ. Ηρακλείου Πλευρικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        38.05859,
        23.76884,
        'Αττικής-Ηράκλειο',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO20',
        'Σταθμός Διοδίων Λεωφ. Κύμης Πλευρικά (Προς Αεροδρόμιο)',
        'Αττική Οδός',
        38.04838,
        23.78561,
        'Αττικής-Ηράκλειο',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO21',
        'Σταθμός Διοδίων Λεωφ. Κύμης Πλευρικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        38.05237,
        23.78147,
        'Αττικής-Ηράκλειο',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO22',
        'Σταθμός Διοδίων Λεωφ. Φυλής Πλευρικά (Προς Αεροδρόμιο)',
        'Αττική Οδός',
        38.07018,
        23.71147,
        'Αττικής-Καματερό',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO23',
        'Σταθμός Διοδίων Λεωφ. Φυλής Πλευρικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        38.07138,
        23.70832,
        'Αττικής-Καματερό',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO24',
        'Σταθμός Διοδίων Κορωπίου Μετωπικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        37.93851,
        23.88683,
        'Αττικής-Κορωπί',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO25',
        'Σταθμός Διοδίων Λεωφ. Κηφισίας Πλευρικά (Προς Αεροδρόμιο)',
        'Αττική Οδός',
        38.04123,
        23.80530,
        'Αττικής-Μαρούσι',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO26',
        'Σταθμός Διοδίων Λεωφ. Κηφισίας Πλευρικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        38.04366,
        23.79931,
        'Αττικής-Μαρούσι',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO27',
        'Σταθμός Διοδίων Αθηνών-Λαμίας Πλευρικά (Από Αθήνα Προς Αεροδρόμιο)',
        'Αττική Οδός',
        38.06086,
        23.75050,
        'Αττικής-Μεταμόρφωση',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO28',
        'Σταθμός Διοδίων Αθηνών-Λαμίας Πλευρικά (Από Αθήνα Προς Ελευσίνα)',
        'Αττική Οδός',
        38.06285,
        23.74866,
        'Αττικής-Μεταμόρφωση',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO29',
        'Σταθμός Διοδίων Αθηνών-Λαμίας Πλευρικά (Από Λαμία Προς Αεροδρόμιο)',
        'Αττική Οδός',
        38.06120,
        23.75044,
        'Αττικής-Μεταμόρφωση',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO30',
        'Σταθμός Διοδίων Αθηνών-Λαμίας Πλευρικά (Από Λαμία Προς Ελευσίνα)',
        'Αττική Οδός',
        38.06315,
        23.74873,
        'Αττικής-Μεταμόρφωση',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO31',
        'Σταθμός Διοδίων Παιανίας Πλευρικά (Προς Αεροδρόμιο)',
        'Αττική Οδός',
        37.95341,
        23.88573,
        'Αττικής-Παιανία',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO32',
        'Σταθμός Διοδίων Παιανίας Πλευρικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        37.95731,
        23.88672,
        'Αττικής-Παιανία',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO33',
        'Σταθμός Διοδίων Λεωφ. Μαραθώνος Πλευρικά (Προς Αεροδρόμιο)',
        'Αττική Οδός',
        38.00431,
        23.86971,
        'Αττικής-Παλλήνη',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO34',
        'Σταθμός Διοδίων Λεωφ. Μαραθώνος Πλευρικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        38.00805,
        23.86918,
        'Αττικής-Παλλήνη',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO35',
        'Σταθμός Διοδίων Παλλήνης Πλευρικά (Προς Καρέα)',
        'Περιφ. Υμηττού',
        37.99397,
        23.88736,
        'Αττικής-Παλλήνη',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO36',
        'Σταθμός Διοδίων Κατεχάκη Μετωπικά (Προς Παλλήνη)',
        'Περιφ. Υμηττού',
        37.97720,
        23.80010,
        'Αττικής-Παπάγος',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO37',
        'Σταθμός Διοδίων Παπάγου Πλευρικά (Προς Καρέα)',
        'Περιφ. Υμηττού',
        37.98565,
        23.80999,
        'Αττικής-Παπάγος',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO38',
        'Σταθμός Διοδίων Παπάγου Πλευρικά (Προς Παλλήνη)',
        'Περιφ. Υμηττού',
        37.98559,
        23.81250,
        'Αττικής-Παπάγος',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO39',
        'Σταθμός Διοδίων Ρουπακίου Μετωπικά (Προς Αεροδρόμιο)',
        'Αττική Οδός',
        38.09389,
        23.59099,
        'Αττικής-Ρουπάκι',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO40',
        'Σταθμός Διοδίων Κάντζας Πλευρικά (Προς Αεροδρόμιο)',
        'Αττική Οδός',
        37.98003,
        23.86990,
        'Αττικής-Σπάτα-Κάντζα',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NAO41',
        'Σταθμός Διοδίων Κάντζας Πλευρικά (Προς Ελευσίνα)',
        'Αττική Οδός',
        37.98229,
        23.87047,
        'Αττικής-Σπάτα-Κάντζα',
        'customercare@attikesdiadromes.gr',
        'ΜΤ',
        1.25,
        2.50,
        6.25,
        10.00,
        'NAO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO01',
        'Σταθμός Διοδίων Αγγελόκαστρου Μετωπικά (Προς Ιωάννινα)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.54935,
        21.27241,
        'Αιτωλοακαρνανίας-Αγγελόκαστρο',
        'info@neaodos.gr',
        'ΜΤ',
        2.70,
        3.85,
        9.60,
        13.50,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO02',
        'Σταθμός Διοδίων Αγγελόκαστρου Μετωπικά (Προς Ρίο)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.54947,
        21.27210,
        'Αιτωλοακαρνανίας-Αγγελόκαστρο',
        'info@neaodos.gr',
        'ΜΤ',
        2.70,
        3.85,
        9.60,
        13.50,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO03',
        'Σταθμός Διοδίων Κλόκοβας Μετωπικά (Προς Ιωάννινα)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.35929,
        21.65685,
        'Αιτωλοακαρνανίας-Γαβρολίμνη',
        'info@neaodos.gr',
        'ΜΤ',
        2.25,
        3.25,
        8.20,
        11.45,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO04',
        'Σταθμός Διοδίων Κλόκοβας Μετωπικά (Προς Ρίο)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.35921,
        21.65640,
        'Αιτωλοακαρνανίας-Γαβρολίμνη',
        'info@neaodos.gr',
        'ΜΤ',
        2.25,
        3.25,
        8.20,
        11.45,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO05',
        'Σταθμός Διοδίων Μενιδίου Μετωπικά (Προς Ιωάννινα)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.98982,
        21.17102,
        'Αιτωλοακαρνανίας-Μενίδι',
        'info@neaodos.gr',
        'ΜΤ',
        2.30,
        3.25,
        8.20,
        11.50,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO06',
        'Σταθμός Διοδίων Μενιδίου Μετωπικά (Προς Ρίο)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.98999,
        21.17073,
        'Αιτωλοακαρνανίας-Μενίδι',
        'info@neaodos.gr',
        'ΜΤ',
        2.30,
        3.25,
        8.20,
        11.50,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO07',
        'Σταθμός Διοδίων Αφιδνών Μετωπικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.17650,
        23.85388,
        'Αττικής-Αφίδνες',
        'info@neaodos.gr',
        'ΜΤ',
        2.50,
        3.55,
        8.95,
        12.55,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO08',
        'Σταθμός Διοδίων Αφιδνών Μετωπικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.17634,
        23.85444,
        'Αττικής-Αφίδνες',
        'info@neaodos.gr',
        'ΜΤ',
        2.50,
        3.55,
        8.95,
        12.55,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO09',
        'Σταθμός Διοδίων Θήβας Μετωπικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.37082,
        23.28677,
        'Βοιωτίας-Θήβα',
        'info@neaodos.gr',
        'ΜΤ',
        2.90,
        4.20,
        10.50,
        14.70,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO10',
        'Σταθμός Διοδίων Θήβας Μετωπικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.37090,
        23.28704,
        'Βοιωτίας-Θήβα',
        'info@neaodos.gr',
        'ΜΤ',
        2.90,
        4.20,
        10.50,
        14.70,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO11',
        'Σταθμός Διοδίων Τερόβου Μετωπικά (Προς Ιωάννινα)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        39.42539,
        20.90533,
        'Ιωαννίνων-Τέροβο',
        'info@neaodos.gr',
        'ΜΤ',
        2.35,
        3.35,
        8.45,
        11.85,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO12',
        'Σταθμός Διοδίων Τερόβου Μετωπικά (Προς Ρίο)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        39.42559,
        20.90509,
        'Ιωαννίνων-Τέροβο',
        'info@neaodos.gr',
        'ΜΤ',
        2.35,
        3.35,
        8.45,
        11.85,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO13',
        'Σταθμός Διοδίων Τραγάνας Μετωπικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.61750,
        23.14335,
        'Φθιώτιδος-Τραγάνα',
        'info@neaodos.gr',
        'ΜΤ',
        2.90,
        4.15,
        10.45,
        14.60,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO14',
        'Σταθμός Διοδίων Τραγάνας Μετωπικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.61772,
        23.14384,
        'Φθιώτιδος-Τραγάνα',
        'info@neaodos.gr',
        'ΜΤ',
        2.90,
        4.15,
        10.45,
        14.60,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO15',
        'Σταθμός Διοδίων Γαβρολίμνης Πλευρικά (Από Ιωάννινα)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.37341,
        21.62484,
        'Αιτωλοακαρνανίας-Γαβρολίμνη',
        'info@neaodos.gr',
        'ΠΛ',
        1.60,
        2.30,
        5.80,
        8.10,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO16',
        'Σταθμός Διοδίων Γαβρολίμνης Πλευρικά (Προς Ιωάννινα)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.37419,
        21.62510,
        'Αιτωλοακαρνανίας-Γαβρολίμνη',
        'info@neaodos.gr',
        'ΠΛ',
        1.60,
        2.30,
        5.80,
        8.10,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO17',
        'Σταθμός Διοδίων Μεσολογγίου Πλευρικά (Από Ιωάννινα)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.37953,
        21.49530,
        'Αιτωλοακαρνανίας-Ζέστη',
        'info@neaodos.gr',
        'ΠΛ',
        0.95,
        1.35,
        3.45,
        4.80,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO18',
        'Σταθμός Διοδίων Μεσολογγίου Πλευρικά (Προς Ιωάννινα)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.37935,
        21.49496,
        'Αιτωλοακαρνανίας-Ζέστη',
        'info@neaodos.gr',
        'ΠΛ',
        0.95,
        1.35,
        3.45,
        4.80,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO19',
        'Σταθμός Διοδίων Κουβαρά Πλευρικά (Από Ιωάννινα)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.69941,
        21.21408,
        'Αιτωλοακαρνανίας-Φυτείες',
        'info@neaodos.gr',
        'ΠΛ',
        1.25,
        1.75,
        4.45,
        6.25,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO20',
        'Σταθμός Διοδίων Κουβαρά Πλευρικά (Προς Ιωάννινα)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        38.70032,
        21.21573,
        'Αιτωλοακαρνανίας-Φυτείες',
        'info@neaodos.gr',
        'ΠΛ',
        1.25,
        1.75,
        4.45,
        6.25,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO21',
        'Σταθμός Διοδίων Άρτας Πλευρικά (Από Ιωάννινα)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        39.16037,
        21.01087,
        'Άρτας-Άγιος Δημήτριος',
        'info@neaodos.gr',
        'ΠΛ',
        0.55,
        0.80,
        2.10,
        2.90,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO22',
        'Σταθμός Διοδίων Άρτας Πλευρικά (Προς Ιωάννινα)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        39.16064,
        21.01217,
        'Άρτας-Άγιος Δημήτριος',
        'info@neaodos.gr',
        'ΠΛ',
        0.55,
        0.80,
        2.10,
        2.90,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO23',
        'Σταθμός Διοδίων Καπανδριτίου Πλευρικά (Από Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.20262,
        23.85396,
        'Αττικής-Καπανδρίτι',
        'info@neaodos.gr',
        'ΠΛ',
        1.50,
        2.15,
        5.40,
        7.60,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO24',
        'Σταθμός Διοδίων Καπανδριτίου Πλευρικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.20275,
        23.85477,
        'Αττικής-Καπανδρίτι',
        'info@neaodos.gr',
        'ΠΛ',
        1.50,
        2.15,
        5.40,
        7.60,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO25',
        'Σταθμός Διοδίων Μαλακάσας Πλευρικά (Από Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.23753,
        23.78053,
        'Αττικής-Μαλακάσα',
        'info@neaodos.gr',
        'ΠΛ',
        1.05,
        1.55,
        3.85,
        5.40,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO26',
        'Σταθμός Διοδίων Μαλακάσας Πλευρικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.23633,
        23.78600,
        'Αττικής-Μαλακάσα',
        'info@neaodos.gr',
        'ΠΛ',
        1.05,
        1.55,
        3.85,
        5.40,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO27',
        'Σταθμός Διοδίων Θήβας Πλευρικά (Από Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.36621,
        23.32467,
        'Βοιωτίας-Θήβα',
        'info@neaodos.gr',
        'ΠΛ',
        1.15,
        1.65,
        4.15,
        5.80,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO28',
        'Σταθμός Διοδίων Θήβας Πλευρικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.36403,
        23.32208,
        'Βοιωτίας-Θήβα',
        'info@neaodos.gr',
        'ΠΛ',
        1.15,
        1.65,
        4.15,
        5.80,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO29',
        'Σταθμός Διοδίων Οινοφύτων Πλευρικά (Από Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.28925,
        23.67591,
        'Βοιωτίας-Οινόφυτα',
        'info@neaodos.gr',
        'ΠΛ',
        0.50,
        0.70,
        1.80,
        2.55,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO30',
        'Σταθμός Διοδίων Οινοφύτων Πλευρικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.29219,
        23.67477,
        'Βοιωτίας-Οινόφυτα',
        'info@neaodos.gr',
        'ΠΛ',
        0.50,
        0.70,
        1.80,
        2.55,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO31',
        'Σταθμός Διοδίων Γοργόμυλου Πλευρικά (Από Ρίο)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        39.33170,
        20.91559,
        'Πρέβεζας-Γοργόμυλος',
        'info@neaodos.gr',
        'ΠΛ',
        0.75,
        1.10,
        2.75,
        3.90,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO32',
        'Σταθμός Διοδίων Γοργόμυλου Πλευρικά (Προς Ρίο)',
        'Α/Δ Αντιρρίου-Ιωαννίνων',
        39.33199,
        20.91415,
        'Πρέβεζας-Γοργόμυλος',
        'info@neaodos.gr',
        'ΠΛ',
        0.75,
        1.10,
        2.75,
        3.90,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO33',
        'Σταθμός Διοδίων Τραγάνας Πλευρικά (Από Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.62199,
        23.12357,
        'Φθιώτιδος-Τραγάνα',
        'info@neaodos.gr',
        'ΠΛ',
        2.35,
        3.35,
        8.35,
        11.75,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'NO34',
        'Σταθμός Διοδίων Τραγάνας Πλευρικά (Προς Θεσσαλονίκη)',
        'Α/Δ Αθηνών-Θεσσαλονίκης',
        38.62253,
        23.12381,
        'Φθιώτιδος-Τραγάνα',
        'info@neaodos.gr',
        'ΠΛ',
        2.35,
        3.35,
        8.35,
        11.75,
        'NO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO01',
        'Σταθμός Διοδίων Ελευσίνας Μετωπικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Κορίνθου',
        38.04199,
        23.49613,
        'Αττικής-Ελευσίνα',
        'customercare@olympiaoperation.gr',
        'ΜΤ',
        1.60,
        2.30,
        5.80,
        8.10,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO02',
        'Σταθμός Διοδίων Ελευσίνας Μετωπικά (Προς Πάτρα)',
        'Α/Δ Αθηνών-Κορίνθου',
        38.04250,
        23.49545,
        'Αττικής-Ελευσίνα',
        'customercare@olympiaoperation.gr',
        'ΜΤ',
        1.60,
        2.30,
        5.80,
        8.10,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO03',
        'Σταθμός Διοδίων Ρίου Μετωπικά (Προς Αθήνα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.31624,
        21.83038,
        'Αχαΐας-Άγιος Βασίλειος',
        'customercare@olympiaoperation.gr',
        'ΜΤ',
        1.70,
        2.40,
        6.20,
        8.70,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO04',
        'Σταθμός Διοδίων Ρίου Μετωπικά (Προς Πάτρα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.31663,
        21.82995,
        'Αχαΐας-Άγιος Βασίλειος',
        'customercare@olympiaoperation.gr',
        'ΜΤ',
        1.70,
        2.40,
        6.20,
        8.70,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO05',
        'Σταθμός Διοδίων Ελαιώνα Μετωπικά (Προς Αθήνα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.19048,
        22.16526,
        'Αχαΐας-Ελαιώνας',
        'customercare@olympiaoperation.gr',
        'ΜΤ',
        2.40,
        3.50,
        8.90,
        12.40,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO06',
        'Σταθμός Διοδίων Ελαιώνα Μετωπικά (Προς Πάτρα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.19092,
        22.16560,
        'Αχαΐας-Ελαιώνας',
        'customercare@olympiaoperation.gr',
        'ΜΤ',
        2.40,
        3.50,
        8.90,
        12.40,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO07',
        'Σταθμός Διοδίων Ισθμίων Μετωπικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Κορίνθου',
        37.92481,
        23.03208,
        'Κορινθίας-Ίσθμια',
        'customercare@olympiaoperation.gr',
        'ΜΤ',
        1.30,
        1.90,
        4.90,
        6.90,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO08',
        'Σταθμός Διοδίων Ισθμίων Μετωπικά (Προς Πάτρα)',
        'Α/Δ Αθηνών-Κορίνθου',
        37.92535,
        23.03274,
        'Κορινθίας-Ίσθμια',
        'customercare@olympiaoperation.gr',
        'ΜΤ',
        1.30,
        1.90,
        4.90,
        6.90,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO09',
        'Σταθμός Διοδίων Κιάτου Μετωπικά (Προς Αθήνα)',
        'Α/Δ Κορίνθου-Πατρών',
        37.99692,
        22.73517,
        'Κορινθίας-Κιάτο',
        'customercare@olympiaoperation.gr',
        'ΜΤ',
        1.70,
        2.50,
        6.20,
        8.80,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO10',
        'Σταθμός Διοδίων Κιάτου Μετωπικά (Προς Πάτρα)',
        'Α/Δ Κορίνθου-Πατρών',
        37.99651,
        22.73565,
        'Κορινθίας-Κιάτο',
        'customercare@olympiaoperation.gr',
        'ΜΤ',
        1.70,
        2.50,
        6.20,
        8.80,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO11',
        'Σταθμός Διοδίων Νέας Περάμου Πλευρικά (Από Πάτρα)',
        'Α/Δ Αθηνών-Κορίνθου',
        38.01988,
        23.42843,
        'Αττικής-Νέα Πέραμος',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        1.10,
        1.50,
        3.90,
        5.50,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO12',
        'Σταθμός Διοδίων Νέας Περάμου Πλευρικά (Προς Πάτρα)',
        'Α/Δ Αθηνών-Κορίνθου',
        38.01970,
        23.42683,
        'Αττικής-Νέα Πέραμος',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        1.10,
        1.50,
        3.90,
        5.50,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO13',
        'Σταθμός Διοδίων Πάχης Πλευρικά (Από Πάτρα)',
        'Α/Δ Αθηνών-Κορίνθου',
        37.98501,
        23.34987,
        'Αττικής-Πάχη',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        0.70,
        1.00,
        2.50,
        3.50,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO14',
        'Σταθμός Διοδίων Πάχης Πλευρικά (Προς Πάτρα)',
        'Α/Δ Αθηνών-Κορίνθου',
        37.98590,
        23.34910,
        'Αττικής-Πάχη',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        0.70,
        1.00,
        2.50,
        3.50,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO15',
        'Σταθμός Διοδίων Δρεπάνου Πλευρικά (Από Αθήνα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.32496,
        21.85800,
        'Αχαΐας-Δρέπανο',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        1.30,
        1.80,
        4.70,
        6.60,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO16',
        'Σταθμός Διοδίων Δρεπάνου Πλευρικά (Προς Αθήνα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.32513,
        21.85815,
        'Αχαΐας-Δρέπανο',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        1.30,
        1.80,
        4.70,
        6.60,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO17',
        'Σταθμός Διοδίων Ακράτας Πλευρικά (Από Αθήνα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.15655,
        22.34285,
        'Αχαΐας-Κράθιο',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        1.30,
        1.90,
        4.70,
        6.70,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO18',
        'Σταθμός Διοδίων Ακράτας Πλευρικά (Προς Αθήνα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.15715,
        22.34236,
        'Αχαΐας-Κράθιο',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        1.30,
        1.90,
        4.70,
        6.70,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO19',
        'Σταθμός Διοδίων Καλαβρύτων Πλευρικά (Από Αθήνα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.17475,
        22.23938,
        'Αχαΐας-Τράπεζα',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        1.80,
        2.60,
        6.50,
        9.10,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO20',
        'Σταθμός Διοδίων Καλαβρύτων Πλευρικά (Προς Αθήνα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.17461,
        22.23961,
        'Αχαΐας-Τράπεζα',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        1.80,
        2.60,
        6.50,
        9.10,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO21',
        'Σταθμός Διοδίων Αγίων Θεοδώρων Πλευρικά (Από Αθήνα)',
        'Α/Δ Αθηνών-Κορίνθου',
        37.92207,
        23.11896,
        'Κορινθίας-Άγιοι Θεόδωροι',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        0.40,
        0.60,
        1.50,
        2.10,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO22',
        'Σταθμός Διοδίων Αγίων Θεοδώρων Πλευρικά (Προς Αθήνα)',
        'Α/Δ Αθηνών-Κορίνθου',
        37.92194,
        23.11967,
        'Κορινθίας-Άγιοι Θεόδωροι',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        0.40,
        0.60,
        1.50,
        2.10,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO23',
        'Σταθμός Διοδίων Δερβενίου Πλευρικά (Από Αθήνα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.13183,
        22.40492,
        'Κορινθίας-Δερβένι',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        1.00,
        1.40,
        3.60,
        5.10,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO24',
        'Σταθμός Διοδίων Δερβενίου Πλευρικά (Προς Αθήνα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.13193,
        22.40525,
        'Κορινθίας-Δερβένι',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        1.00,
        1.40,
        3.60,
        5.10,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO25',
        'Σταθμός Διοδίων Ζευγολατιού Πλευρικά (Από Αθήνα)',
        'Α/Δ Κορίνθου-Πατρών',
        37.93143,
        22.78815,
        'Κορινθίας-Ζευγολατιό',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        0.50,
        0.80,
        2.00,
        2.90,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO26',
        'Σταθμός Διοδίων Ζευγολατιού Πλευρικά (Προς Αθήνα)',
        'Α/Δ Κορίνθου-Πατρών',
        37.93128,
        22.78786,
        'Κορινθίας-Ζευγολατιό',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        0.50,
        0.80,
        2.00,
        2.90,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO27',
        'Σταθμός Διοδίων Κιάτου Πλευρικά (Από Πάτρα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.00783,
        22.73326,
        'Κορινθίας-Κιάτο',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        0.60,
        0.90,
        2.40,
        3.30,
        'OO'
    );
INSERT INTO Toll_Station (
        ID,
        Name,
        Road,
        Lat,
        Long_,
        Locality,
        Email,
        PM,
        Price1,
        Price2,
        Price3,
        Price4,
        OperatorID
    )
VALUES (
        'OO28',
        'Σταθμός Διοδίων Κιάτου Πλευρικά (Προς Πάτρα)',
        'Α/Δ Κορίνθου-Πατρών',
        38.00783,
        22.73354,
        'Κορινθίας-Κιάτο',
        'customercare@olympiaoperation.gr',
        'ΠΛ',
        0.60,
        0.90,
        2.40,
        3.30,
        'OO'
    );
-- Create the insterts for the users table --
INSERT INTO User (Username, Password, OperatorID)
VALUES ('aegeanmotorway', 'aegeanmotorway', 'AM');
INSERT INTO User (Username, Password, OperatorID)
VALUES ('egnatia', 'egnatia', 'EG');
INSERT INTO User (Username, Password, OperatorID)
VALUES ('gefyra', 'gefyra', 'GE');
INSERT INTO User (Username, Password, OperatorID)
VALUES ('kentrikiodos', 'kentrikiodos', 'KO');
INSERT INTO User (Username, Password, OperatorID)
VALUES ('moreas', 'moreas', 'MO');
INSERT INTO User (Username, Password, OperatorID)
VALUES ('naodos', 'naodos', 'NAO');
INSERT INTO User (Username, Password, OperatorID)
VALUES ('neaodos', 'neaodos', 'NO');
INSERT INTO User (Username, Password, OperatorID)
VALUES ('olympiaodos', 'olympiaodos', 'OO');
INSERT INTO User (Username, Password, OperatorID)
VALUES ('admin', 'admin', 'admin');
-- Create the insterts for the Debts table --
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'EG', 'AM');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'GE', 'AM');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'KO', 'AM');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'MO', 'AM');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NAO', 'AM');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NO', 'AM');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'OO', 'AM');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'AM', 'EG');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'GE', 'EG');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'KO', 'EG');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'MO', 'EG');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NAO', 'EG');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NO', 'EG');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'OO', 'EG');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'AM', 'GE');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'EG', 'GE');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'KO', 'GE');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'MO', 'GE');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NAO', 'GE');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NO', 'GE');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'OO', 'GE');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'AM', 'KO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'EG', 'KO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'GE', 'KO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'MO', 'KO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NAO', 'KO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NO', 'KO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'OO', 'KO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'AM', 'MO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'EG', 'MO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'GE', 'MO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'KO', 'MO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NAO', 'MO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NO', 'MO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'OO', 'MO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'AM', 'NAO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'EG', 'NAO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'GE', 'NAO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'KO', 'NAO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'MO', 'NAO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NO', 'NAO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'OO', 'NAO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'AM', 'NO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'EG', 'NO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'GE', 'NO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'KO', 'NO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'MO', 'NO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NAO', 'NO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'OO', 'NO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'AM', 'OO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'EG', 'OO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'GE', 'OO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'KO', 'OO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'MO', 'OO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NAO', 'OO');
INSERT INTO Debt (Amount, StartDate, ToOperator, FromOperator)
VALUES (0, NULL, 'NO', 'OO');