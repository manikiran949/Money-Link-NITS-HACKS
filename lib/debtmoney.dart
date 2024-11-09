import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class DebtMoneyPage extends StatelessWidget {
  final double totalDebt = 5000; // Example total debt

  final List<Map<String, dynamic>> lenders = [
    {
      'name': 'Lender A',
      'dueDate': '12/11/2024',
      'amount': 1200.0,
      'takenOn': '01/11/2024',
      'principal': 1000.0,
      'interest': 200.0,
      'interestRate': 20.0,
    },
    {
      'name': 'Lender B',
      'dueDate': '25/12/2024',
      'amount': 1800.0,
      'takenOn': '15/10/2024',
      'principal': 1500.0,
      'interest': 300.0,
      'interestRate': 20.0,
    },
    {
      'name': 'Lender C',
      'dueDate': '05/01/2025',
      'amount': 950.0,
      'takenOn': '10/11/2024',
      'principal': 800.0,
      'interest': 150.0,
      'interestRate': 18.0,
    },
    {
      'name': 'Lender D',
      'dueDate': '20/01/2025',
      'amount': 1100.0,
      'takenOn': '12/10/2024',
      'principal': 900.0,
      'interest': 200.0,
      'interestRate': 22.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debt List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.blue[50],
              margin: const EdgeInsets.only(bottom: 20.0),
              child: ListTile(
                title: const Text(
                  'Total Amount to Pay',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '\₹${totalDebt.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            // Add "Pay" button below the Total Amount to Pay
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.blue, // Customize color
                ),
                onPressed: () {
                  // Define the action for the Pay button here
                  print("Pay button pressed");
                },
                child: const Text(
                  'Pay',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20), // Space between "Pay" button and "Lenders" title
            const Text(
              'Lenders',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lenders.length,
                itemBuilder: (context, index) {
                  final lender = lenders[index];
                  // Alternate between two background colors
                  final cardColor = index % 2 == 0 ? Colors.grey[50] : Colors.grey[300];

                  return Card(
                    color: cardColor, // Apply alternating color
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lender['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildDebtDetailRow('Due Date:', lender['dueDate']),
                          _buildDebtDetailRow(
                              'Amount to Pay:', '\₹${lender['amount']}'),
                          _buildDebtDetailRow(
                              'Amount Taken On:', lender['takenOn']),
                          _buildDebtDetailRow(
                              'Principal Amount:', '\₹${lender['principal']}'),
                          _buildDebtDetailRow(
                              'Interest:', '\₹${lender['interest']} (${lender['interestRate']}%)'),
                          _buildDebtDetailRow(
                              'Total Amount:', '\₹${lender['amount']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDebtDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(value),
        ],
      ),
    );
  }
}
