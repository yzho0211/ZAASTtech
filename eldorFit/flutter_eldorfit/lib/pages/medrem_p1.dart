// medrem_p1.dart
import 'package:flutter/material.dart';
import 'medrem_p2.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class MedicineReminder {
  String name;
  String amount;
  String time;
  String days;
  String instructions;

  MedicineReminder({
    required this.name,
    required this.amount,
    required this.time,
    required this.days,
    required this.instructions,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'time': time,
      'days': days,
      'instructions': instructions
    };
  }
}

List<MedicineReminder> medicineReminders = [];

class MedicineRemindersPage1 extends StatefulWidget {
  const MedicineRemindersPage1({Key? key}) : super(key: key);

  // Static list to simulate global behavior

  @override
  _MedicineRemindersPage1State createState() => _MedicineRemindersPage1State();
}

class _MedicineRemindersPage1State extends State<MedicineRemindersPage1> {
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
      await platform.invokeMethod('sendMedicineDataToJava', data);
    } on PlatformException catch (e) {
      print("Failed to send data to Java: '${e.message}'.");
    }
  }

  static void setDataFromAndroid(String data) {
    _dataJavaToFlutter = data;
  }

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
              title: Text('${item.time} - ${item.name}'),
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
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMedicinePage()),
          ) as MedicineReminder?;
          // If a result was returned, add it to the list and refresh the state
          if (result != null) {
            setState(() {
              medicineReminders.add(result);
              sendMessage();
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
