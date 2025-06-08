import 'dart:convert'; // For JSON decoding
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import '../widgets/debt_table.dart';

import '../globals.dart';

class DebtsScreen extends StatefulWidget {
  final String loggedInRole;
  final String? selectedOperator;

  const DebtsScreen({
    super.key,
    required this.loggedInRole,
    this.selectedOperator,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DebtsScreenState createState() => _DebtsScreenState();
}

class _DebtsScreenState extends State<DebtsScreen> {
  List<List<String>> myDebts = [];
  List<TextEditingController> amountControllers = [];
  List<List<String>> othersDebts = [];
  bool isLoading = true;

  String? selectedOperator; // Holds the selected operator for admin role
  final List<String> operators = [
    "aegeanmotorway",
    "egnatia",
    "gefyra",
    "kentrikiodos",
    "moreas",
    "naodos",
    "neaodos",
    "olympiados",
  ];

  // Map for translating operator codes to full names
  final Map<String, String> operatorCodeToName = {
    "admin": "admin",
    "AM": "aegeanmotorway",
    "EG": "egnatia",
    "GE": "gefyra",
    "KO": "kentrikiodos",
    "MO": "moreas",
    "NAO": "naodos",
    "NO": "neaodos",
    "OO": "olympiados",
  };

  // Map for translating loggedInRole to operator codes
  final Map<String, String> roleToOperatorCode = {
    "admin": "admin",
    "aegeanmotorway": "AM",
    "egnatia": "EG",
    "gefyra": "GE",
    "kentrikiodos": "KO",
    "moreas": "MO",
    "naodos": "NAO",
    "neaodos": "NO",
    "olympiados": "OO",
  };

  String get operatorID {
    // Default to loggedInRole if selectedOperator is null (non-admin users)
    return roleToOperatorCode[widget.selectedOperator ?? widget.loggedInRole] ??
        "Unknown";
  }

  @override
  void initState() {
    super.initState();
    fetchDebtData();
  }

  Future<void> fetchDebtData() async {
    try {
      const baseUrl = 'http://127.0.0.1:9115/api';

      // Determine the operator ID dynamically
      final operatorID =
          roleToOperatorCode[widget.selectedOperator ?? widget.loggedInRole] ??
              "Unknown";

      // Fetch "My Debts"
      final myDebtsResponse =
          await http.get(Uri.parse('$baseUrl/showsDebtFrom/$operatorID'));
      if (myDebtsResponse.statusCode == 200) {
        final myDebtsData = json.decode(myDebtsResponse.body);
        if (myDebtsData['status'] == 'success') {
          myDebts = (myDebtsData['debtList'] as List).map<List<String>>((debt) {
            final debtAmount = (debt['DebtAmount'] as num).toStringAsFixed(2);
            final startDate = debt['DebtStartDate'];
            final currentDate = DateTime.now()
                .toIso8601String()
                .split('T')
                .first; // Get current date

            return [
              operatorCodeToName[debt['Creditor']] ?? debt['Creditor'],
              debtAmount,
              debtAmount == "0.00" ? "-" : "$startDate - $currentDate",
              ''
            ];
          }).toList();
          amountControllers =
              List.generate(myDebts.length, (index) => TextEditingController());
        }
      }

      // Fetch "Others Debts"
      final othersDebtsResponse =
          await http.get(Uri.parse('$baseUrl/showsDebtTo/$operatorID'));
      if (othersDebtsResponse.statusCode == 200) {
        final othersDebtsData = json.decode(othersDebtsResponse.body);
        if (othersDebtsData['status'] == 'success') {
          othersDebts =
              (othersDebtsData['debtList'] as List).map<List<String>>((debt) {
            final debtAmount = (debt['DebtAmount'] as num).toStringAsFixed(2);
            final startDate = debt['DebtStartDate'];
            final currentDate = DateTime.now()
                .toIso8601String()
                .split('T')
                .first; // Get current date

            return [
              operatorCodeToName[debt['Debtor']] ?? debt['Debtor'],
              debtAmount,
              debtAmount == "0.00" ? "-" : "$startDate - $currentDate",
            ];
          }).toList();
        }
      }
    } catch (e) {
      // Handle errors
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> downloadCSV() async {
    final List<List<dynamic>> rows = [];
    rows.add(["Αυτοκινητόδρομος", "Ποσό Οφειλής", "Χρονική Περίοδος"]);
    for (var debt in myDebts) {
      rows.add([debt[0], debt[1], debt[2]]);
    }

    // Convert the data to CSV format
    String csv = const ListToCsvConverter().convert(rows);

    // Add BOM to ensure proper display of Greek characters in Excel
    final bytes = utf8.encode('\uFEFF$csv'); // Prepend BOM to the CSV content
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Trigger download
    final anchor = html.AnchorElement(href: url)
      ..target = '_blank'
      ..download = 'my_debts.csv'
      ..click();

    html.Url.revokeObjectUrl(url);
  }

  Future<void> downloadCSVForOthersDebts() async {
    final List<List<dynamic>> rows = [];
    rows.add(["Αυτοκινητόδρομος", "Χρεωστούμενο Ποσό", "Χρονική Περίοδος"]);
    for (var debt in othersDebts) {
      rows.add([debt[0], debt[1], debt[2]]);
    }

    // Convert the data to CSV format
    String csv = const ListToCsvConverter().convert(rows);

    // Add BOM to ensure proper display of Greek characters in Excel
    final bytes = utf8.encode('\uFEFF$csv'); // Prepend BOM to the CSV content
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Trigger download
    final anchor = html.AnchorElement(href: url)
      ..target = '_blank'
      ..download = 'others_debts.csv'
      ..click();

    html.Url.revokeObjectUrl(url);
  }

  Future<void> payAllDebts() async {
    for (int i = 0; i < myDebts.length; i++) {
      final controller = amountControllers[i];
      final amountText = controller.text.trim();
      final payingOpID = roleToOperatorCode[loggedInRole!] ?? loggedInRole!;
      final receivingOpName = myDebts[i][0];
      final receivingOpID = operatorCodeToName.entries
          .firstWhere(
            (entry) => entry.value == receivingOpName,
            orElse: () => MapEntry(receivingOpName, receivingOpName),
          )
          .key;
      final amountPaid =
          double.tryParse(amountText) ?? 0.0; // Default to 0.0 if no input

      if (amountPaid < 0) {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Invalid Amount"),
            content: Text("Please enter a valid non-negative amount."),
          ),
        );
        return;
      }

      try {
        // API request to pay the debt
        final response = await http.post(
          Uri.parse(
              'http://127.0.0.1:9115/api/payDebt/$payingOpID/$receivingOpID/$amountPaid'),
        );

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);

          if (responseData['status'] == 'success') {
            final currentAmount = double.parse(myDebts[i][1]);
            final remainingAmount =
                (currentAmount - amountPaid).clamp(0, double.infinity);

            setState(() {
              myDebts[i][1] = remainingAmount == 0
                  ? "0.00"
                  : remainingAmount.toStringAsFixed(2);
              myDebts[i][2] = remainingAmount == 0 ? "-" : myDebts[i][2];
              controller.clear(); // Clear the input field
            });
          } else {
            showDialog(
              // ignore: use_build_context_synchronously
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Payment Failed"),
                content: Text(responseData['message']),
              ),
            );
          }
        } else {
          showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (context) => const AlertDialog(
              title: Text("Error"),
              content: Text(
                  "Unable to process the payment. Please try again later."),
            ),
          );
        }
      } catch (e) {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Error"),
            content: Text(
                "Unable to process the payment. Please check your connection."),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD6F4),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
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
                                Navigator.pushReplacementNamed(
                                    context, '/welcome');
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        loggedInRole == "admin"
                            ? ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/selectoperator');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFCE6AB2),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                icon: const Icon(Icons.swap_horiz,
                                    color: Color(0xFF280A7F)),
                                label: const Text(
                                  "Διάλεξε άλλον λειτουργό αυτοκινητόδρομου",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF280A7F),
                                  ),
                                ),
                              )
                            : ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/dashboard');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFCE6AB2),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                icon: const Icon(Icons.arrow_back,
                                    color: Color(0xFF280A7F)),
                                label: const Text(
                                  "Home",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF280A7F),
                                  ),
                                ),
                              ),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: downloadCSV,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF280A7F),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(Icons.download,
                                  color: Colors.white),
                              label: const Text(
                                "Download My Debts",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton.icon(
                              onPressed: downloadCSVForOthersDebts,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF280A7F),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(Icons.download,
                                  color: Colors.white),
                              label: const Text(
                                "Download Others' Debts",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            DebtTable(
                              context,
                              title: widget.selectedOperator ==
                                      widget.loggedInRole
                                  ? "Οι οφειλές μου"
                                  : "Οι οφειλές του ${widget.selectedOperator}",
                              headers: widget.loggedInRole == "admin"
                                  ? const [
                                      "Αυτοκινητόδρομος",
                                      "Ποσό Οφειλής",
                                      "Χρονική Περίοδος"
                                    ] // No "Πληρωμή" column
                                  : const [
                                      "Αυτοκινητόδρομος",
                                      "Ποσό Οφειλής",
                                      "Χρονική Περίοδος",
                                      "Πληρωμή"
                                    ], // Include "Πληρωμή" column
                              data: myDebts,
                              isPayButtonVisible:
                                  widget.loggedInRole != "admin",
                              amountControllers: amountControllers,
                              onPayAll: widget.loggedInRole != "admin"
                                  ? payAllDebts
                                  : null,
                              onRefresh: fetchDebtData,
                              operatorCodeToName: operatorCodeToName,
                              roleToOperatorCode: roleToOperatorCode,
                            ),
                            const SizedBox(height: 30),
                            DebtTable(
                              context,
                              title: widget.selectedOperator ==
                                      widget.loggedInRole
                                  ? "Οφειλές από άλλους"
                                  : "Οφειλές από άλλους στον ${widget.selectedOperator}",
                              headers: const [
                                "Αυτοκινητόδρομος",
                                "Χρεωστούμενο Ποσό",
                                "Χρονική Περίοδος"
                              ], // No "Πληρωμή" column
                              data: othersDebts,
                              isPayButtonVisible: false,
                              amountControllers: null,
                              onPayAll: null,
                              onRefresh: fetchDebtData,
                              operatorCodeToName: operatorCodeToName,
                              roleToOperatorCode: roleToOperatorCode,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
