import 'package:flutter/material.dart';

class Pass4AllApp extends StatelessWidget {
  const Pass4AllApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD6F4), // Background color: #FFD6F4
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Row with Logo and Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo and Title
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/logo.png", // Replace with your actual logo path
                        height: 50,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Pass4All",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF280A7F),
                        ),
                      ),
                    ],
                  ),

                  // Log In Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFFCE6AB2), // Button color: #CE6AB2
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF280A7F),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Description Text
              const Text(
                "Καλωσορίσατε στο Πανελλήνιο Σύστημα Διαλειτουργικότητας\n\n"
                "Σκοπός του συστήματος μας είναι η υλοποίηση της διαλειτουργικότητας "
                "των συστημάτων διοδίων του ελληνικού οδικού δικτύου.\n\n"
                "Αν συνδέεστε ως κάποιος λειτουργός αυτοκινητόδρομου, μέσω αυτής "
                "της διεπαφής, έχετε πρόσβαση στα ποσά που οφείλετε στους άλλους "
                "λειτουργούς, με δυνατότητα δήλωσής τους ως εξοφλημένα, αλλά και "
                "στα ποσά που οφείλονται σε εσάς.\n\n"
                "Τα ποσά αυτά είναι οργανωμένα και συμψηφισμένα για διευκόλυνση σας "
                "και ανανεώνονται αυτόματα στο τέλος κάθε ημέρας αλλά και on-demand "
                "με το πάτημα ενός κουμπιού!\n\n"
                "Επιπλέον έχετε την δυνατότητα προβολής διαφόρων ειδών στατιστικών "
                "δεδομένων, τα οποία θα σας δώσουν μια σφαιρική εποπτεία των "
                "διελεύσεων αλλά και των κερδών σας απο κάθε είδος οχήματος, "
                "απο κάθε σταθμό και για κάθε χρονικό διάστημα που επιθυμείτε!\n\n"
                "Αν απο την άλλη συνδέεστε ως υπάλληλος του Υπουργείου Μεταφορών και "
                "Υποδομών, έχετε δυνατότητα προβολής όλων των οφειλούμενων ποσών μεταξύ "
                "των λειτουργών αλλά και διαφόρων ειδών στατιστικών δεδομένων.",
                style: TextStyle(
                  fontSize: 16, // Increased font size
                  color: Color(0xFF280A7F), // Text color: #280A7F
                  height: 1.5,
                ),
              ),

              const Spacer(), // Push content to the top

              // Footer Design
              Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Calculate dynamic size based on screen width
                      final double carWidth = constraints.maxWidth / 8;
                      final double lineWidth = constraints.maxWidth / 10;
                      final double carHeight = carWidth / 1.8;
                      final double lineHeight = lineWidth / 3;

                      return Column(
                        children: [
                          // First Row: Car -> Line -> Line -> Car -> Line -> Line
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Car
                              SizedBox(
                                width: carWidth,
                                child: Image.asset(
                                  "assets/images/car.png",
                                  height: carHeight,
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Line
                              SizedBox(
                                width: lineWidth,
                                child: Image.asset(
                                  "assets/images/line.png",
                                  height: lineHeight,
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Line
                              SizedBox(
                                width: lineWidth,
                                child: Image.asset(
                                  "assets/images/line.png",
                                  height: lineHeight,
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Car
                              SizedBox(
                                width: carWidth,
                                child: Image.asset(
                                  "assets/images/car.png",
                                  height: carHeight,
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Line
                              SizedBox(
                                width: lineWidth,
                                child: Image.asset(
                                  "assets/images/line.png",
                                  height: lineHeight,
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Line
                              SizedBox(
                                width: lineWidth,
                                child: Image.asset(
                                  "assets/images/line.png",
                                  height: lineHeight,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                              height: 10), // Adjust space between rows
                          // Second Row: Flipped Car -> Line -> Line -> Flipped Car -> Line -> Line
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Flipped Car
                              SizedBox(
                                width: carWidth,
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(
                                      3.14159), // Flip horizontally
                                  child: Image.asset(
                                    "assets/images/car.png",
                                    height: carHeight,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Line
                              SizedBox(
                                width: lineWidth,
                                child: Image.asset(
                                  "assets/images/line.png",
                                  height: lineHeight,
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Line
                              SizedBox(
                                width: lineWidth,
                                child: Image.asset(
                                  "assets/images/line.png",
                                  height: lineHeight,
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Flipped Car
                              SizedBox(
                                width: carWidth,
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(
                                      3.14159), // Flip horizontally
                                  child: Image.asset(
                                    "assets/images/car.png",
                                    height: carHeight,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Line
                              SizedBox(
                                width: lineWidth,
                                child: Image.asset(
                                  "assets/images/line.png",
                                  height: lineHeight,
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Line
                              SizedBox(
                                width: lineWidth,
                                child: Image.asset(
                                  "assets/images/line.png",
                                  height: lineHeight,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
