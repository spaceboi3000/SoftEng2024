import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'error_screen.dart';
import '../globals.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  DateTime? dateFrom;
  DateTime? dateTo;
  String? selectedFilterType;
  String? selectedOperator;
  List<String> selectedStations = [];
  Future<List<String>> loadStations(String userRole) async {
    try {
      // Map user roles to corresponding CSV filenames
      final Map<String, String> csvFiles = {
        'aegeanmotorway': 'assets/csv/StationsOfAM.csv',
        'egnatia': 'assets/csv/StationsOfEG.csv',
        'gefyra': 'assets/csv/StationsOfGE.csv',
        'kentrikiodos': 'assets/csv/StationsOfKO.csv',
        'moreas': 'assets/csv/StationsOfMO.csv',
        'naodos': 'assets/csv/StationsOfNAO.csv',
        'neaodos': 'assets/csv/StationsOfNO.csv',
        'olympiados': 'assets/csv/StationsOfOO.csv',
        'admin': 'assets/csv/AllStations.csv',
      };

      // Get the corresponding CSV file
      final csvFile = csvFiles[userRole];
      if (csvFile == null) {
        return ["No stations available"];
      }

      // Load and parse the CSV file
      final csvData = await rootBundle.loadString(csvFile);
      final rows = const LineSplitter().convert(csvData);

      if (rows.isEmpty) {
        return ["No stations found"];
      }

      // Extract station names (skip the header row if needed)
      return rows.skip(1).toList();
    } catch (e) {
      print(" Error loading stations: $e"); // Debugging log
      return ["Error loading stations"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD6F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Row with Logo, Title, and Logout
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 50,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Pass4All",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF280A7F),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        loggedInRole ?? "Unknown Role",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF280A7F),
                        ),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/welcome');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFCE6AB2),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF280A7F),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Image.asset(
                              "assets/images/logout.png",
                              height: 18,
                              width: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCE6AB2),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon:
                        const Icon(Icons.arrow_back, color: Color(0xFF280A7F)),
                    label: const Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF280A7F),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Φίλτρα Αναζήτησης Στατιστικών",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF280A7F),
                    ),
                  ),
                  const Spacer(),
                ],
              ),

              const SizedBox(height: 40),

              // Filter Options
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _DropdownField(
                            label: "Είδος Αναζήτησης",
                            items: const [
                              "Διελεύσεις ανά ημέρα",
                              "Διελεύσεις ανά σταθμό",
                              "Κέρδος ανά ημέρα",
                              "Κέρδος ανά σταθμό",
                              "Διελεύσεις ανά operator",
                              "Κέρδος ανά operator",
                              "Διελεύσεις, Κέρδη ανά operator",
                            ],
                            onItemSelected: (value) {
                              setState(() {
                                selectedFilterType = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: FutureBuilder<List<String>>(
                            future: loadStations(loggedInRole!),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError ||
                                  !snapshot.hasData) {
                                return const Text("Error loading stations");
                              }
                              final userStations = snapshot.data!;
                              return _MultiSelectField(
                                label: "Σταθμός Διέλευσης",
                                items: userStations,
                                onSelectionChanged: (values) {
                                  selectedStations = values;
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _DatePickerField(
                            label: "Date From",
                            onDateSelected: (selectedDate) {
                              setState(() {
                                dateFrom = selectedDate;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _DatePickerField(
                            label: "Date To",
                            onDateSelected: (selectedDate) {
                              setState(() {
                                dateTo = selectedDate;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    if (loggedInRole == "admin" &&
                        (selectedFilterType == "Διελεύσεις ανά operator" ||
                            selectedFilterType == "Κέρδος ανά operator" ||
                            selectedFilterType ==
                                "Διελεύσεις, Κέρδη ανά operator")) ...[
                      Row(
                        children: [
                          Expanded(
                            child: _DropdownField(
                              label: "Operator",
                              items: const [
                                "aegeanmotorway",
                                "egnatia",
                                "gefyra",
                                "kentrikiodos",
                                "moreas",
                                "naodos",
                                "neaodos",
                                "olympiados",
                              ],
                              onItemSelected: (value) {
                                setState(() {
                                  selectedOperator = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (selectedFilterType == null ||
                            selectedStations.isEmpty ||
                            dateFrom == null ||
                            dateTo == null ||
                            dateTo!.isBefore(dateFrom!) ||
                            (loggedInRole == "admin" &&
                                (selectedFilterType ==
                                        "Διελεύσεις ανά operator" ||
                                    selectedFilterType ==
                                        "Κέρδος ανά operator" ||
                                    selectedFilterType ==
                                        "Διελεύσεις, Κέρδη ανά operator") &&
                                selectedOperator == null)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ErrorScreen(
                                errorMessage:
                                    "Φαίνεται πως υπήρξε ένα πρόβλημα στην επιλογή των φίλτρων της αναζήτησής σου...",
                                buttonText: "Επιστροφή στα Φίλτρα",
                                onButtonPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/statistics');
                                },
                              ),
                            ),
                          );
                        } else {
                          Navigator.pushNamed(
                            context,
                            '/statisticsresults',
                            arguments: {
                              'typeOfSearch': selectedFilterType,
                              'dateFrom': dateFrom?.toIso8601String(),
                              'dateTo': dateTo?.toIso8601String(),
                              'stations': selectedStations,
                              if (loggedInRole == "admin" &&
                                  (selectedFilterType ==
                                          "Διελεύσεις ανά operator" ||
                                      selectedFilterType ==
                                          "Κέρδος ανά operator" ||
                                      selectedFilterType ==
                                          "Διελεύσεις, Κέρδη ανά operator"))
                                'operator': selectedOperator,
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFCE6AB2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Show statistics",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF280A7F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MultiSelectField extends StatefulWidget {
  final String label;
  final List<String> items;
  final ValueChanged<List<String>> onSelectionChanged;

  const _MultiSelectField({
    required this.label,
    required this.items,
    required this.onSelectionChanged,
  });

  @override
  _MultiSelectFieldState createState() => _MultiSelectFieldState();
}

class _MultiSelectFieldState extends State<_MultiSelectField> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF280A7F),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            final selected = await showDialog<List<String>>(
              context: context,
              builder: (context) {
                return MultiSelectDialog(
                  items: widget.items,
                  initialSelectedItems: selectedItems,
                  allowSelectAll: true, // Add this parameter
                );
              },
            );
            if (selected != null) {
              setState(() {
                selectedItems = selected;
              });
              widget.onSelectionChanged(selected);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFC774C9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    selectedItems.isNotEmpty
                        ? selectedItems.join(", ")
                        : "Select options",
                    maxLines: 1, // Allow only one line
                    overflow:
                        TextOverflow.ellipsis, // Add ellipsis for overflow
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MultiSelectDialog extends StatefulWidget {
  final List<String> items;
  final List<String> initialSelectedItems;
  final bool allowSelectAll; // Added flag for "Επιλογή όλων"

  const MultiSelectDialog({
    super.key,
    required this.items,
    required this.initialSelectedItems,
    this.allowSelectAll = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialog> {
  late List<String> selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = List.from(widget.initialSelectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select options"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            // Add "Επιλογή όλων" option if allowed
            if (widget.allowSelectAll)
              CheckboxListTile(
                title: const Text("Επιλογή όλων"),
                value: selectedItems.length == widget.items.length,
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      selectedItems = List.from(widget.items);
                    } else {
                      selectedItems.clear();
                    }
                  });
                },
              ),
            const Divider(),
            // Render individual items
            ...widget.items.map(
              (item) => CheckboxListTile(
                title: Text(item),
                value: selectedItems.contains(item),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      selectedItems.add(item);
                    } else {
                      selectedItems.remove(item);
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(selectedItems);
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}

class _DropdownField extends StatefulWidget {
  final String label;
  final List<String> items;
  final ValueChanged<String?> onItemSelected;

  const _DropdownField({
    required this.label,
    required this.items,
    required this.onItemSelected,
  });

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<_DropdownField> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF280A7F),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFC774C9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {
                  selectedItem = value;
                });
                widget.onItemSelected(value);
              },
              initialValue: selectedItem,
              itemBuilder: (context) => widget.items
                  .map(
                    (item) => PopupMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(color: Color(0xFF280A7F)),
                      ),
                    ),
                  )
                  .toList(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedItem ?? "Select an option",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DatePickerField extends StatefulWidget {
  final String label;
  final ValueChanged<DateTime?> onDateSelected;

  const _DatePickerField({required this.label, required this.onDateSelected});

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<_DatePickerField> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF280A7F),
          ),
        ),
        GestureDetector(
          onTap: () async {
            final DateTime? date = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
            );
            if (date != null) {
              setState(() {
                selectedDate = date;
                widget.onDateSelected(selectedDate);
              });
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFC774C9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate != null
                      ? "${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}"
                      : "MM/DD/YYYY",
                  style: const TextStyle(color: Colors.white),
                ),
                const Icon(Icons.calendar_today, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
