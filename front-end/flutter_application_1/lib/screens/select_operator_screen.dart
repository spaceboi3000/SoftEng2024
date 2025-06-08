import 'package:flutter/material.dart';
import 'debts_screen.dart';
import '../globals.dart';

class SelectOperatorScreen extends StatefulWidget {
  const SelectOperatorScreen({super.key});

  @override
  State<SelectOperatorScreen> createState() => _SelectOperatorScreenState();
}

class _SelectOperatorScreenState extends State<SelectOperatorScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD6F4), // Background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Row with Logo, Home Button, Title, and Logout
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

              // Title and Home Button
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
                    "Διάλεξε Λειτουργό Αυτοκινητόδρομου",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF280A7F),
                    ),
                  ),
                  const Spacer(),
                ],
              ),

              const SizedBox(height: 20), // Space after title

              // Operator Selection Buttons
              Expanded(
                child: ListView.builder(
                  itemCount: operators.length,
                  itemBuilder: (context, index) {
                    final operator = operators[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the buttons horizontally
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigate to DebtsScreen with the selected operator
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DebtsScreen(
                                    loggedInRole: "admin",
                                    selectedOperator: operator,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center, // Center the text
                              decoration: BoxDecoration(
                                color: const Color(0xFFC774C9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                              constraints: const BoxConstraints(
                                minWidth: 100, // Minimum width
                                maxWidth:
                                    300, // Maximum width to avoid full-row buttons
                              ),
                              child: Text(
                                operator,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
