import 'package:flutter/material.dart';

class Borrower {
  final String name;
  final double cibilScore;

  Borrower(this.name, this.cibilScore);
}

class BorrowerListPage extends StatelessWidget {
  final List<Borrower> borrowers = [
    Borrower("John Doe", 75.0),
    Borrower("Jane Smith", 85.0),
    Borrower("Robert Brown", 60.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Borrower"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: borrowers.length,
        itemBuilder: (context, index) {
          final borrower = borrowers[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 5,
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                "${borrower.name}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("CIBIL: ${borrower.cibilScore}%"),
              onTap: () {
                // Navigate to loan details form with the selected borrower
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoanDetailsPage(borrower: borrower),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class LoanDetailsPage extends StatefulWidget {
  final Borrower borrower;

  LoanDetailsPage({required this.borrower});

  @override
  _LoanDetailsPageState createState() => _LoanDetailsPageState();
}

class _LoanDetailsPageState extends State<LoanDetailsPage> {
  TextEditingController maxAmountController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loan Details for ${widget.borrower.name}"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Display CIBIL score with a progress bar
              Text(
                "CIBIL Score: ${widget.borrower.cibilScore}%",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              LinearProgressIndicator(
                value: widget.borrower.cibilScore / 100,
                backgroundColor: Colors.grey[300],
                color: widget.borrower.cibilScore >= 75
                    ? Colors.green
                    : widget.borrower.cibilScore >= 50
                    ? Colors.orange
                    : Colors.red,
                minHeight: 8,
              ),
              SizedBox(height: 30),

              // Max amount input
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: maxAmountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Max Amount You Can Lend",
                    prefixIcon: Icon(Icons.money),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),

              // Interest rate input
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: interestRateController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Interest Rate (%)",
                    prefixIcon: Icon(Icons.percent),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.blueAccent, // Replaced 'primary' with 'backgroundColor'
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (maxAmountController.text.isNotEmpty &&
                      interestRateController.text.isNotEmpty) {
                    final maxAmount = double.parse(maxAmountController.text);
                    final interestRate =
                    double.parse(interestRateController.text);

                    // Perform action like sending the request to backend
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Loan Request Sent"),
                          content: Text(
                            "You are lending \$${maxAmount} at ${interestRate}% interest to ${widget.borrower.name}.",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Show error if fields are empty
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Please fill all fields."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text("Send Request"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
