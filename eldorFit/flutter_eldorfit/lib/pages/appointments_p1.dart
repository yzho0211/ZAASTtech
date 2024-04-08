import 'package:flutter/material.dart';
import 'appointments_p2.dart';

class Appointment {
  String name;
  String doctor;
  String time;
  DateTime date;

  Appointment({
    required this.name,
    required this.doctor,
    required this.time,
    required this.date,
  });
}

// Global example data list for appointments
List<Appointment> appointmentsList = [
  // Example appointments
  // Add more appointments here
];

class AppointmentsPage1 extends StatelessWidget {
  const AppointmentsPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Appointments'),
      ),
      body: ListView.builder(
        itemCount: appointmentsList.length,
        itemBuilder: (context, index) {
          final appointment = appointmentsList[index];
          return ListTile(
            title: Text(appointment.name),
            subtitle: Text('${appointment.doctor} - ${appointment.time} - ${appointment.date.toLocal()}'),
            onTap: () {
              // Tap action to view appointment details or edit
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AppointmentsPage2()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
