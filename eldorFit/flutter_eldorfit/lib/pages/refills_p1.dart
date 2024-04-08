import 'package:flutter/material.dart';
import 'refills_p2.dart';
//--------COPY----------
import 'package:flutter/services.dart';
import 'dart:convert';
//--------THIS----------

class Refill {
  String medicineName;
  int totalTablets;
  int tabletsPerDay;
  String reminderDate;

  Refill({
    required this.medicineName,
    required this.totalTablets,
    required this.tabletsPerDay,
    required this.reminderDate,
  });

  int get pillsLeft =>
      totalTablets -
      tabletsPerDay; //* DateTime.now().difference(reminderDate).inDays;

  bool get isReminderDue => pillsLeft <= 5 * tabletsPerDay;

  //-----------COPY----------------
  Map<String, dynamic> toJson() {
    return {
      'name': medicineName,
      'amount': totalTablets,
      'timesPerDay': tabletsPerDay,
      'quantity': reminderDate
    };
  }
  //------------HERE--------------
}

//list of refills
List<Refill> refillsList = [
  // Example refill with logic to calculate the remaining pills and reminder date
  Refill(
    medicineName: 'Aspirin',
    totalTablets: 120,
    tabletsPerDay: 2,
    reminderDate: "12", //DateTime.now().add(Duration(days: (120 / 2).floor())),
  ),
  // Add more refills here
];

class RefillsPage1 extends StatelessWidget {
  const RefillsPage1({Key? key}) : super(key: key);

  //TODO : Copy this
  //------------------- FROM HERE -------------------------

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
    try {
      await platform.invokeMethod('sendDataToJava', data);
    } on PlatformException catch (e) {
      print("Failed to send data to Java: '${e.message}'.");
    }
  }

  static void setDataFromAndroid(String data) {
    _dataJavaToFlutter = data;
  }

  void sendMessage() {
    _dataFlutterToJava =
        jsonEncode(refillsList.map((e) => e.toJson()).toList());
    sendDataToJava(_dataFlutterToJava);
  }

  void addReminder(Refill refill) {
    refillsList.add(refill);
  }
  //---------------------- TO HERE ---------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Refills'),
      ),
      body: ListView.builder(
        itemCount: refillsList.length,
        itemBuilder: (context, index) {
          // final refill = refillsList[index];
          return Card(
              child: ListTile(
            title: Text(refillsList[index].medicineName),
            subtitle: Text('Pills left: ${refillsList[index].pillsLeft}'),
            trailing: refillsList[index].isReminderDue
                ? const Icon(Icons.alarm, color: Colors.red)
                : null,
            onTap: () {
              // Logic to display refill details or navigate to another page
            },
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RefillsPage2()),
          ).then((refill) {
            addReminder(refill);
            sendMessage();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
