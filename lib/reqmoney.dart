import 'package:flutter/material.dart';

class LoanForm extends StatefulWidget {
  @override
  _LoanFormState createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  final TextEditingController _amountController = TextEditingController();
  String? _selectedIntent;
  bool _isFormSubmitted = false;
  List<String> _selectedLenders = [];

  List<String> intents = [
    'Education', 'Business', 'Personal', 'Medical', 'Home Improvement', 'Car Loan', 'Vacation', 'Debt Consolidation'
  ];

  List<String> lenders = [
    'John Smith', 'Emily Johnson', 'Michael Brown', 'Sarah Davis', 'David Wilson',
    'Jennifer Martinez', 'James Anderson', 'Linda Thomas', 'Robert Jackson', 'Maria White',
    'William Harris', 'Patricia Clark', 'Christopher Lewis', 'Elizabeth Walker', 'Charles Hall',
    'Amanda Allen', 'Joseph Young', 'Margaret King', 'Richard Scott', 'Susan Adams'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Application'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!_isFormSubmitted) ...[
              Text(
                'Loan Application',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Loan Amount',
                  hintText: 'Enter the amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: _selectedIntent,
                decoration: InputDecoration(
                  labelText: 'Loan Intent',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                hint: Text('Select Loan Intent'),
                onChanged: (newValue) {
                  setState(() {
                    _selectedIntent = newValue;
                  });
                },
                items: intents.map<DropdownMenuItem<String>>((String intent) {
                  return DropdownMenuItem<String>(
                    value: intent,
                    child: Text(intent),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_amountController.text.isNotEmpty && _selectedIntent != null) {
                    setState(() {
                      _isFormSubmitted = true;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ] else ...[
              Text(
                'Select Lenders',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              // Lender selection using checkboxes
              Column(
                children: lenders.map((lender) {
                  return CheckboxListTile(
                    title: Text(lender),
                    value: _selectedLenders.contains(lender),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedLenders.add(lender);
                        } else {
                          _selectedLenders.remove(lender);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_selectedLenders.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Loan Request Sent to ${_selectedLenders.join(", ")}')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  'Ask',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
