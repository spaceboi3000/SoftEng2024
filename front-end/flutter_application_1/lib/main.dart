import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/statistics_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/statistics_result_screen.dart';
import 'screens/error_screen.dart';
import 'screens/debts_screen.dart';
import 'screens/select_operator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pass4All',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/error') {
          final args =
              settings.arguments as Map<String, dynamic>?; // Error arguments
          return MaterialPageRoute(
            builder: (context) => ErrorScreen(
              errorMessage: args?['errorMessage'] ?? "An error occurred.",
              buttonText: args?['buttonText'] ?? "Go Back",
              onButtonPressed: args?['onButtonPressed'] ??
                  () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
            ),
          );
        }

        if (settings.name == '/statisticsresults') {
          final args = settings.arguments as Map<String, dynamic>?;
          return MaterialPageRoute(
            builder: (context) {
              final Map<String, dynamic> arguments =
                  args ?? {}; // Ensure args is not null

              return StatisticsResultsScreen(
                typeOfSearch: arguments['typeOfSearch'] ?? "Unknown",
                dateFrom: arguments['dateFrom'] != null
                    ? DateTime.parse(arguments['dateFrom'])
                    : DateTime.now(), // Provide a default value
                dateTo: arguments['dateTo'] != null
                    ? DateTime.parse(arguments['dateTo'])
                    : DateTime.now(), // Provide a default value
                stations: arguments['stations'] != null
                    ? List<String>.from(arguments['stations'])
                    : [], // Default to an empty list
                operatorforadmin: arguments['operator'] ??
                    "", // Default to an empty string if not provided
              );
            },
          );
        }

        if (settings.name == '/debts') {
          final args = settings.arguments as Map<String, dynamic>?;
          return MaterialPageRoute(
            builder: (context) => DebtsScreen(
              loggedInRole: args?['loggedInRole'] ?? "Unknown",
              selectedOperator: args?['selectedOperator'] ?? "Unknown",
            ),
          );
        }

        // Standard routes
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (context) => const WelcomeScreen());
          case '/login':
            return MaterialPageRoute(builder: (context) => const LoginScreen());
          case '/dashboard':
            return MaterialPageRoute(
                builder: (context) => const DashboardScreen());
          case '/statistics':
            return MaterialPageRoute(
                builder: (context) => const StatisticsScreen());
          case '/selectoperator':
            return MaterialPageRoute(
                builder: (context) => const SelectOperatorScreen());
          default:
            return MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
            );
        }
      },
    );
  }
}
