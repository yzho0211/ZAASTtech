import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/refill.dart';

//list of refills
List<Refill> refillsList = [];

class Refills extends StatelessWidget {
  const Refills({Key? key}) : super(key: key);

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
    try {
      await platform.invokeMethod('sendRefillDataToJava', data);
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
            subtitle: Text('Duration: ${refillsList[index].duration}'),
            onTap: () {
              // Logic to display refill details or navigate to another page
            },
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result =
              await Navigator.pushNamed(context, '/add_refill') as Refill?;
          if (result != null) {
            addReminder(result);
            sendMessage();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
