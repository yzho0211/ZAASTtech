import 'package:flutter/material.dart';
import '../models/refill.dart';

class AddRefill extends StatefulWidget {
  const AddRefill({Key? key}) : super(key: key);

  @override
  _AddRefillState createState() => _AddRefillState();
}

class _AddRefillState extends State<AddRefill> {
  final _medicineNameController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _medicineNameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _addRefillReminder() {
    if (_medicineNameController.text.isNotEmpty &&
        _amountController.text.isNotEmpty) {
      final newRefill = Refill(
        medicineName: _medicineNameController.text,
        duration: int.parse(_amountController.text),
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
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _medicineNameController,
                  decoration: const InputDecoration(
                    labelText: 'Medicine Name',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText:
                        'Prescription Duration (Number of days is the prescription expected to last)',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                ),

                // ListTile(
                //   title: const Text('Choose Reminder Date'),
                //   subtitle: Text(
                //     _selectedDate == null ? 'No date chosen!' : _selectedDate.toString(),
                //   ),
                //   onTap: () => _selectDate(context),
                // ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _addRefillReminder,
                  child: const Text('Remind Me'),
                ),
              ],
            ),
          ),
        ));
  }
}
