import 'package:flutter/material.dart';
import '../globals.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD6F4), // Background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center the content
            children: [
              // Header Row with Logo, Title, and Logout
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo and Title
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/logo.png", // Replace with your logo asset path
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
                  // Top-right Widget: Role and Logout
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        loggedInRole ?? "Role", // Display the global role
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

              const SizedBox(height: 20), // Space after header

              // Centered Dashboard Title
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF280A7F),
                  ),
                ),
              ),

              const SizedBox(height: 150), // Space after title

              // Buttons and Hover Text
              Expanded(
                child: Row(
                  children: [
                    // Buttons Column
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First Feature Box
                          HoverFeatureBox(
                            iconPath: "assets/images/debts_icon.png",
                            title: "Επισκόπηση χρεών",
                            hoverText:
                                "Εδώ μπορείτε να δείτε τις οφειλές των άλλων αυτοκινητόδρομων προς εσάς "
                                "αλλά και τις δικές σας οφειλές προς κάθε άλλον αυτοκινητόδρομο, ανάλογα "
                                "με το πλήθος και το κόστος των διελεύσεων που έκαναν οι κάτοχοι των "
                                "διαφορετικών πομποδεκτών.",
                            onTap: () {
                              if (loggedInRole == "admin") {
                                // Navigate to SelectOperatorScreen for admin
                                Navigator.pushNamed(context, '/selectoperator');
                              } else {
                                // Navigate directly to DebtsScreen for non-admin users
                                Navigator.pushNamed(
                                  context,
                                  '/debts',
                                  arguments: {
                                    'loggedInRole': loggedInRole,
                                    'selectedOperator':
                                        loggedInRole, // Use the logged-in user as the operator
                                  },
                                );
                              }
                            },
                          ),

                          const SizedBox(height: 100), // Space between boxes

                          // Second Feature Box
                          HoverFeatureBox(
                            iconPath: "assets/images/statistics_icon.png",
                            title:
                                "Αναζήτηση και προβολή στατιστικών δεδομένων",
                            hoverText:
                                "Εδώ μπορείτε να εισάγετε τις παραμέτρους αναζήτησης που επιθυμείτε, και "
                                "να λάβετε στατιστικά δεδομένα διαφορετικών κατηγοριών.",
                            onTap: () {
                              Navigator.pushNamed(context, '/statistics');
                            },
                          ),
                        ],
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

// HoverFeatureBox Widget for Feature Cards
class HoverFeatureBox extends StatefulWidget {
  final String iconPath;
  final String title;
  final String hoverText;
  final VoidCallback onTap;

  const HoverFeatureBox({
    required this.iconPath,
    required this.title,
    required this.hoverText,
    required this.onTap,
    super.key,
  });

  @override
  _HoverFeatureBoxState createState() => _HoverFeatureBoxState();
}

class _HoverFeatureBoxState extends State<HoverFeatureBox> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFC774C9), // Box color
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Icon
                  Image.asset(
                    widget.iconPath,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  // Texts
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isHovered)
          const SizedBox(width: 20), // Space between button and hover text
        if (isHovered)
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFC774C9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.hoverText,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF280A7F),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
      ],
    );
  }
}
