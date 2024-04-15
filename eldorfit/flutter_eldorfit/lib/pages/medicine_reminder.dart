// medrem_p1.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/medicine.dart';

class MedicineReminders extends StatefulWidget {
  const MedicineReminders({Key? key}) : super(key: key);

  // Static list to simulate global behavior

  @override
  _MedicineRemindersState createState() => _MedicineRemindersState();
}

class _MedicineRemindersState extends State<MedicineReminders> {
  static const platform = MethodChannel('flutter.java.channel');
  static String _dataFlutterToJava = "";
  static List<Medicine> medicineReminders = [];

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
      await platform.invokeMethod('sendMedicineDataToJava', data);
    } on PlatformException catch (e) {
      print("Failed to send data to Java: '${e.message}'.");
    }
  }

  static void setDataFromAndroid(String data) {}

  void sendMessage() {
    _dataFlutterToJava =
        jsonEncode(medicineReminders.map((e) => e.toJson()).toList());
    print(_dataFlutterToJava);
    sendDataToJava(_dataFlutterToJava);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Medicine Reminders'),
      ),
      body: ListView.builder(
        itemCount: medicineReminders.length,
        itemBuilder: (context, index) {
          final item = medicineReminders[index];
          return Card(
            child: ListTile(
              title: Text('${item.name}'),
              subtitle: Text('${item.amount}, ${item.instructions}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Handle the tap if needed, perhaps to edit the reminder
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result =
              await Navigator.pushNamed(context, '/add_medicine') as Medicine?;
          // If a result was returned, add it to the list and refresh the state
          if (result != null) {
            medicineReminders.add(result);
            sendMessage();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
