// medrem_p2.dart
import 'package:flutter/material.dart';
import 'medrem_p1.dart'; // page1

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({Key? key}) : super(key: key);

  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  String _selectedHour = '1';
  String _selectedMinute = '00';
  String _selectedAmPm = 'AM';
  final _daysController = TextEditingController();
  final _instructionsController = TextEditingController();

  // Lists for hours, minutes, and AM/PM
  final List<String> _hours = List<String>.generate(12, (i) => '${i + 1}');
  final List<String> _minutes = List<String>.generate(60, (i) => i.toString().padLeft(2, '0'));
  final List<String> _amPm = ['AM', 'PM'];

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _daysController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  void _addMedicine() {
    final String time = '$_selectedHour:$_selectedMinute $_selectedAmPm';
    if (_nameController.text.isNotEmpty &&
        _amountController.text.isNotEmpty &&
        _daysController.text.isNotEmpty &&
        _instructionsController.text.isNotEmpty) {
      final newMedicine = MedicineReminder(
        name: _nameController.text,
        amount: _amountController.text,
        time: time,
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
      body: SingleChildScrollView(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: _selectedHour,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedHour = newValue!;
                    });
                  },
                  items: _hours.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Text(':'),
                DropdownButton<String>(
                  value: _selectedMinute,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedMinute = newValue!;
                    });
                  },
                  items: _minutes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: _selectedAmPm,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedAmPm = newValue!;
                    });
                  },
                  items: _amPm.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
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


