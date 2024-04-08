import 'package:flutter/material.dart';
import 'refills_p1.dart';

class RefillsPage2 extends StatefulWidget {
  const RefillsPage2({Key? key}) : super(key: key);

  @override
  _RefillsPage2State createState() => _RefillsPage2State();
}

class _RefillsPage2State extends State<RefillsPage2> {
  final _medicineNameController = TextEditingController();
  final _amountController = TextEditingController();
  final _timesPerDayController = TextEditingController();
  final _selectedDateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _medicineNameController.dispose();
    _amountController.dispose();
    _timesPerDayController.dispose();
    _selectedDateController.dispose();
    super.dispose();
  }

  void _addRefillReminder() {
    if (_medicineNameController.text.isNotEmpty &&
        _amountController.text.isNotEmpty &&
        _timesPerDayController.text.isNotEmpty &&
        _selectedDateController.text.isNotEmpty) {
      final newRefill = Refill(
        medicineName: _medicineNameController.text,
        totalTablets: int.parse(_amountController.text),
        tabletsPerDay: int.parse(_timesPerDayController.text),
        reminderDate: _selectedDateController.text,
      );
      // refillsList.add(newRefill);
      Navigator.pop(context, newRefill); // Return to previous screen
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Refill Reminder'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _medicineNameController,
              decoration: const InputDecoration(labelText: 'Medicine Name'),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _timesPerDayController,
              decoration: const InputDecoration(labelText: 'Times per day'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _selectedDateController,
              decoration: const InputDecoration(labelText: 'Duration'),
            ),
            // ListTile(
            //   title: const Text('Choose Reminder Date'),
            //   subtitle: Text(
            //     _selectedDate == null ? 'No date chosen!' : _selectedDate.toString(),
            //   ),
            //   onTap: () => _selectDate(context),
            // ),
            ElevatedButton(
              onPressed: _addRefillReminder,
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
