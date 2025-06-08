import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
// Conditional import for platform-specific code
import 'dart:ui' as ui show platformViewRegistry;

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class GraphSection extends StatelessWidget {
  final String typeOfSearch;
  final GlobalKey columnGraphKey;
  final GlobalKey pieChartKey1;
  final GlobalKey pieChartKey2;
  final List<Map<String, dynamic>> columnGraphData;
  final List<Map<String, dynamic>> pieGraphData1;
  final List<Map<String, dynamic>> pieGraphData2;

  const GraphSection({
    super.key,
    required this.typeOfSearch,
    required this.columnGraphKey,
    required this.pieChartKey1,
    required this.pieChartKey2,
    required this.columnGraphData,
    required this.pieGraphData1,
    required this.pieGraphData2,
  });

  @override
  Widget build(BuildContext context) {
    // Define chart titles based on typeOfSearch
    String columnChartTitle;
    String pieChart1Title;
    String pieChart2Title;

    if (typeOfSearch == "Διελεύσεις ανά operator") {
      columnChartTitle = "Operator Passes Column Chart";
      pieChart1Title = "Operator Passes Pie Chart";
      pieChart2Title = "Comparison by Operator";
    } else if (typeOfSearch == "Κέρδος ανά operator") {
      columnChartTitle = "Operator Earnings Column Chart";
      pieChart1Title = "Operator Earnings Pie Chart";
      pieChart2Title = "Comparison by Operator Earnings";
    } else if (typeOfSearch == "Διελεύσεις ανά σταθμό") {
      columnChartTitle = "Station Passes Column Chart";
      pieChart1Title = "Station Passes Pie Chart";
      pieChart2Title = "Comparison by Station";
    } else if (typeOfSearch == "Κέρδος ανά σταθμό") {
      columnChartTitle = "Station Earnings Column Chart";
      pieChart1Title = "Station Earnings Pie Chart";
      pieChart2Title = "Comparison by Station Earnings";
    } else if (typeOfSearch == "Διελεύσεις ανά ημέρα") {
      columnChartTitle = "Daily Passes Column Chart";
      pieChart1Title = "Daily Passes Pie Chart";
      pieChart2Title = "Comparison by Day";
    } else if (typeOfSearch == "Κέρδος ανά ημέρα") {
      columnChartTitle = "Daily Earnings Column Chart";
      pieChart1Title = "Daily Earnings Pie Chart";
      pieChart2Title = "Comparison by Day Earnings";
    } else {
      columnChartTitle = "Operator Passes Column Chart";
      pieChart1Title = "Operator Passes Pie Chart";
      pieChart2Title = "Operator Earnings Pie Chart";
    }

    // Check if we need three graphs
    final bool isThreeGraphs = typeOfSearch == "Διελεύσεις, Κέρδη ανά operator";

    return isThreeGraphs
        ? SizedBox(
            height: MediaQuery.of(context).size.height *
                1.0, // Adjust height for scroll
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: _buildChart(
                            context, columnGraphData, columnChartTitle),
                      ),
                      Flexible(
                        child:
                            _buildChart(context, pieGraphData1, pieChart1Title),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0), // Space between rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Center-align the single chart
                    children: [
                      Flexible(
                        child:
                            _buildChart(context, pieGraphData2, pieChart2Title),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: _buildChart(context, columnGraphData, columnChartTitle),
              ),
              Flexible(
                child: _buildChart(context, pieGraphData1, pieChart1Title),
              ),
            ],
          );
  }

  Widget _buildChart(
    BuildContext context,
    List<Map<String, dynamic>> data,
    String chartTitle,
  ) {
    // Fallback to display an error if no data is provided
    if (data.isEmpty) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.4,
        color: Colors.grey[200],
        child: const Center(
          child: Text('No data available for this chart'),
        ),
      );
    }

    if (kIsWeb) {
      // Use both chartTitle and data.hashCode for a unique viewId
      final String viewId = '${chartTitle.hashCode}_${data.hashCode}';
      ui.platformViewRegistry.registerViewFactory(
        viewId,
        (int viewId) {
          final iframe = IFrameElement()
            ..srcdoc = _generateHtmlForChart(data, chartTitle)
            ..style.border = 'none';
          return iframe;
        },
      );

      return RepaintBoundary(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.4,
          color: Colors.white,
          child: HtmlElementView(viewType: viewId),
        ),
      );
    }

    // Non-web fallback
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.grey[200],
      child: const Center(
        child: Text('WebView not supported on this platform'),
      ),
    );
  }

  String _generateHtmlForChart(
      List<Map<String, dynamic>> data, String chartTitle) {
    // Process the data to generate the rows for the chart
    final dataRows = data.map((row) {
      final label = row['station'] ??
          row['label'] ??
          row['date'] ??
          row['operator'] ??
          'Unknown';
      final value = row['count'] ?? row['amount'] ?? row['cost'] ?? 0;
      return "{ name: '$label', y: $value }";
    }).join(',');

    return '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>$chartTitle</title>
  <script src="https://code.highcharts.com/10/highcharts.js"></script>
  <script src="https://code.highcharts.com/10/modules/exporting.js"></script>
  <script src="https://code.highcharts.com/10/modules/export-data.js"></script>
  <script src="https://code.highcharts.com/10/modules/accessibility.js"></script>
  <style>
    /* Ensure the container fills the parent widget and maintains responsiveness */
    html, body {
      margin: 0;
      padding: 0;
      width: 100%;
      height: 100%;
    }
    #container {
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
  </style>
</head>
<body>
  <!-- The container for the Highcharts graph -->
  <div id="container"></div>
  <noscript>
    <p>JavaScript is required to view this chart. Please enable JavaScript in your browser.</p>
  </noscript>

  <script>
    let chart; // Declare the chart variable globally

    document.addEventListener('DOMContentLoaded', function () {
      chart = Highcharts.chart('container', {
        chart: {
          type: '${chartTitle.contains('Pie') ? 'pie' : 'column'}',
          height: null, // Allows Highcharts to adapt to the container height
        },
        title: {
          text: '$chartTitle',
        },
        tooltip: {
          pointFormat: '${chartTitle.contains('Pie') ? '{series.name}: <b>{point.percentage:.1f}%</b>' : '<b>{point.name}</b>: {point.y}'}',
        },
        accessibility: {
          point: {
            valueSuffix: '${chartTitle.contains('Pie') ? '%' : ''}',
          },
        },
        plotOptions: {
          ${chartTitle.contains('Pie') ? 'pie' : 'column'}: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
              enabled: true,
              format: '${chartTitle.contains('Pie') ? '<b>{point.name}</b>: {point.percentage:.1f} %' : '<b>{point.name}</b>: {point.y}'}',
            },
          },
        },
        series: [
          {
            name: '${chartTitle.contains('Pie') ? 'Percentage' : 'Frequency'}',
            colorByPoint: true,
            data: [$dataRows],
          },
        ],
      });

      // Function to export chart as image
      window.exportChartAsImage = function (filename = 'chart') {
        chart.exportChartLocal({
          type: 'image/png',
          filename: filename,
        });
      };
    });
  </script>
</body>
</html>
  ''';
  }
}
