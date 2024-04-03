import 'package:flutter/material.dart';
import 'refill_model.dart';
import 'refills.dart';

class AddRefills extends StatefulWidget {
  @override
  _AddRefillsPageState createState() => _AddRefillsPageState();
}

class _AddRefillsPageState extends State<AddRefills> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _medicineNameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _timesPerDayController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Refills'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _medicineNameController,
                decoration: InputDecoration(
                  labelText: 'Medicine Name',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter medicine name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter amount';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _timesPerDayController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Times Per Day',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter times per day';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter quantity';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    refill_reminder medicine = refill_reminder(
                      name: _medicineNameController.text,
                      amount: _amountController.text,
                      timesPerDay: _timesPerDayController.text,
                      quantity: _quantityController.text,
                    );
                    Navigator.pop(context, medicine);
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _medicineNameController.dispose();
    _amountController.dispose();
    _timesPerDayController.dispose();
    _quantityController.dispose();
    super.dispose();
  }
}
