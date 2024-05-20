import 'package:flutter/material.dart';
import '../models/appointment.dart';

class AddAppointment extends StatefulWidget {
  const AddAppointment({Key? key}) : super(key: key);

  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  final _nameController = TextEditingController();
  final _doctorController = TextEditingController();
  String _selectedHour = '1';
  String _selectedMinute = '00';
  String _selectedAmPm = 'AM';
  DateTime? _selectedDate;
  final _formKey = GlobalKey<FormState>();
  // Lists for hours, minutes, and AM/PM
  final List<String> _hours = List<String>.generate(12, (i) => '${i + 1}');
  final List<String> _minutes =
      List<String>.generate(60, (i) => i.toString().padLeft(2, '0'));
  final List<String> _amPm = ['AM', 'PM'];

  @override
  void dispose() {
    _nameController.dispose();
    _doctorController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _addAppointment() {
    final String time = '$_selectedHour:$_selectedMinute $_selectedAmPm';
    if (_nameController.text.isNotEmpty &&
        _doctorController.text.isNotEmpty &&
        _selectedDate != null) {
      final newAppointment = Appointment(
        name: _nameController.text,
        doctor: _doctorController.text,
        time: time,
        date: _selectedDate!,
      );
      //TODO add appointment reference
      // print("Navigator.pop");
      Navigator.pop(context, newAppointment); // Return to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Appointment'),
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
                    labelText: 'Appointment at',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }

                    final nameRegExp = RegExp(r'^[a-zA-Z ]+$');
                    if (!nameRegExp.hasMatch(value)) {
                      return 'Name must contain only letters and spaces';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _doctorController,
                  decoration: const InputDecoration(
                    labelText: 'Appointment with',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }

                    final nameRegExp = RegExp(r'^[a-zA-Z ]+$');
                    if (!nameRegExp.hasMatch(value)) {
                      return 'Name must contain only letters and spaces';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20.0),
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
                      items:
                          _hours.map<DropdownMenuItem<String>>((String value) {
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
                      items: _minutes
                          .map<DropdownMenuItem<String>>((String value) {
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
                      items:
                          _amPm.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                ListTile(
                  title: const Text('Select Appointment Date'),
                  subtitle: Text(
                    _selectedDate == null
                        ? 'No date chosen'
                        : _selectedDate!.toLocal().toString(),
                  ),
                  onTap: () => _selectDate(context),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _addAppointment();
                    }
                  },
                  child: const Text('Remind Me'),
                ),
              ],
            ),
          ),
        ));
  }
}
