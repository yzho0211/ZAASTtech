import 'package:flutter/material.dart';
import 'appointments_p1.dart';

class AppointmentsPage2 extends StatefulWidget {
  const AppointmentsPage2({Key? key}) : super(key: key);

  @override
  _AppointmentsPage2State createState() => _AppointmentsPage2State();
}

class _AppointmentsPage2State extends State<AppointmentsPage2> {
  final _nameController = TextEditingController();
  final _doctorController = TextEditingController();
  final _timeController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _nameController.dispose();
    _doctorController.dispose();
    _timeController.dispose();
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
    if (_nameController.text.isNotEmpty &&
        _doctorController.text.isNotEmpty &&
        _timeController.text.isNotEmpty &&
        _selectedDate != null) {
      final newAppointment = Appointment(
        name: _nameController.text,
        doctor: _doctorController.text,
        time: _timeController.text,
        date: _selectedDate!,
      );
      appointmentsList.add(newAppointment);
      Navigator.pop(context); // Return to the previous screen
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
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Appointment Name'),
            ),
            TextField(
              controller: _doctorController,
              decoration: const InputDecoration(labelText: 'Doctor'),
            ),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(labelText: 'Time'),
            ),
            ListTile(
              title: const Text('Select Date'),
              subtitle: Text(
                _selectedDate == null ? 'No date chosen' : _selectedDate!.toLocal().toString(),
              ),
              onTap: () => _selectDate(context),
            ),
            ElevatedButton(
              onPressed: _addAppointment,
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
