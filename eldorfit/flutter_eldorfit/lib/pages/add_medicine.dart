// medrem_p2.dart
import 'package:flutter/material.dart';
import '../models/medicine.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _daysController = TextEditingController();
  final _instructionsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List<String> _TimeOfDay = ['Morning', 'Afternoon', 'Evening', 'Night'];
  final List<bool> _selectedTimeOfDay = [false, false, false, false];

  final List<String> _DaysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  final List<bool> _selectedDaysOfWeek = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _daysController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  void _addMedicine() {
    // final String time = '$_selectedHour:$_selectedMinute $_selectedAmPm';
    if (_nameController.text.isNotEmpty &&
        _amountController.text.isNotEmpty &&
        _instructionsController.text.isNotEmpty) {
      List<String> checkedtime = [];
      for (int i = 0; i < _TimeOfDay.length; i++) {
        if (_selectedTimeOfDay[i]) {
          checkedtime.add(_TimeOfDay[i]);
        }
      }
      List<String> checkedday = [];
      for (int i = 0; i < _DaysOfWeek.length; i++) {
        if (_selectedDaysOfWeek[i]) {
          checkedday.add(_DaysOfWeek[i]);
        }
      }
      final newMedicine = Medicine(
        name: _nameController.text,
        amount: _amountController.text,
        time: checkedtime,
        days: checkedday,
        instructions: _instructionsController.text,
      );
      Navigator.pop(context,
          newMedicine); // Return the new reminder to the previous screen
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
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
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
                    labelText: 'Number of tablets per dose',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Select time of the day for medicine doses",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: _TimeOfDay.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(_TimeOfDay[index]),
                        value: _selectedTimeOfDay[index],
                        onChanged: (value) {
                          setState(() {
                            _selectedTimeOfDay[index] = value!;
                          });
                        },
                      );
                    }),
                SizedBox(height: 20.0),
                Text(
                  "Select days for medicine doses",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: _DaysOfWeek.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(_DaysOfWeek[index]),
                        value: _selectedDaysOfWeek[index],
                        onChanged: (value) {
                          setState(() {
                            _selectedDaysOfWeek[index] = value!;
                          });
                        },
                      );
                    }),
                SizedBox(height: 20.0),
                TextFormField(
                    controller: _instructionsController,
                    decoration: const InputDecoration(
                      labelText: 'Instructions (e.g., After Food)',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    )),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _addMedicine,
                  child: const Text('Remind Me'),
                ),
              ],
            ),
          ),
        ));
  }
}
