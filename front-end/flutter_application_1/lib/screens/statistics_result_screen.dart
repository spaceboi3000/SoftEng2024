import 'dart:convert';
//import 'dart:ffi';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:csv/csv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

//Efro: i changed this you should change it back
//import 'package:softeng_ui2/widgets/graph_section.dart';
import 'package:flutter_application_1/widgets/graph_section.dart';
import '../globals.dart';

class StatisticsResultsScreen extends StatefulWidget {
  final String typeOfSearch;
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final List<String> stations;
  final String operatorforadmin;

  const StatisticsResultsScreen({
    required this.typeOfSearch,
    required this.dateFrom,
    required this.dateTo,
    required this.stations,
    required this.operatorforadmin,
    super.key,
  });

  @override
  State<StatisticsResultsScreen> createState() =>
      _StatisticsResultsScreenState();
}

class _StatisticsResultsScreenState extends State<StatisticsResultsScreen> {
  final GlobalKey columnGraphKey = GlobalKey();
  final GlobalKey pieChartKey1 = GlobalKey();
  final GlobalKey pieChartKey2 = GlobalKey();

  String sanitizeString(dynamic input) {
    if (input == null) return "Unknown";
    return input.toString().replaceAll(RegExp(r'[^\x20-\x7E]'), '');
  }

  List<String> operators = ["AM", "GE", "EG", "KO", "MO", "NAO", "NO", "OO"];

  final Map<String, String> operatorMap = {
    "aegeanmotorway": "AM",
    "egnatia": "EG",
    "gefrya": "GE",
    "kentrikiodos": "KO",
    "moreas": "MO",
    "naodos": "NAO",
    "neaodos": "NO",
    "olympiados": "OO",
  };

  // Function to create a dynamic summary section
  pw.Widget buildDynamicDataSummary(
      String title,
      List<Map<String, dynamic>> data,
      String name1,
      String name2,
      pw.Font ttf) {
    if (data.isEmpty) {
      return pw.Text(
        "No data available",
        style: pw.TextStyle(font: ttf, fontSize: 14),
      );
    }
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
            font: ttf, // Use the loaded font
          ),
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          "Column Graph Data:",
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
            font: ttf, // Use the loaded font
          ),
        ),
        pw.Bullet(
          text: data
              .map((e) => "${sanitizeString(e[name1])}: ${e[name2]}")
              .join('\n'),
          style: pw.TextStyle(font: ttf),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD6F4), // Background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row with Logo, Title, and Logout
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/logo.png", // Replace with your logo path
                        height: 50,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Pass4All",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900, // Extra bold
                          color: Color(0xFF280A7F),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        loggedInRole ??
                            "Unknown Role", // Display the global role
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

              const SizedBox(height: 30), // Space after header

              // Title and Back Button
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    },
                    icon:
                        const Icon(Icons.arrow_back, color: Color(0xFF280A7F)),
                    label: const Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF280A7F),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCE6AB2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF280A7F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      widget.typeOfSearch, // Use typeOfSearch as the title
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),

              const SizedBox(height: 30), // Space before content
/*
              Expanded(
                child: FutureBuilder<Map<String, dynamic>>(
                  future: fetchGraphData(
                    widget.typeOfSearch,
                    widget.stations,
                    widget.dateFrom!,
                    widget.dateTo!,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text('Error loading graph data'));
                    }

                    // Data fetched successfully
                    final data = snapshot.data!;
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Fetched Data:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Column Graph Data: ${data['columnGraph'] ?? 'No Data'}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Pie Chart 1 Data: ${data['pieGraph1'] ?? 'No Data'}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Pie Chart 2 Data: ${data['pieGraph2'] ?? 'No Data'}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
*/

              Expanded(
                child: FutureBuilder<Map<String, dynamic>>(
                  future: fetchGraphData(
                    widget.typeOfSearch,
                    widget.stations,
                    widget.dateFrom!,
                    widget.dateTo!,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return const Center(
                          child: Text('Error loading graph data'));
                    }

                    final rawData = snapshot.data;

                    // Ensure `rawData` is not null and has the expected structure
                    if (rawData == null || !(rawData is Map<String, dynamic>)) {
                      print('Invalid data format received: $rawData');
                      return const Center(
                          child: Text('Invalid data format received.'));
                    }

                    print('Raw data received: $rawData');

                    // Extract and cast data safely
                    final columnGraphData =
                        (rawData['columnGraph'] as List<dynamic>?)
                                ?.map((item) => item as Map<String, dynamic>)
                                .toList() ??
                            [];
                    final pieGraphData1 =
                        (rawData['pieGraph1'] as List<dynamic>?)
                                ?.map((item) => item as Map<String, dynamic>)
                                .toList() ??
                            [];
                    final pieGraphData2 =
                        (rawData['pieGraph2'] as List<dynamic>?)
                                ?.map((item) => item as Map<String, dynamic>)
                                .toList() ??
                            [];

                    print('Processed Column Graph Data: $columnGraphData');
                    print('Processed Pie Graph Data 1: $pieGraphData1');
                    print('Processed Pie Graph Data 2: $pieGraphData2');

                    // Pass the processed data to GraphSection
                    return GraphSection(
                      typeOfSearch: widget.typeOfSearch,
                      columnGraphKey: columnGraphKey,
                      pieChartKey1: pieChartKey1,
                      pieChartKey2: pieChartKey2,
                      columnGraphData: columnGraphData,
                      pieGraphData1: pieGraphData1,
                      pieGraphData2: pieGraphData2,
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              // Description and Buttons
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _getDescription(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF280A7F),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/statistics');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFCE6AB2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                        ),
                        child: const Text(
                          "Νέα αναζήτηση",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF280A7F),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            // Fetch the graph data dynamically
                            final Map<String, dynamic> graphData =
                                await fetchGraphData(
                              widget.typeOfSearch,
                              widget.stations,
                              widget.dateFrom!,
                              widget.dateTo!,
                            );

                            // Prepare the data for CSV export
                            final List<List<dynamic>> rows = [];
                            if (widget.typeOfSearch ==
                                "Διελεύσεις ανά σταθμό") {
                              rows.add(["Σταθμός", "Αριθμός Διελεύσεων"]);
                              if (graphData['columnGraph'] != null) {
                                final List<dynamic> columnGraphData =
                                    graphData['columnGraph'];
                                for (final entry in columnGraphData) {
                                  rows.add([entry['station'], entry['count']]);
                                }
                              }
                            }
                            if (widget.typeOfSearch ==
                                "Διελεύσεις ανά operator") {
                              rows.add(["Operator", "Αριθμός Διελεύσεων"]);
                              if (graphData['columnGraph'] != null) {
                                final List<dynamic> columnGraphData =
                                    graphData['columnGraph'];
                                for (final entry in columnGraphData) {
                                  rows.add([entry['operator'], entry['count']]);
                                }
                              }
                            }
                            if (widget.typeOfSearch == "Κέρδος ανά operator") {
                              rows.add(["Operator", "Κέρδος"]);
                              if (graphData['columnGraph'] != null) {
                                final List<dynamic> columnGraphData =
                                    graphData['columnGraph'];
                                for (final entry in columnGraphData) {
                                  rows.add([entry['operator'], entry['count']]);
                                }
                              }
                            }
                            if (widget.typeOfSearch == "Κέρδος ανά σταθμό") {
                              rows.add(["Σταθμός", "Κέρδος"]);
                              if (graphData['columnGraph'] != null) {
                                final List<dynamic> columnGraphData =
                                    graphData['columnGraph'];
                                for (final entry in columnGraphData) {
                                  rows.add([entry['station'], entry['cost']]);
                                }
                              }
                            }
                            if (widget.typeOfSearch == "Κέρδος ανά ημέρα") {
                              rows.add(["Ημέρα", "Κέρδος"]);
                              if (graphData['columnGraph'] != null) {
                                final List<dynamic> columnGraphData =
                                    graphData['columnGraph'];
                                for (final entry in columnGraphData) {
                                  rows.add([entry['date'], entry['cost']]);
                                }
                              }
                            }
                            if (widget.typeOfSearch ==
                                "Διελεύσεις, Κέρδη ανά operator") {
                              rows.add([
                                "Operator",
                                "Διελεύσεις",
                                "Κέρδος"
                              ]); // Add headers
                              final List<dynamic>? columnGraphData =
                                  graphData['columnGraph']; // Pass counts
                              final List<dynamic>? pieGraphData1 =
                                  graphData['pieGraph1']; // Costs

                              if (columnGraphData != null &&
                                  pieGraphData1 != null) {
                                // Create a map for quick lookup of costs by operator
                                final Map<String, dynamic> operatorCosts = {
                                  for (final entry in pieGraphData1)
                                    entry['operator']: entry['cost']
                                };

                                for (final entry in columnGraphData) {
                                  final operator = entry['operator'];
                                  final count = entry['count'];
                                  final cost = operatorCosts[operator] ??
                                      0.0; // Get the cost, default to 0.0 if missing
                                  rows.add([
                                    operator,
                                    count,
                                    cost
                                  ]); // Add the data row
                                }
                              }
                            }

                            if (widget.typeOfSearch == "Διελεύσεις ανά ημέρα") {
                              rows.add(["Ημέρα", "Αριθμός Διελεύσεων"]);
                              if (graphData['columnGraph'] != null) {
                                final List<dynamic> columnGraphData =
                                    graphData['columnGraph'];
                                for (final entry in columnGraphData) {
                                  rows.add([entry['date'], entry['count']]);
                                }
                              }
                            }

                            // Convert data to CSV format
                            String csv =
                                const ListToCsvConverter().convert(rows);

                            // Create a Blob and trigger download
                            final bytes = utf8.encode(
                                '\uFEFF$csv'); // Prepend BOM to the CSV content
                            final blob = html.Blob([bytes]);
                            final url = html.Url.createObjectUrlFromBlob(blob);

                            // Trigger the download
                            final anchor = html.AnchorElement(href: url)
                              ..target = 'blank'
                              ..download = 'statistics.csv'
                              ..click();

                            // Cleanup the URL
                            html.Url.revokeObjectUrl(url);
                          } catch (e) {
                            // Handle errors
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Error exporting data: $e')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFCE6AB2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                        ),
                        child: const Text(
                          "Download as CSV",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF280A7F),
                          ),
                        ),
                      ),
                      /*
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            // Fetch the graph data dynamically
                            final Map<String, dynamic> graphData =
                                await fetchGraphData(
                              widget.typeOfSearch,
                              widget.stations,
                              widget.dateFrom!,
                              widget.dateTo!,
                            );

                            // Capture images from the RepaintBoundary
                            RenderRepaintBoundary? columnGraphBoundary =
                                columnGraphKey.currentContext
                                        ?.findRenderObject()
                                    as RenderRepaintBoundary?;
                            RenderRepaintBoundary? pieChartBoundary1 =
                                pieChartKey1.currentContext?.findRenderObject()
                                    as RenderRepaintBoundary?;
                            RenderRepaintBoundary? pieChartBoundary2 =
                                pieChartKey2.currentContext?.findRenderObject()
                                    as RenderRepaintBoundary?;

                            final columnGraphImage =
                                await columnGraphBoundary?.toImage();
                            final pieChartImage1 =
                                await pieChartBoundary1?.toImage();
                            final pieChartImage2 =
                                await pieChartBoundary2?.toImage();

                            final columnGraphBytes = await columnGraphImage
                                ?.toByteData(format: ImageByteFormat.png);
                            final pieChartBytes1 = await pieChartImage1
                                ?.toByteData(format: ImageByteFormat.png);
                            final pieChartBytes2 = await pieChartImage2
                                ?.toByteData(format: ImageByteFormat.png);

                            final columnGraphUint8List =
                                columnGraphBytes?.buffer.asUint8List();
                            final pieChartUint8List1 =
                                pieChartBytes1?.buffer.asUint8List();
                            final pieChartUint8List2 =
                                pieChartBytes2?.buffer.asUint8List();

                            // Extract dynamic data for PDF content
                            final columnGraphData =
                                graphData['columnGraph'] ?? [];
                            final pieGraphData1 = graphData['pieGraph1'] ?? [];
                            final pieGraphData2 = graphData['pieGraph2'] ?? [];
/*
                            // Load the custom font
                            final font = pw.Font.ttf(await rootBundle
                                .load(GoogleFonts.robotoMono().fontFamily!));
                            // Create the PDF document

// Declare the dynamicDataSummary variable outside the conditions
                            pw.Widget dynamicDataSummary;
                            print("Column Graph Data: $columnGraphData");

// Define dynamicDataSummary based on typeOfSearch
                            if (widget.typeOfSearch == "Διελεύσεις ανά ημέρα") {
                              dynamicDataSummary = buildDynamicDataSummary(
                                "Daily passes data",
                                columnGraphData,
                                "date",
                                "count",
                                font,
                              );
                            } else if (widget.typeOfSearch ==
                                "Διελεύσεις ανά σταθμό") {
                              print("I am here");
                              dynamicDataSummary = buildDynamicDataSummary(
                                "Station passes",
                                columnGraphData,
                                "station",
                                "count",
                                font,
                              );
                            } else {
                              // Fallback or default case
                              dynamicDataSummary = buildDynamicDataSummary(
                                "Default Summary",
                                columnGraphData,
                                "label",
                                "value",
                                font,
                              );
                            }*/

                            try {
                              final pdf = pw.Document();

                              // Load the font
                              final fontData = await rootBundle
                                  .load("assets/fonts/Roboto-Black.ttf");
                              final ttf = pw.Font.ttf(fontData);
                              print("Font loaded successfully");

                              // Debug: Check data passed to the PDF
                              print(
                                  "Column Graph Data before PDF generation: $columnGraphData");

                              final List<Map<String, dynamic>> sanitizedData =
                                  columnGraphData.cast<Map<String, dynamic>>();

                              print("Sanitized Data for PDF: $sanitizedData");

                              // Build the dynamic data summary
                              final dynamicDataSummary =
                                  buildDynamicDataSummary(
                                "Station Passes",
                                sanitizedData,
                                "station",
                                "count",
                                ttf,
                              );

                              // Add a page to the PDF
                              pdf.addPage(
                                pw.Page(
                                  build: (pw.Context context) {
                                    return pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        dynamicDataSummary,
                                      ],
                                    );
                                  },
                                ),
                              );

                              // Save and download the PDF
                              final pdfBytes = await pdf.save();
                              final blob = html.Blob([pdfBytes]);
                              final url =
                                  html.Url.createObjectUrlFromBlob(blob);
                              final anchor = html.AnchorElement(href: url)
                                ..target = '_blank'
                                ..download =
                                    'statistics_with_graphs_and_data.pdf'
                                ..click();
                              html.Url.revokeObjectUrl(url);
                            } catch (e) {
                              print("Error generating PDF: $e");
                            }
                          } catch (e) {
                            // Handle errors
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Error exporting data: $e')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFCE6AB2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                        ),
                        child: const Text(
                          "Download as PDF",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF280A7F),
                          ),
                        ),
                      ),
                      */
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDescription() {
    switch (widget.typeOfSearch) {
      case "Διελεύσεις ανά ημέρα":
        return "Τα διαγράμματα αναπαριστούν το πλήθος διελεύσεων ανά ημέρα των οχημάτων από τους επιλεγμένους σταθμούς για το επιλεγμένο διάστημα ημερών.";
      case "Διελεύσεις ανά σταθμό":
        return "Τα διαγράμματα αναπαριστούν το πλήθος διελεύσεων των οχημάτων ανά σταθμό διοδίων από τους επιλεγμένους σταθμούς για το επιλεγμένο διάστημα ημερών.";
      case "Κέρδος ανά ημέρα":
        return "Τα διαγράμματα αναπαριστούν το κέρδος ανά ημέρα που υπέφεραν οι επιλεγμένοι σταθμοί για το επιλεγμένο διάστημα ημερών.";
      case "Κέρδος ανά σταθμό":
        return "Τα διαγράμματα αναπαριστούν το κέρδος ανά σταθμό διοδίων ανάλογα με τις διελεύσεων των οχημάτων από τους επιλεγμένους σταθμούς για το επιλεγμένο διάστημα ημερών.";
      case "Διελεύσεις ανά operator":
        return "Τα διαγράμματα αναπαριστούν το πλήθος διελεύσεων ανά operator των οχημάτων από τους επιλεγμένους σταθμούς για το επιλεγμένο διάστημα ημερών.";
      case "Κέρδος ανά operator":
        return "Τα διαγράμματα αναπαριστούν το κέρδος διελεύσεων ανά operator των οχημάτων από τους επιλεγμένους σταθμούς για το επιλεγμένο διάστημα ημερών.";
      case "Διελεύσεις, Κέρδη ανά operator":
        return "Τα διαγράμματα αναπαριστούν το πλήθος και το κέρδος διελεύσεων ανά operator των οχημάτων από τους επιλεγμένους σταθμούς για το επιλεγμένο διάστημα ημερών.";
      default:
        return "Δεν υπάρχουν δεδομένα για την επιλεγμένη αναζήτηση.";
    }
  }

  Future<Map<String, dynamic>> fetchGraphData(
    String typeOfSearch,
    List<String> stations,
    DateTime dateFrom,
    DateTime dateTo,
  ) async {
    try {
      print('Starting fetchGraphData...');
      print('Type of Search: $typeOfSearch');
      print('Stations: $stations');
      print(
          'Date Range: ${dateFrom.toIso8601String()} to ${dateTo.toIso8601String()}');

      // Load CSV mapping station names to IDs
      print('Loading CSV data...');
      final csvData =
          await rootBundle.loadString('assets/csv/stationstoids.csv');
      print('CSV data loaded successfully.');

      final List<List<dynamic>> rows =
          const CsvToListConverter().convert(csvData);
      final Map<String, String> stationNameToId = {
        for (var row in rows.skip(1)) row[1]: row[0], // Name -> TollID
      };

      // Handle type of search
      if (typeOfSearch == "Διελεύσεις ανά σταθμό") {
        print('Handling search: Διελεύσεις ανά σταθμό');

        // Aggregated data
        final Map<String, int> stationPassCounts = {};

        for (String station in stations) {
          print('Processing station: $station');
          final cleanedStation = station.replaceAll('"', '').trim();
          final stationId = stationNameToId[cleanedStation];

          if (stationId == null) {
            throw Exception('Station ID not found for station: $station');
          }
          print('Station ID: $stationId');

          final dateFormatter =
              DateFormat('yyyyMMdd'); // Define the date format

          final tollStationPassesUrl =
              'http://127.0.0.1:9115/api/tollStationPasses/$stationId/'
              '${dateFormatter.format(dateFrom)}/${dateFormatter.format(dateTo)}?format=json';

          print('Requesting data from URL: $tollStationPassesUrl');

          final response = await http.get(Uri.parse(tollStationPassesUrl));
          print('Response status code: ${response.statusCode}');

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            print('Data received: $data');

            // Extract the number of passes
            final int nPasses = data['nPasses'] ?? 0;

            // Update the stationPassCounts and stationPassAmounts
            stationPassCounts[station] = nPasses;

            print('Station: $station, Total Passes: $nPasses');
          } else {
            print(
                'Error fetching data for station $station: ${response.statusCode}');
            throw Exception(
                'Failed to fetch data for station $station: ${response.statusCode}');
          }
        }

        // Prepare data for charts
        print('Preparing data for charts...');
        final columnGraphData = stationPassCounts.entries
            .map((entry) => {'station': entry.key, 'count': entry.value})
            .toList();
        print('Chart data prepared.');

        return {
          'columnGraph': columnGraphData,
          'pieGraph1': columnGraphData,
          'pieGraph2': [], // Not needed for this search
        };
      }
      // Handle type of search
      if (typeOfSearch == "Κέρδος ανά σταθμό") {
        print('Handling search: Κέρδος ανά σταθμό');

        // Aggregated data
        final Map<String, double> stationPassCosts = {};

        for (String station in stations) {
          print('Processing station: $station');
          final cleanedStation = station.replaceAll('"', '').trim();
          final stationId = stationNameToId[cleanedStation];

          if (stationId == null) {
            throw Exception('Station ID not found for station: $station');
          }
          print('Station ID: $stationId');

          final dateFormatter =
              DateFormat('yyyyMMdd'); // Define the date format

          final tollStationPassesUrl =
              'http://127.0.0.1:9115/api/tollStationPasses/$stationId/${dateFormatter.format(dateFrom)}/${dateFormatter.format(dateTo)}?format=json';
          print('Requesting data from URL: $tollStationPassesUrl');

          final response = await http.get(Uri.parse(tollStationPassesUrl));
          print('Response status code: ${response.statusCode}');

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            print('Data received: $data');

            // Extract the passList
            final List<dynamic> passList = data['passList'] ?? [];

            // Calculate the total pass cost
            final double totalPassCost = passList.fold(0.0, (sum, pass) {
              return sum + (pass['passCharge'] ?? 0.0);
            });

            // Update the stationPassCosts
            stationPassCosts[station] = totalPassCost;

            print('Station: $station, Total Pass Cost: $totalPassCost');
          } else {
            print(
                'Error fetching data for station $station: ${response.statusCode}');
            throw Exception(
                'Failed to fetch data for station $station: ${response.statusCode}');
          }
        }

        // Prepare data for charts
        print('Preparing data for charts...');
        final columnGraphData = stationPassCosts.entries
            .map((entry) => {'station': entry.key, 'cost': entry.value})
            .toList();
        print('Chart data prepared.');

        return {
          'columnGraph': columnGraphData,
          'pieGraph1': columnGraphData,
          'pieGraph2': [], // Not needed for this search
        };
      }

      if (typeOfSearch == "Διελεύσεις ανά operator") {
        print('Handling search: Διελεύσεις ανά operator');

        // Aggregated data for operator pass counts
        final Map<String, int> operatorPassCounts = {};

        final List<String> stationIds = stations
            .map((station) {
              final cleanedStation = station.replaceAll('"', '').trim();
              return stationNameToId[cleanedStation];
            })
            .where((stationId) => stationId != null)
            .toList()
            .cast<String>();

        for (String operatorID in operators) {
          print('Processing operator: $operatorID');

          final loggedInID = loggedInRole == "admin"
              ? operatorMap[widget
                  .operatorforadmin] // Use operatorforadmin if logged in as admin
              : operatorMap[loggedInRole]; // Use loggedInRole otherwise
          final dateFormatter =
              DateFormat('yyyyMMdd'); // Define the date format

          final passAnalysisUrl =
              'http://127.0.0.1:9115/api/passAnalysis/$loggedInID/$operatorID/${dateFormatter.format(dateFrom)}/${dateFormatter.format(dateTo)}?format=json';
          print('Requesting data from URL: $passAnalysisUrl');

          final response = await http.get(Uri.parse(passAnalysisUrl));
          print('Response status code: ${response.statusCode}');

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            print('Data received: $data');

            // Extract the passList
            final List<dynamic> passList = data['passList'] ?? [];

            // Count the passes with a stationID in stationIds
            final int validPassCount = passList.where((pass) {
              final String stationID = pass['stationID'];
              return stationIds.contains(stationID);
            }).length;

            // Update the operatorPassCounts
            operatorPassCounts[operatorID] = validPassCount;

            print('Operator: $operatorID, Valid Passes: $validPassCount');
          } else {
            print(
                'Error fetching data for operator $operatorID: ${response.statusCode}');
            throw Exception(
                'Failed to fetch data for operator $operatorID: ${response.statusCode}');
          }
        }

        // Prepare data for the chart
        print('Preparing data for the chart...');
        final columnChartData = operatorPassCounts.entries
            .map((entry) => {'operator': entry.key, 'count': entry.value})
            .toList();
        print('Chart data prepared.');

        return {
          'columnGraph': columnChartData,
          'pieGraph1': columnChartData,
          'pieGraph2': [], // No second pie chart needed
        };
      }
      if (typeOfSearch == "Κέρδος ανά operator") {
        print('Handling search: Κέρδος ανά operator');

        // Aggregated data for operator pass counts
        final Map<String, double> operatorPassCounts = {};

        final List<String> stationIds = stations
            .map((station) {
              final cleanedStation = station.replaceAll('"', '').trim();
              return stationNameToId[cleanedStation];
            })
            .where((stationId) => stationId != null)
            .toList()
            .cast<String>();

        for (String operatorID in operators) {
          print('Processing operator: $operatorID');

          final loggedInID = loggedInRole == "admin"
              ? operatorMap[widget
                  .operatorforadmin] // Use operatorforadmin if logged in as admin
              : operatorMap[loggedInRole]; // Use loggedInRole otherwise

          final dateFormatter =
              DateFormat('yyyyMMdd'); // Define the date format

          final passAnalysisUrl =
              'http://127.0.0.1:9115/api/passAnalysis/$loggedInID/$operatorID/${dateFormatter.format(dateFrom)}/${dateFormatter.format(dateTo)}?format=json';
          print('Requesting data from URL: $passAnalysisUrl');

          final response = await http.get(Uri.parse(passAnalysisUrl));
          print('Response status code: ${response.statusCode}');

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            print('Data received: $data');

            // Extract the passList
            final List<dynamic> passList = data['passList'] ?? [];

            // Calculate the total pass cost for passes with a stationID in stationIds
            final double totalPassCost = passList.where((pass) {
              final String stationID = pass['stationID'];
              return stationIds.contains(stationID);
            }).fold(0.0, (sum, pass) {
              return sum + (pass['passCharge'] ?? 0.0);
            });

// Update the operatorPassCounts with the total cost
            operatorPassCounts[operatorID] = totalPassCost;

            print('Operator: $operatorID, Total Pass Cost: $totalPassCost');
          } else {
            print(
                'Error fetching data for operator $operatorID: ${response.statusCode}');
            throw Exception(
                'Failed to fetch data for operator $operatorID: ${response.statusCode}');
          }
        }

        // Prepare data for the chart
        print('Preparing data for the chart...');
        final columnChartData = operatorPassCounts.entries
            .map((entry) => {'operator': entry.key, 'count': entry.value})
            .toList();
        print('Chart data prepared.');

        return {
          'columnGraph': columnChartData,
          'pieGraph1': columnChartData,
          'pieGraph2': [], // No second pie chart needed
        };
      }
      if (typeOfSearch == "Διελεύσεις, Κέρδη ανά operator") {
        print('Handling search: Διελεύσεις, Κέρδη ανά operator');

        // Aggregated data for operator pass counts and costs
        final Map<String, double> operatorPassCosts =
            {}; // For total pass costs
        final Map<String, int> operatorPassCounts = {}; // For valid pass counts

        final List<String> stationIds = stations
            .map((station) {
              final cleanedStation = station.replaceAll('"', '').trim();
              return stationNameToId[cleanedStation];
            })
            .where((stationId) => stationId != null)
            .toList()
            .cast<String>();

        for (String operatorID in operators) {
          print('Processing operator: $operatorID');

          final loggedInID = loggedInRole == "admin"
              ? operatorMap[widget
                  .operatorforadmin] // Use operatorforadmin if logged in as admin
              : operatorMap[loggedInRole]; // Use loggedInRole otherwise

          final dateFormatter =
              DateFormat('yyyyMMdd'); // Define the date format

          final passAnalysisUrl =
              'http://127.0.0.1:9115/api/passAnalysis/$loggedInID/$operatorID/${dateFormatter.format(dateFrom)}/${dateFormatter.format(dateTo)}?format=json';
          print('Requesting data from URL: $passAnalysisUrl');

          final response = await http.get(Uri.parse(passAnalysisUrl));
          print('Response status code: ${response.statusCode}');

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            print('Data received: $data');

            // Extract the passList
            final List<dynamic> passList = data['passList'] ?? [];

            // Calculate the total pass cost for passes with a stationID in stationIds
            final double totalPassCost = passList.where((pass) {
              final String stationID = pass['stationID'];
              return stationIds.contains(stationID);
            }).fold(0.0, (sum, pass) {
              return sum + (pass['passCharge'] ?? 0.0);
            });

            // Count the passes with a stationID in stationIds
            final int validPassCount = passList.where((pass) {
              final String stationID = pass['stationID'];
              return stationIds.contains(stationID);
            }).length;

            // Update the operatorPassCosts and operatorPassCounts
            operatorPassCosts[operatorID] = totalPassCost;
            operatorPassCounts[operatorID] = validPassCount;

            print(
                'Operator: $operatorID, Total Pass Cost: $totalPassCost, Valid Passes: $validPassCount');
          } else {
            print(
                'Error fetching data for operator $operatorID: ${response.statusCode}');
            throw Exception(
                'Failed to fetch data for operator $operatorID: ${response.statusCode}');
          }
        }

        // Prepare data for the chart
        print('Preparing data for the chart...');
        final columnChartDataCosts = operatorPassCosts.entries
            .map((entry) => {'operator': entry.key, 'cost': entry.value})
            .toList();
        final columnChartDataCounts = operatorPassCounts.entries
            .map((entry) => {'operator': entry.key, 'count': entry.value})
            .toList();
        print('Chart data prepared.');

        return {
          'columnGraph': columnChartDataCounts, // Bar chart for pass counts
          'pieGraph1': columnChartDataCosts, // Pie chart for total pass costs
          'pieGraph2': columnChartDataCounts, // Pie chart for pass counts
        };
      }
      if (typeOfSearch == "Διελεύσεις ανά ημέρα") {
        print('Handling search: Διελεύσεις ανά ημέρα');

        // Aggregated data for daily pass counts
        final Map<String, Map<String, int>> dailyPassCounts =
            {}; // {date: {stationID: passCount}}

        final List<String> stationIds = stations
            .map((station) {
              final cleanedStation = station.replaceAll('"', '').trim();
              return stationNameToId[cleanedStation];
            })
            .where((stationId) => stationId != null)
            .toList()
            .cast<String>();

        // Iterate through each day in the date range
        DateTime currentDate = dateFrom;
        final dateFormatter = DateFormat('yyyyMMdd'); // Define the date format

        while (currentDate.isBefore(dateTo) ||
            currentDate.isAtSameMomentAs(dateTo)) {
          final String currentDateString = dateFormatter.format(currentDate);

          for (String stationID in stationIds) {
            print('Processing date: $currentDateString, station: $stationID');

            final tollPassesUrl =
                'http://127.0.0.1:9115/api/tollPasses/$stationID/$currentDateString';
            print('Requesting data from URL: $tollPassesUrl');

            final response = await http.get(Uri.parse(tollPassesUrl));
            print('Response status code: ${response.statusCode}');

            if (response.statusCode == 200) {
              final data = jsonDecode(response.body);
              print('Data received: $data');

              // Extract the number of passes
              final int totalPasses = data['totalPasses'] ?? 0;

              // Update dailyPassCounts
              if (!dailyPassCounts.containsKey(currentDateString)) {
                dailyPassCounts[currentDateString] = {};
              }
              dailyPassCounts[currentDateString]![stationID] = totalPasses;

              print(
                  'Date: $currentDateString, Station: $stationID, Passes: $totalPasses');
            } else {
              print(
                  'Error fetching data for date $currentDateString, station $stationID: ${response.statusCode}');
              throw Exception(
                  'Failed to fetch data for date $currentDateString, station $stationID: ${response.statusCode}');
            }
          }

          // Move to the next day
          currentDate = currentDate.add(const Duration(days: 1));
        }

        // Prepare data for the chart
        print('Preparing data for the chart...');
        final columnChartData = dailyPassCounts.entries.map((entry) {
          final String date = entry.key;
          final int totalPassesForDay =
              entry.value.values.reduce((a, b) => a + b);
          return {'date': date, 'count': totalPassesForDay};
        }).toList();

        print('Chart data prepared.');

        return {
          'columnGraph': columnChartData, // Bar chart for daily pass counts
          'pieGraph1': columnChartData, // Pie chart not required here
          'pieGraph2': [], // Pie chart not required here
        };
      }
      if (typeOfSearch == "Κέρδος ανά ημέρα") {
        print('Handling search: Κέρδος ανά ημέρα');

        // Aggregated data for daily pass counts
        final Map<String, Map<String, double>> dailyPassCounts =
            {}; // {date: {stationID: totalCost}}

        final List<String> stationIds = stations
            .map((station) {
              final cleanedStation = station.replaceAll('"', '').trim();
              return stationNameToId[cleanedStation];
            })
            .where((stationId) => stationId != null)
            .toList()
            .cast<String>();

        // Iterate through each day in the date range
        DateTime currentDate = dateFrom;
        final dateFormatter = DateFormat('yyyyMMdd'); // Define the date format
        while (currentDate.isBefore(dateTo) ||
            currentDate.isAtSameMomentAs(dateTo)) {
          final String currentDateString = dateFormatter.format(currentDate);

          for (String stationID in stationIds) {
            print('Processing date: $currentDateString, station: $stationID');

            final tollPassesUrl =
                'http://127.0.0.1:9115/api/tollPasses/$stationID/$currentDateString';
            print('Requesting data from URL: $tollPassesUrl');

            final response = await http.get(Uri.parse(tollPassesUrl));
            print('Response status code: ${response.statusCode}');

            if (response.statusCode == 200) {
              final data = jsonDecode(response.body);
              print('Data received: $data');

              // Extract the total cost
              final double totalCost = (data['totalCost'] ?? 0.0).toDouble();

              // Update dailyPassCounts
              if (!dailyPassCounts.containsKey(currentDateString)) {
                dailyPassCounts[currentDateString] = {};
              }
              dailyPassCounts[currentDateString]![stationID] = totalCost;

              print(
                  'Date: $currentDateString, Station: $stationID, Total Cost: $totalCost');
            } else {
              print(
                  'Error fetching data for date $currentDateString, station $stationID: ${response.statusCode}');
              throw Exception(
                  'Failed to fetch data for date $currentDateString, station $stationID: ${response.statusCode}');
            }
          }

          // Move to the next day
          currentDate = currentDate.add(const Duration(days: 1));
        }

        // Prepare data for the chart
        print('Preparing data for the chart...');
        final columnChartData = dailyPassCounts.entries.map((entry) {
          final String date = entry.key;

          // Calculate the total cost for the day
          final double totalCostForDay =
              entry.value.values.reduce((a, b) => a + b);

          return {'date': date, 'cost': totalCostForDay};
        }).toList();

        print('Chart data prepared.');

        return {
          'columnGraph': columnChartData, // Bar chart for daily total costs
          'pieGraph1': columnChartData, // Pie chart not required here
          'pieGraph2': [], // Pie chart not required here
        };
      } else {
        // Default handling for other types of searches
        print('Handling default search type.');

        final columnGraphUrl = '/api/columnGraphData';
        final pieGraphUrl1 = '/api/pieGraphData1';
        final pieGraphUrl2 = '/api/pieGraphData2';

        print('Requesting column graph data...');
        final columnResponse = await http.get(Uri.parse(columnGraphUrl));
        print('Requesting pie chart 1 data...');
        final pie1Response = await http.get(Uri.parse(pieGraphUrl1));
        print('Requesting pie chart 2 data...');
        final pie2Response = await http.get(Uri.parse(pieGraphUrl2));

        print(
            'Response statuses: ${columnResponse.statusCode}, ${pie1Response.statusCode}, ${pie2Response.statusCode}');

        if (columnResponse.statusCode == 200 &&
            pie1Response.statusCode == 200 &&
            pie2Response.statusCode == 200) {
          return {
            'columnGraph': jsonDecode(columnResponse.body),
            'pieGraph1': jsonDecode(pie1Response.body),
            'pieGraph2': jsonDecode(pie2Response.body),
          };
        } else {
          throw Exception('Failed to load graph data');
        }
      }
    } catch (e) {
      print('Error in fetchGraphData: $e');
      throw Exception('Error fetching graph data: $e');
    }
  }
}
