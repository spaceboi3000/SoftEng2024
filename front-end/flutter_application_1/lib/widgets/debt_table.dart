import 'package:flutter/material.dart';

class DebtTable extends StatelessWidget {
  final String title;
  final List<String> headers;
  final List<List<String>> data;
  final Map<String, String> operatorCodeToName;
  final Map<String, String> roleToOperatorCode;
  final List<TextEditingController>? amountControllers;
  final bool isPayButtonVisible;
  final Future<void> Function()? onPayAll;
  final Future<void> Function()? onRefresh;

  const DebtTable(BuildContext context, {
    super.key,
    required this.title,
    required this.headers,
    required this.data,
    required this.operatorCodeToName,
    required this.roleToOperatorCode,
    this.amountControllers,
    this.isPayButtonVisible = false,
    this.onPayAll,
    this.onRefresh, // Accept refresh callback
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Title Row with Refresh button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF280A7F),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              color: const Color(0xFF280A7F),
              onPressed: onRefresh, // Trigger refresh callback
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Headers Row
        Table(
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(3),
            3: FlexColumnWidth(1.5), // Adjusted width for the rightmost column
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: headers.map(
                (header) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    header,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF280A7F),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ).toList(),
            ),
          ],
        ),
        const Divider(
          color: Color(0xFF280A7F),
          thickness: 2,
          height: 5,
        ),
        // Data Rows
        Table(
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(3),
            3: FlexColumnWidth(1.5), // Adjusted width for the rightmost column
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: data.asMap().entries.map(
            (entry) {
              final rowIndex = entry.key;
              final row = entry.value;
              return TableRow(
                children: [
                  for (int i = 0; i < row.length; i++)
                    if (i == row.length - 1 && isPayButtonVisible && amountControllers != null)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 8, 16, 8), // Add padding to shift left
                        child: TextField(
                          controller: amountControllers?[rowIndex],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter amount",
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                      )
                    else
                      Padding(
                        padding: i == 2 // Add padding for the "Χρονική Περίοδος" column
                            ? const EdgeInsets.fromLTRB(4, 8, 16, 8)
                            : const EdgeInsets.all(8.0),
                        child: Text(
                          row[i],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF280A7F),
                          ),
                        ),
                      ),
                ],
              );
            },
          ).toList(),
        ),
        if (isPayButtonVisible && onPayAll != null)
          Align(
            alignment: Alignment.centerRight, // Align to the right edge of the table
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 50), // Adjust the padding
              child: ElevatedButton(
                onPressed: onPayAll,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCE6AB2),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Pay All",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

