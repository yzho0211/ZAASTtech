import 'package:flutter/material.dart';
import 'appointments_p2.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'doctor': doctor,
      'time': time,
      'date': date.toString()
    };
  }
}

// Global example data list for appointments
List<Appointment> appointmentsList = [
  // Example appointments
  // Add more appointments here
];

class AppointmentsPage1 extends StatelessWidget {
  const AppointmentsPage1({Key? key}) : super(key: key);

  static const platform = MethodChannel('flutter.java.channel');
  static String _dataJavaToFlutter = "";
  static String _dataFlutterToJava = "";

  static Future<void> _invokeAndroidMethod() async {
    try {
      final String result = await platform.invokeMethod('receiveDataFromJava');
      print('Result from Android: $result');
    } on PlatformException catch (e) {
      print('Error: ${e.message}');
    }
  }

  void sendDataToJava(String data) async {
    // Example: Sending data to Java
    // print("Sending appointment data");
    // print(data);
    try {
      await platform.invokeMethod('sendAppointmentDataToJava', data);
    } on PlatformException catch (e) {
      print("Failed to send data to Java: '${e.message}'.");
    }
  }

  static void setDataFromAndroid(String data) {
    _dataJavaToFlutter = data;
  }

  void sendMessage() {
    _dataFlutterToJava =
        jsonEncode(appointmentsList.map((e) => e.toJson()).toList());
    print(_dataFlutterToJava);
    sendDataToJava(_dataFlutterToJava);
  }

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
            subtitle: Text(
                '${appointment.doctor} - ${appointment.time} - ${appointment.date.toLocal()}'),
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
          ).then(((context) => (sendMessage())));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
