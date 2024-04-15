import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
// ignore: unused_import
import '../models/appointment.dart';

// Global example data list for appointments

class Appointments extends StatelessWidget {
  const Appointments({Key? key}) : super(key: key);

  static List<Appointment> appointmentsList = [];

  static const platform = MethodChannel('flutter.java.channel');
  // ignore: unused_field
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

  void sendMessage(Appointment newAppointment) {
    appointmentsList.add(newAppointment);
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
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/add_appointment')
              as Appointment?;
          if (result != null) {
            sendMessage(result);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
