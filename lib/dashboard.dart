import 'package:flutter/material.dart';
import 'dart:math';

// Assuming these are the pages you want to navigate to
import 'shggroups.dart';
import 'transaction.dart';
import 'reqmoney.dart';
import 'lendmoney.dart';
import 'debtmoney.dart';
import 'Bot.dart';

import 'package:flutter/material.dart';

import 'dart:math';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isBalanceVisible = false;
  final double availableBalance = 10000.0; // Example balance in rupees
  final double creditScore = 758.33; // Example credit score

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.grey,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Credit Score Section
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: const Text(
                  'Credit Score',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
              ),
              // Custom Semi-Circular Credit Score Indicator
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(225, 225),
                      painter: CreditScorePainter(percentage: creditScore / 850, creditScore: '$creditScore'),
                    ),
                    Positioned(
                      left: 80,
                      top: 100, // Align y-coordinate with circle center
                      child: Text(
                        "300",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 80,
                      top: 100, // Align y-coordinate with circle center
                      child: Text(
                        "850",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Text(
                      "$creditScore",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Grid of items with updated colors
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blueGrey[50],
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () => _onItemClick(context, index),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _getTitle(index),
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            if (index == 2) // Available Balance section
                              Column(
                                children: [
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _isBalanceVisible ? '₹$availableBalance' : '*******',
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          _isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isBalanceVisible = !_isBalanceVisible;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
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

      // Floating Action Button for ChatBot Icon
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to AskQuestionScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AskQuestionScreen()),
          );
        },
        child: const Icon(Icons.chat_bubble, size: 30,color:Colors.white),  // Chatbot icon
        backgroundColor: Colors.blue,  // Customize the color
      ),
    );
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

  // Handle item clicks
  void _onItemClick(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DebtMoneyPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TransactionPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SghGroupsPage()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoanForm()),
        );
        break;
      case 5:
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

class CreditScorePainter extends CustomPainter {
  final double percentage;
  final String creditScore;

  CreditScorePainter({required this.percentage, required this.creditScore});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY) - 10;

    // Draw red arc
    paint.color = Colors.red;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      pi, // Start angle
      pi / 3, // Sweep angle
      false,
      paint,
    );

    // Draw yellow arc
    paint.color = Colors.yellow;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      pi + pi / 3, // Start angle
      pi / 3, // Sweep angle
      false,
      paint,
    );

    // Draw green arc
    paint.color = Colors.green;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      pi + 2 * pi / 3, // Start angle
      pi / 3, // Sweep angle
      false,
      paint,
    );

    // Draw indicator based on percentage of credit score
    paint.color = Color(0xFF3A3A3A);
    paint.style = PaintingStyle.fill;
    double angle = pi + pi / 3 + (pi * 2 / 3 * percentage); // Adjust for the percentage
    double indicatorX = centerX + radius * cos(angle);
    double indicatorY = centerY + radius * sin(angle);
    canvas.drawCircle(Offset(indicatorX, indicatorY), 10, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SemiCirclePainter extends CustomPainter {
  final double percentage;
  final String credit_score;

  SemiCirclePainter({required this.percentage, required this.credit_score});

  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = SweepGradient(
      colors: [
        Colors.red[800]!,
        Colors.red[400]!,
        Colors.orange,
        Colors.lightGreen,
        Colors.green[800]!,
      ],
      stops: [0.5, 0.675, 0.75, 0.875, 1.0],
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: size.width / 2))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    final Rect rect = Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: size.width / 2);
    final double startAngle = 3.14;
    final double sweepAngle = 3.14 * percentage;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

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
    } else {
      textColor = Colors.red[800]!;
    }

    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: credit_score,
        style: TextStyle(
          color: textColor,
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: size.width);

    final Offset textPosition = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2 + 50,
    );

    textPainter.paint(canvas, textPosition);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
