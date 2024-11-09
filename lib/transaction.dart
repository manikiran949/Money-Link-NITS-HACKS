import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {'name': 'Alice', 'amount': 150.0, 'date': '12/11/2024', 'isSent': true},
    {'name': 'Bob', 'amount': 200.0, 'date': '10/11/2024', 'isSent': false},
    {'name': 'Charlie', 'amount': 100.0, 'date': '05/11/2024', 'isSent': true},
    {'name': 'David', 'amount': 250.0, 'date': '01/11/2024', 'isSent': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Transactions'),
          backgroundColor: Colors.white,
      ),
      body: Container(
        color:  Colors.white, // Set background color here
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            final cardColor = index % 2 == 0 ? Colors.grey[50] : Colors.grey[200]; // Alternate colors

            return Card(
              color: cardColor,
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                leading: CircleAvatar(
                  backgroundColor: transaction['isSent'] ? Colors.red : Colors.green,
                  child: Icon(
                    transaction['isSent'] ? Icons.arrow_upward : Icons.arrow_downward,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  transaction['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text(
                  transaction['date'],
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: Text(
                  '${transaction['isSent'] ? '-' : '+'}\₹${transaction['amount'].toStringAsFixed(2)}',
                  style: TextStyle(
                    color: transaction['isSent'] ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
