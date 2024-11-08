import 'package:flutter/material.dart';
import 'dart:math';

// Assuming these are the pages you want to navigate to
import 'shggroups.dart';
import 'transaction.dart';
import 'reqmoney.dart';
import 'lendmoney.dart';
import 'debtmoney.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Notification logic
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // User settings logic
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // Wrapping the body in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Credit Score Semi-Circle Indicator (Custom Widget)
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: const Text(
                  'Credit Score',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // Wrap the CustomPaint with an Expanded widget
              SizedBox(
                width: double.infinity,
                height: 150,
                child: CustomPaint(
                  painter: SemiCirclePainter(percentage: 1, credit_score: '820'),
                ),
              ),

              const SizedBox(height: 20),

              // Grid of items
              GridView.builder(
                shrinkWrap: true,  // Ensures the grid takes only necessary space
                physics: const NeverScrollableScrollPhysics(), // Disable scrolling in the grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  childAspectRatio: 1.4, // Equal height and width
                  crossAxisSpacing: 16.0, // Horizontal spacing
                  mainAxisSpacing: 16.0, // Vertical spacing
                ),
                itemCount: 6, // Number of grid items
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () => _onItemClick(context, index),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _getTitle(index),
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Icon(
                              _getIcon(index),
                              size: 22, // Make icons smaller
                              color: Colors.blueAccent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Get icon based on index
  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.money_off_outlined; // Debt money
      case 1:
        return Icons.history; // Transaction history
      case 2:
        return Icons.visibility; // Available balance
      case 3:
        return Icons.group; // SHG groups
      case 4:
        return Icons.send; // Request money
      case 5:
        return Icons.monetization_on; // Send money
      default:
        return Icons.error;
    }
  }

  // Get title based on index
  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'Debt Money';
      case 1:
        return 'Transaction History';
      case 2:
        return 'Available Balance';
      case 3:
        return 'SHG Groups';
      case 4:
        return 'Request Money';
      case 5:
        return 'Send Money';
      default:
        return 'Unknown';
    }
  }

  // On item click functionality
  void _onItemClick(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DebtMoneyPage()),
        );
        break;
      case 1:
      // Navigate to TransactionPage for both Debt Money and Transaction History
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  TransactionPage()),
        );
        break;
      case 3:
      // Navigate to SHG Groups page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  SghGroupsPage()),
        );
        break;
      case 4:
      // Navigate to Loan Form page (Request Money)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  LoanForm()),
        );
        break;
      case 5:
      // Navigate to Borrower List page (Send Money)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BorrowerListPage()),
        );
        break;
      default:
        break;
    }
  }
}

class SemiCirclePainter extends CustomPainter {
  final double percentage;
  final String credit_score;

  SemiCirclePainter({required this.percentage, required this.credit_score});

  @override
  void paint(Canvas canvas, Size size) {
    // Define the sweep gradient
    final Gradient gradient = SweepGradient(
      colors: [
        Colors.red[800]!, // Dark red
        Colors.red[400]!, // Light red
        Colors.orange,    // Orange
        Colors.lightGreen, // Light green
        Colors.green[800]!, // Dark green
      ],
      stops: [0.5, 0.675, 0.75, 0.875, 1.0], // Adjust the gradient stops
    );

    // Create the paint object and apply the gradient
    final Paint paint = Paint()
      ..shader = gradient.createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: size.width / 2))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    // Define the arc parameters
    final Rect rect = Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: size.width / 2);
    final double startAngle = 3.14; // Start at the bottom
    final double sweepAngle = 3.14 * percentage; // Fill based on percentage

    // Draw the arc with the gradient paint
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

    // Determine the text color based on the credit score range
    Color textColor;
    final int score = int.tryParse(credit_score) ?? 0;

    if (score >= 800 && score <= 850) {
      textColor = Colors.green[800]!;
    } else if (score >= 740 && score <= 799) {
      textColor = Colors.lightGreen;
    } else if (score >= 670 && score <= 739) {
      textColor = Colors.orange;
    } else if (score >= 580 && score <= 669) {
      textColor = Colors.red[400]!;
    } else if (score >= 300 && score <= 579) {
      textColor = Colors.red[800]!;
    } else {
      textColor = Colors.black; // Default color if score is invalid
    }

    // Draw the number at the center of the semi-circle with the determined text color
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: credit_score, // Display credit score as text
        style: TextStyle(
          color: textColor, // Text color based on the score
          fontSize: 48, // Font size
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: size.width);

    // Calculate the position to center the text, but move it down a bit
    final Offset textPosition = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2 + 50, // Adjust this value to move the text down
    );

    // Paint the text on the canvas
    textPainter.paint(canvas, textPosition);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
