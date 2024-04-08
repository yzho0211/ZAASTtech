// medrem_p2.dart
import 'package:flutter/material.dart';
import 'medrem_p1.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({Key? key}) : super(key: key);

  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _timeController = TextEditingController();
  final _daysController = TextEditingController();
  final _instructionsController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _timeController.dispose();
    _daysController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  void _addMedicine() {
    if (_nameController.text.isNotEmpty &&
        _amountController.text.isNotEmpty &&
        _timeController.text.isNotEmpty &&
        _daysController.text.isNotEmpty &&
        _instructionsController.text.isNotEmpty) {
      final newMedicine = MedicineReminder(
        name: _nameController.text,
        amount: _amountController.text,
        time: _timeController.text,
        days: _daysController.text,
        instructions: _instructionsController.text,
      );
      Navigator.pop(context, newMedicine); // Return the new reminder to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medicine'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Medicine Name'),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount (e.g., 2 tablets)'),
            ),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(labelText: 'Time (e.g., 09:00 AM)'),
            ),
            TextField(
              controller: _daysController,
              decoration: const InputDecoration(labelText: 'Days (e.g., Every Day)'),
            ),
            TextField(
              controller: _instructionsController,
              decoration: const InputDecoration(labelText: 'Instructions (e.g., After Food)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addMedicine,
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

